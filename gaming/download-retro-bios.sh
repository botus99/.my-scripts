#!/usr/bin/env bash

# Set BIOS directories to default Flatpak locations
RETROARCHSYSTEMFOLDER="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/system"
PCSX2BIOSFOLDER="$HOME/.config/PCSX2/bios"
RYUNJINXFIRMMWAREFOLDER="$HOME/.var/app/io.github.ryubing.Ryujinx/config/Ryujinx/firmware"
RYUNJINXPRODKEYSFOLDER="$HOME/.var/app/io.github.ryubing.Ryujinx/config/Ryujinx/system"

# Function to display the main menu
show_menu() {
    local choice
    clear
    echo -e "+---------------------------------------------------------+"
    echo -e "|              Which BIOS files do you need?              |"
    echo -e "+---------------------------------------------------------+"
    echo -e "\033[32m1) Arcade\033[0m"
    echo -e "\033[31m2) Nintendo\033[0m - SNES / Gameboy / Gameboy Color"
    echo -e "\033[31m3) Nintendo\033[0m - GameCube / Wii"
    echo -e "\033[31m4) Nintendo\033[0m - Switch"
    echo -e "\033[34m5) Sega\033[0m - Genesis / MS / GG / CD / 32x"
    echo -e "\033[34m6) Sega\033[0m - Saturn"
    echo -e "\033[34m7) Sega\033[0m - Dreamcast / Naomi"
    echo -e "\033[36m8) Sony\033[0m - Playstation 1 / PSP"
    echo -e "\033[36m9) Sony\033[0m - Playstation 2"
    echo -e "\033[35mx) Exit\033[0m"
    echo -e "+---------------------------------------------------------+"
    read -p "                   Choose your fate... "  choice
    echo -e "+---------------------------------------------------------+"
    return "$choice"
}

# Function to download BIOS files
download_bios() {
    local console=$1
    clear
    case "$console" in
        1)
            # download Arcade BIOS
            mkdir -p "$RETROARCHSYSTEMFOLDER"/fbneo/
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/airlbios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/awbios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/bubsys.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/cchip.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/decocass.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/f355bios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/f355dlx.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/hod2bios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/isgsm.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/midssio.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/naomi.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/neogeo.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/nmk004.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/pgm.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/skns.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/fbneo/ https://github.com/Abdess/retroarch_system/raw/libretro/Arcade/ym2608.zip
            mkdir -p "$RETROARCHSYSTEMFOLDER"/dc/
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/airlbios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/awbios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355bios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355dlx.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/hod2bios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi2.zip
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                               Arcade systems                                #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        2)
            # download 90's Nintendo BIOS files
            mkdir -p "$RETROARCHSYSTEMFOLDER"
            ### SNES BIOS
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/cx4.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1.program.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1b.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp1b.program.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp2.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp2.program.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp3.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp3.program.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp4.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/dsp4.program.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st010.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st010.program.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st011.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st011.program.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st018.data.rom
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System/st018.program.rom
            ### Gameboy
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy/dmg_boot.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy/gb_bios.bin
            ### Gameboy Color
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy%20Color/cgb_boot.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy%20Color/gbc_bios.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#             Super Nintendo, Nintendo Gameboy, and Gameboy Color             #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        3)
            # download Nintendo GameCube / Wii BIOS files
            mkdir -p "$RETROARCHSYSTEMFOLDER"/dolphin-emu/
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-dvd-20020823.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-ntsc-12.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-pal-12.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                           Nintendo GameCube / Wii                           #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        4)
            # download Nintendo Switch files
            rm -rf "$RYUNJINXFIRMMWAREFOLDER"
            rm "$RYUNJINXPRODKEYSFOLDER"/prod.keys
            rm "$RYUNJINXPRODKEYSFOLDER"/title.keys
            mkdir -p "$RYUNJINXFIRMMWAREFOLDER"
            mkdir -p "$RYUNJINXPRODKEYSFOLDER"
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RYUNJINXFIRMMWAREFOLDER" https://github.com/THZoria/NX_Firmware/releases/download/18.1.0r/Firmware.18.1.0.Rebootless.zip
            wget --quiet --no-clobber --progress=bar --show-progress --output-document "$RYUNJINXPRODKEYSFOLDER"/title.keys https://archive.org/download/EmuP_18.1.0_Keys/18.1.0_Keys.zip/title.keys
            wget --quiet --no-clobber --progress=bar --show-progress --output-document "$RYUNJINXPRODKEYSFOLDER"/prod.keys https://archive.org/download/EmuP_18.1.0_Keys/18.1.0_Keys.zip/prod.keys
            unzip "$RYUNJINXFIRMMWAREFOLDER"/Firmware.18.1.0.Rebootless.zip -d "$RYUNJINXFIRMMWAREFOLDER"
            rm "$RYUNJINXFIRMMWAREFOLDER"/Firmware.18.1.0.Rebootless.zip
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                               Nintendo Switch                               #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        5)
            # download old school SEGA BIOS files
            mkdir -p "$RETROARCHSYSTEMFOLDER"
            #### Game Gear
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Game%20Gear/bios.gg
            #### Master System
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios_E.sms
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios_J.sms
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios_U.sms
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Master%20System%20-%20Mark%20III/bios.sms
            #### Genesis
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/areplay.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/bios_MD.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/ggenie.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/rom.db
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/sk.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20Drive%20-%20Genesis/sk2chip.bin
            #### CD
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20CD%20-%20Sega%20CD/bios_CD_E.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20CD%20-%20Sega%20CD/bios_CD_J.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Mega%20CD%20-%20Sega%20CD/bios_CD_U.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                          old school Sega consoles                           #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        6)
            # download Sega Saturn BIOS files
            mkdir -p "$RETROARCHSYSTEMFOLDER"
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/hisaturn.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-17933.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-18100.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-18811-mx.ic1
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/mpr-19367-mx.ic1
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/saturn_bios.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega1003.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega_100.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega_100a.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/sega_101.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Saturn/vsaturn.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                                Sega Saturn                                  #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        7)
            # download Sega Dreamcast BIOS files
            mkdir -p "$RETROARCHSYSTEMFOLDER"/dc/
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Dreamcast/dc_boot.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Dreamcast/dc_flash.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/Abdess/retroarch_system/raw/libretro/Sega%20-%20Dreamcast/naomi_boot.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/airlbios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/awbios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355bios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/f355dlx.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/hod2bios.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi.zip
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER"/dc/ https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi2.zip
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                               Sega Dreamcast                                #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        8)
            # download Sony PS1/PSP BIOS files
            mkdir -p "$RETROARCHSYSTEMFOLDER"
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5500.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5501.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5502.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$RETROARCHSYSTEMFOLDER" https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation%20Portable/ppge_atlas.zim
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                          Sony Playstation and PSP                           #"
            echo -e "#                           successfully installed                            #"
            echo -e "#=============================================================================#"
            ;;
        9)
            # download Sony Playstation 2 BIOS files
            mkdir -p "$PCSX2BIOSFOLDER"
            wget --quiet --no-clobber --progress=bar --show-progress -P "$PCSX2BIOSFOLDER" https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0250j-20100415.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$PCSX2BIOSFOLDER" https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0250e-20100415.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$PCSX2BIOSFOLDER" https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0230h-20080220.bin
            wget --quiet --no-clobber --progress=bar --show-progress -P "$PCSX2BIOSFOLDER" https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0230a-20080220.bin
            echo -e "#=============================================================================#"
            echo -e "#                              BIOS files for...                              #"
            echo -e "#                             Sony Playstation 2                              #"
            echo -e "#                           successfully installed                            #"
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
