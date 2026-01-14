# nvidia-container-toolkit

The process to allow your Docker containers to use your Nvidia GPU is, unfortunately, pretty involved compared to installing most other bits of software. Thanks Nvidia 🙄 

So, let's make this a little easier!

First, we need to install nvidia-container-toolkit. If you are on Debian/Ubuntu, you won't have the application in your package manager by default. We need to add the repository for the nvidia-container-toolkit.

## Add the Nvidia Container Toolkit repository

After running this command, we can install the toolkit...

```
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```


### OPTIONAL: Add the EXPERIMENTAL flag to the repository

I haven't had the need to use these, so the experimental flag is completely literal here. Maybe someday, but not today.

```
sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

## Install the Nvidia Container Toolkit
We can FINALLY install the toolkit now! The finish line is in sight!!!

```
sudo apt-get update
```

```
sudo apt-get install -y nvidia-container-toolkit
```

## Configure Docker & Containerd

```
sudo nvidia-ctk runtime configure --runtime=docker
sudo nvidia-ctk runtime configure --runtime=containerd
```
```
sudo systemctl restart containerd.service
sudo systemctl restart docker.service
```

## Create Startup Script to Launch the Toolkit

You might think we are done here right? Pffft, you wish. By default, the toolkit does not begin at startup. To *REALLY* make use of the toolkit, we should add a startup script to start the toolkit!

Create a file wherever you like to put your startup scripts. The location and name of the script doesn't really matter that much. You can use `~/.config/autostart/nvidia-uvm-init` if you can't think of anything. Save the following text as a script...

```
#!/usr/bin/env bash

### Script to initialize nvidia device nodes.
### https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile-verifications
### use this script at startup to enable the nvidia-container-toolkit for docker containters
### https://matthieu.yiptong.ca/tag/plex/
### https://www.reddit.com/r/qnap/comments/s7bbv6/fix_for_missing_nvidiauvm_device_devnvidiauvm/

/sbin/modprobe nvidia

if [ "$?" -eq 0 ]; then
  # original variables
  #N3D=$(echo "$NVDEVS" | grep "3D controller" | wc -l)
  #NVGA=$(echo "$NVDEVS" | grep "VGA compatible controller" | wc -l)
  #N=$(expr "$N3D" + "$NVGA" - 1)

  # Count the number of NVIDIA controllers found.
  NVDEVS=$(lspci | grep -i NVIDIA)
  N3D=$(echo "$NVDEVS" | grep -c "3D controller")
  NVGA=$(echo "$NVDEVS" | grep -c "VGA compatible controller")
  N=$(("$N3D"+"$NVGA"-1))

  for I in $(seq 0 "$N"); do
    mknod -m 666 /dev/nvidia"$I" c 195 "$I"
  done

  mknod -m 666 /dev/nvidiactl c 195 255

else
  exit 1
fi

/sbin/modprobe nvidia-uvm

if [ "$?" -eq 0 ]; then
  # Find out the major device number used by the nvidia-uvm driver
  D=$(grep nvidia-uvm /proc/devices | awk '{print $1}')

  mknod -m 666 /dev/nvidia-uvm c "$D" 0
  mknod -m 666 /dev/nvidia-uvm-tools c "$D" 0
else
  exit 1
fi
```

### Remember to chmod +x the script and to run it as root or with sudo!!!

You can have this script run at startup in many different ways, that is beyond the scope of this doc. Personally, I set up a systemd service to load the script. You can use whatever you like.

At this point, we should have the Nvidia Container Toolkit installed and configured to startup with your system. You can now use your Nvidia GPU with your Docker containers!

## Docker Compose

Adding the following to any docker-compose.yml or Portainer stack will enable GPU passthrough to your Nvidia GPU.

The nvidia-uvm and nvidia-uvm-tools will need to be loaded in your host before spinning up your compose file. Thankfully, if you followed this guide, we took care of that with the startup script.

Replace "whatever-your-service-is" with... oh, you get it...

```
services:
  whatever-your-service-is:
    environment:
      - NVIDIA_VISIBLE_DEVICES=all
      - NVIDIA_DRIVER_CAPABILITIES=all
    runtime: nvidia
    deploy:
      resources:
        reservations:
          devices:
            - capabilities: [gpu]
    devices:
      - /dev/dri/renderD128:/dev/dri/renderD128
      - /dev/dri/card0:/dev/dri/card0
      - /dev/nvidia0:/dev/nvidia0
      - /dev/nvidia-caps:/dev/nvidia-caps
      - /dev/nvidiactl:/dev/nvidiactl
      - /dev/nvidia-modeset:/dev/nvidia-modeset
      - /dev/nvidia-uvm:/dev/nvidia-uvm
      - /dev/nvidia-uvm-tools:/dev/nvidia-uvm-tools
```

## More info...

Sources & Useful Links:
[docs.nvidia.com](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
[reddir.com/r/qnap/fix_for_missing_nvidiauvm_device_devnvidiauvm](https://www.reddit.com/r/qnap/comments/s7bbv6/fix_for_missing_nvidiauvm_device_devnvidiauvm/)
[matthieu.yiptong.ca](https://matthieu.yiptong.ca/tag/plex/)
[jellyfin.org](https://jellyfin.org/docs/general/administration/hardware-acceleration/nvidia/)
