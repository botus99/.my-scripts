#!/usr/bin/env bash

# Set some variables
RETROARCHSYSTEMFOLDER="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/system"
PCSX2BIOSFOLDER="$HOME/.var/app/net.pcsx2.PCSX2/config/PCSX2/bios"
RYUNJINXFIRMMWAREFOLDER="$HOME/.var/app/org.ryujinx.Ryujinx/config/Ryujinx/firmware"
RYUNJINXPRODKEYSFOLDER="$HOME/.var/app/org.ryujinx.Ryujinx/config/Ryujinx/system"

# Function to display the main menu
show_menu() {
    local choice
    clear
    echo "Which BIOS files do you need?"
    echo "1) Arcade"
    echo "2) Nintendo - SNES / Gameboy / Gameboy Color"
    echo "3) Nintendo - GameCube/Wii"
    echo "4) Nintendo - Switch"
    echo "5) Sega - Genesis/MS/GG/CD/32x"
    echo "6) Sega - Saturn"
    echo "7) Sega - Dreamcast / Arcade Naomi"
    echo "8) Sony PS1/PSP"
    echo "9) Sony Playstation 2"
    echo "x) Exit"
    read -p "Choose your fate: " choice
    return $choice
}
# Function to download BIOS files
download_bios() {
    local console=$1
    clear
    case "$console" in
        1)
            # download Arcade BIOS
            mkdir -p $RETROARCHSYSTEMFOLDER
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/airlbios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/awbios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/bubsys.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/cchip.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/decocass.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/f355bios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/f355dlx.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/hod2bios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/isgsm.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/midssio.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/naomi.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/neogeo.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/nmk004.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/pgm.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/skns.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/ym2608.zip
            mkdir -p $RETROARCHSYSTEMFOLDER/dc/
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/airlbios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/awbios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355bios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355dlx.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/hod2bios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi2.zip
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                                Arcade systems                               #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        2)
            # download 90's Nintendo BIOS files
            mkdir -p $RETROARCHSYSTEMFOLDER
            ### SNES BIOS
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/cx4.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1.program.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1b.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1b.program.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp2.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp2.program.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp3.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp3.program.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp4.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp4.program.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st010.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st010.program.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st011.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st011.program.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st018.data.rom
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st018.program.rom
            ### Gameboy
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy/dmg_boot.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy/gb_bios.bin
            ### Gameboy Color
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy%20Color/cgb_boot.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy%20Color/gbc_bios.bin
            echo -e "\033[1;31mBIOS files for Super Nintendo, Nintendo Gameboy, and Gameboy Color successfully installed \n\033[0m"
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#             Super Nintendo, Nintendo Gameboy, and Gameboy Color             #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        3)
            # download Nintendo - GameCube / Wii BIOS files
            mkdir -p $RETROARCHSYSTEMFOLDER/dolphin-emu/
            wget -nc -P $RETROARCHSYSTEMFOLDER/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-dvd-20020823.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-ntsc-12.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-pal-12.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                           Nintendo GameCube / Wii                           #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        4)
            # download Nintendo - Switch files
            mkdir -p $RYUNJINXFIRMMWAREFOLDER
            mkdir -p $RYUNJINXPRODKEYSFOLDER
            #aria2c -x 5 --out $RYUNJINXFIRMMWAREFOLDER/Firmware.17.0.1.zip "https://archive.org/download/firmware-keys-17.0.1/Firmware.17.0.1.zip"
            #aria2c -x 5 --out $RYUNJINXPRODKEYSFOLDER/Keys_17.0.1.zip "https://archive.org/download/firmware-keys-17.0.1/Keys_17.0.1.zip"
            wget -nc -P $RYUNJINXFIRMMWAREFOLDER https://archive.org/download/firmware-keys-17.0.1/Firmware.17.0.1.zip
            wget -nc --output-document $RYUNJINXPRODKEYSFOLDER/title.keys https://archive.org/download/firmware-keys-17.0.1/Keys_17.0.1.zip/Keys%2017.0.1%2Ftitle.keys
            wget -nc --output-document $RYUNJINXPRODKEYSFOLDER/prod.keys https://archive.org/download/firmware-keys-17.0.1/Keys_17.0.1.zip/Keys%2017.0.1%2Fprod.keys
            unzip $RYUNJINXFIRMMWAREFOLDER/Firmware.17.0.1.zip -d $RYUNJINXFIRMMWAREFOLDER
            rm $RYUNJINXFIRMMWAREFOLDER/Firmware.17.0.1.zip
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                               Nintendo Switch                               #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        5)
            # download old school SEGA  BIOSes download links
            mkdir -p $RETROARCHSYSTEMFOLDER
            #### Game Gear
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Game%20Gear/bios.gg
            #### Master System
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios_E.sms
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios_J.sms
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios_U.sms
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios.sms
            #### Genesis
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/areplay.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/bios_MD.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/ggenie.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/rom.db
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/sk.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/sk2chip.bin
            #### CD
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20CD%20-%20Sega%20CD/bios_CD_E.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20CD%20-%20Sega%20CD/bios_CD_J.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20CD%20-%20Sega%20CD/bios_CD_U.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                           old school Sega consoles                          #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        6)
            # download Sega - Saturn BIOS download links
            mkdir -p $RETROARCHSYSTEMFOLDER
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/hisaturn.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-17933.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-18100.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-18811-mx.ic1
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-19367-mx.ic1
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/saturn_bios.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega1003.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega_100.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega_100a.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega_101.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/vsaturn.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                                 Sega Saturn                                 #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        7)
            # download Sega - Dreamcast BIOS files
            mkdir -p $RETROARCHSYSTEMFOLDER/dc/
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Dreamcast/dc_boot.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Dreamcast/dc_flash.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Dreamcast/naomi_boot.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/airlbios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/awbios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355bios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355dlx.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/hod2bios.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi.zip
            wget -nc -P $RETROARCHSYSTEMFOLDER/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi2.zip
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                                Sega Dreamcast                               #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        8)
            # download Sony PS1/PSP BIOS files
            mkdir -p $RETROARCHSYSTEMFOLDER
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5500.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5501.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5502.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation%20Portable/ppge_atlas.zim
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                           Sony Playstation and PSP                          #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        9)
            # download Sony Playstation 2 BIOS files
            mkdir -p $PCSX2BIOSFOLDER
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0250j-20100415.bin
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0250e-20100415.bin
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0230h-20080220.bin
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0230a-20080220.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                              Sony Playstation 2                             #"
            echo -e "#                            successfully installed                           #"
            echo -e "#=============================================================================#"
            ;;
        *)
            echo "You didn't pick one of the selected options, dummy."
            exit 1
            ;;
    esac
}
main() {
    while true; do
        show_menu
        local choice=$(($?))
        case $choice in
            1)
                download_bios "1"
                break
                ;;
            2)
                download_bios "2"
                break
                ;;
            3)
                download_bios "3"
                break
                ;;
            4)
                download_bios "4"
                break
                ;;
            5)
                download_bios "5"
                break
                ;;
            6)
                download_bios "6"
                break
                ;;
            7)
                download_bios "7"
                break
                ;;
            8)
                download_bios "8"
                break
                ;;
            9)
                download_bios "9"
                break
                ;;
            x)
                echo "OK! Exiting..."
                exit 0
                ;;
            *)
                echo "You didn't pick one of the selected options, dummy."
                ;;
        esac
    done
}
main
