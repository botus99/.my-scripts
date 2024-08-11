#!/bin/bash

# Set some variables
RETROARCHSYSTEMFOLDER="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/system"
PCSX2BIOSFOLDER="$HOME/.var/app/net.pcsx2.PCSX2/config/PCSX2/bios"

# Function to display the main menu
show_menu() {
    local choice
    clear
    echo "Select a console:"
    echo "1) Arcade"
    echo "2) Nintendo - SNES"
    echo "3) Nintendo - Gameboy"
    echo "4) Nintendo - Gameboy Color"
    echo "5) Nintendo - Gamecube/Wii"
    echo "6) Sega - Genesis/MS/GG/CD/32x"
    echo "7) Sega - Saturn"
    echo "8) Sega - Dreamcast / Arcade Naomi"
    echo "9) Sony PS1/PSP"
    echo "ps2) Sony Playstation 2"
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
            echo "Downloaded Arcade BIOS files"
            ;;
        2)
            # download Nintendo - SNES BIOS
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
            echo "Downloaded BIOS files for Super Nintendo"
            ;;
        3)
            # download Nintendo - GB BIOS download links
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy/dmg_boot.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy/gb_bios.bin
            echo "Downloaded BIOS files for Nintendo Gameboy"
            ;;
        4)
            # download Nintendo - GBC BIOS files
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy%20Color/cgb_boot.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20Gameboy%20Color/gbc_bios.bin
            echo "Downloaded BIOS files for Nintendo Gameboy Color"
            ;;
        5)
            # download Nintendo - Gamecube / Wii BIOS files
            mkdir -p $RETROARCHSYSTEMFOLDER/dolphin-emu/
            wget -nc -P $RETROARCHSYSTEMFOLDER/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-dvd-20020823.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-ntsc-12.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER/dolphin-emu/ https://github.com/Abdess/retroarch_system/raw/libretro/Nintendo%20-%20GameCube/gc-pal-12.bin
            echo "Downloaded BIOS files for Nintendo Gamecube"
            ;;
        6)
            # download old school SEGA  BIOSes download links
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
            echo "Downloaded old school SEGA BIOS files"
            ;;
        7)
            # download Sega - Saturn BIOS download links
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
            echo "Downloaded BIOS files for Sega Saturn"
            ;;
        8)
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
            echo "Downloaded BIOS files for Sega Dreamcast"
            ;;
        9)
            # download Sony PS1/PSP BIOS files
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5500.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5501.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation/scph5502.bin
            wget -nc -P $RETROARCHSYSTEMFOLDER https://github.com/Abdess/retroarch_system/raw/libretro/Sony%20-%20PlayStation%20Portable/ppge_atlas.zim
            echo "Downloaded BIOS files for Sony Playstation and PSP"
            ;;
        ps2)
        	# download Sony Playstation 2 BIOS files
            mkdir -p $PCSX2BIOSFOLDER
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0250j-20100415.bin
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0250e-20100415.bin
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0230h-20080220.bin
            wget -nc -P $PCSX2BIOSFOLDER https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/pcsx2/bios/ps2-0230a-20080220.bin
            echo "Downloaded BIOS files for Sony Playstation 2"
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
            ps2)
            	download_bios "ps2"
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
