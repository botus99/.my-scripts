#!/usr/bin/env bash
#=============================================================================#
# name:        download-retro-bios.sh
# author:      botus99
# messed with: 2026-04-19
# description: pick your desired retro gaming system, then the script downloads
#              the needed bios files for emulating with retroarch, pcsx2, etc.
#=============================================================================#

# exit script if anything craps out
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

RETROARCH_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/system"
PCSX2_DIR="$HOME/.config/PCSX2/bios"
RYU_FIRMWARE_DIR="$HOME/.var/app/io.github.ryubing.Ryujinx/config/Ryujinx/firmware"
RYU_KEYS_DIR="$HOME/.var/app/io.github.ryubing.Ryujinx/config/Ryujinx/system"

# colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[1;36m"
GRAY="\033[1;37m"
RESET="\033[0m"

log()   { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error() { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

#=============================================================================#
#                               SANITY CHECKS                                 #
#=============================================================================#

log "Checking internet connectivity..."
curl --silent --fail https://github.com >/dev/null \
    || error "Cannot reach GitHub."

log "Checking dependencies..."
for cmd in wget unzip; do
    command -v "$cmd" &>/dev/null || error "Missing dependency: $cmd"
done


#=============================================================================#
#                               HELPER FUNCS                                  #
#=============================================================================#

download() {
    local url="$1"
    local dest="$2"

    mkdir -p "$dest"
    wget --quiet --show-progress --progress=bar:force:noscroll \
        --no-clobber -P "$dest" "$url"
}

#=============================================================================#
#                                   MENU                                      #
#=============================================================================#

show_menu() {
    echo
    echo -e "+---------------------------------------------------------+"
    echo -e "|              Which BIOS files do you need?              |"
    echo -e "+---------------------------------------------------------+"
    echo -e "${GREEN}1) Arcade${RESET}"
    echo -e "${RED}2) Nintendo${RESET} - SNES / Gameboy / Gameboy Color"
    echo -e "${RED}3) Nintendo${RESET} - GameCube / Wii"
    echo -e "${RED}4) Nintendo${RESET} - Switch"
    echo -e "${BLUE}5) Sega${RESET} - Genesis / MS / GG / CD / 32x"
    echo -e "${BLUE}6) Sega${RESET} - Saturn"
    echo -e "${BLUE}7) Sega${RESET} - Dreamcast / Naomi"
    echo -e "${CYAN}8) Sony${RESET} - Playstation 1 / PSP"
    echo -e "${CYAN}9) Sony${RESET} - Playstation 2"
    echo -e "${MAGENTA}x) Exit${RESET}"
    echo -e "==========================================================="
    read -rp "Choose your fate: " choice
}

#=============================================================================#
#                               INSTALL LOGIC                                 #
#=============================================================================#

download_bios() {
    local console=$1
    local fbneo="$RETROARCH_DIR/fbneo"
    local dc="$RETROARCH_DIR/dc"
    log "Cool. Here we go!"
    case "$console" in
        1)
            log "Installing Arcade BIOS files..."
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/airlbios.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/awbios.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/bubsys.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/cchip.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/decocass.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/f355bios.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/f355dlx.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/hod2bios.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/isgsm.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/midssio.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/naomi.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/neogeo.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/nmk004.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/pgm.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/skns.zip "$fbneo"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/ym2608.zip "$fbneo"
            mkdir -p "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/dc_boot.bin "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/dc_flash.bin "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/naomi_boot.bin "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/airlbios.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/awbios.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/f355bios.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/f355dlx.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/hod2bios.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/naomi.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/naomi2.zip "$dc"
            log "Arcade BIOS files installed successfully."
            ;;
        2)
            log "Installing old school Nintendo BIOS files..."
            mkdir -p "$RETROARCH_DIR"
            log "Installing Super Nintendo BIOS files..."
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/cx4.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp1.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp1.program.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp1b.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp1b.program.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp2.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp2.program.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp3.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp3.program.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp4.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/dsp4.program.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/st010.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/st010.program.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/st011.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/st011.program.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/st018.data.rom "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/SNES/st018.program.rom "$RETROARCH_DIR"
            log "Installing GameBoy BIOS files..."
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/Game%20Boy/dmg_boot.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/Game%20Boy/gb_bios.bin "$RETROARCH_DIR"
            log "Installing GameBoy Color BIOS files..."
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/Game%20Boy%20Color/cgb_boot.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/Game%20Boy%20Color/gbc_bios.bin "$RETROARCH_DIR"
            log "Old school Nintendo BIOS files installed successfully."
            ;;
        3)
            log "Installing Nintendo GameCube and Wii BIOS files..."
            mkdir -p "$RETROARCH_DIR"/dolphin-emu/
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/GameCube/gc-dvd-20020823.bin "$RETROARCH_DIR"/dolphin-emu/
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/GameCube/.variants/gc-ntsc-12.bin "$RETROARCH_DIR"/dolphin-emu/
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Nintendo/GameCube/.variants/gc-pal-12.bin "$RETROARCH_DIR"/dolphin-emu/
            log "Nintendo GameCube and Wii BIOS files installed successfully."
            ;;
        4)
            log "Installing Nintendo Switch BIOS files..."
            # remove any conflicting files
            rm -rf "$RYU_FIRMWARE_DIR"
            rm -f "$RYU_KEYS_DIR"/prod.keys
            rm -f "$RYU_KEYS_DIR"/title.keys
            # create folders for ryujinx
            mkdir -p "$RYU_FIRMWARE_DIR"
            mkdir -p "$RYU_KEYS_DIR"
            download https://github.com/THZoria/NX_Firmware/releases/download/18.1.0r/Firmware.18.1.0.Rebootless.zip "$RYU_FIRMWARE_DIR"
            wget --quiet --no-clobber --progress=bar --show-progress --output-document "$RYU_KEYS_DIR"/title.keys https://archive.org/download/EmuP_18.1.0_Keys/18.1.0_Keys.zip/title.keys
            wget --quiet --no-clobber --progress=bar --show-progress --output-document "$RYU_KEYS_DIR"/prod.keys https://archive.org/download/EmuP_18.1.0_Keys/18.1.0_Keys.zip/prod.keys
            unzip "$RYU_FIRMWARE_DIR"/Firmware.18.1.0.Rebootless.zip -d "$RYU_FIRMWARE_DIR"
            rm "$RYU_FIRMWARE_DIR"/Firmware.18.1.0.Rebootless.zip
            log "Nintendo Switch BIOS files installed successfully."
            ;;
        5)
            log "Installing old school SEGA BIOS files..."
            mkdir -p "$RETROARCH_DIR"
            log "Installing Game Gear BIOS files..."
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Game%20Gear/bios.gg "$RETROARCH_DIR"
            log "Installing Master System BIOS files..."
            download "https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Master%20System/bios.sms" "$RETROARCH_DIR"
            download "https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Master%20System/%5BBIOS%5D%20Sega%20Master%20System%20(Japan)%20(v2.1).sms" "$RETROARCH_DIR"
            mv "$RETROARCH_DIR/[BIOS] Sega Master System (Japan) (v2.1).sms" "$RETROARCH_DIR/bios_j.sms"
            download "https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Master%20System/%5BBIOS%5D%20Sega%20Master%20System%20(USA,%20Europe)%20(v1.3).sms" "$RETROARCH_DIR"
            mv "$RETROARCH_DIR/[BIOS] Sega Master System (USA, Europe) (v1.3).sms" "$RETROARCH_DIR/bios_u.sms"
            ln -sf "$RETROARCH_DIR/bios_u.sms" "$RETROARCH_DIR/bios_e.sms"
            log "Installing Genesis / Megadrive BIOS files..."
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20Drive/areplay.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20Drive/bios_MD.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20Drive/ggenie.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20Drive/rom.db "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20Drive/sk.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20Drive/sk2chip.bin "$RETROARCH_DIR"
            log "Installing SegaCD / MegaCD BIOS files..."
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20CD/bios_CD_E.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20CD/bios_CD_J.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Mega%20CD/bios_CD_U.bin "$RETROARCH_DIR"
            log "Old school SEGA BIOS files installed successfully."
            ;;
        6)
            log "Installing Sega Saturn BIOS files..."
            mkdir -p "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/hisaturn.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/mpr-17933.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/mpr-18100.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/mpr-18811-mx.ic1 "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/mpr-19367-mx.ic1 "$RETROARCH_DIR"
            download https://archive.org/download/retroarch_bios/saturn_bios.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/sega1003.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/sega_100.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/sega_100a.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/sega_101.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Saturn/vsaturn.bin "$RETROARCH_DIR"
            log "Sega Saturn BIOS files installed successfully."
            ;;
        7)
            log "Installing Sega Dreamcast BIOS files..."
            mkdir -p "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/dc_boot.bin "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/dc_flash.bin "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/f355bios.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/f355dlx.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/naomi.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sega/Dreamcast/naomi_boot.bin "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/airlbios.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/awbios.zip "$dc"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Arcade/Arcade/hod2bios.zip "$dc"
            download https://github.com/archtaurus/RetroPieBIOS/raw/master/BIOS/dc/naomi2.zip "$dc"
            log "Sega Dreamcast BIOS files installed successfully."
            ;;
        8)
            log "Installing Sony Playstation 1 and PSP BIOS files..."
            mkdir -p "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sony/PlayStation/scph5500.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sony/PlayStation/scph5501.bin "$RETROARCH_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sony/PlayStation/scph5502.bin "$RETROARCH_DIR"
            download https://github.com/hrydgard/ppsspp/raw/refs/heads/master/assets/ppge_atlas.zim "$RETROARCH_DIR"
            log "Sony Playstation 1 and PSP BIOS files installed successfully."
            ;;
        9)
            log "Installing Sony Playstation 2 BIOS files..."
            mkdir -p "$PCSX2_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sony/PlayStation%202/ps2-0250j-20100415.bin "$PCSX2_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sony/PlayStation%202/ps2-0250e-20100415.bin "$PCSX2_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sony/PlayStation%202/ps2-0230h-20080220.bin "$PCSX2_DIR"
            download https://github.com/Abdess/retrobios/raw/refs/heads/main/bios/Sony/PlayStation%202/ps2-0230a-20080220.bin "$PCSX2_DIR"
            log "Sony Playstation 2 BIOS files installed successfully."
            ;;
        *)
            echo "HEY! You didn't pick one of the selected options, dummy."
            exit 1
            ;;
    esac
}

#=============================================================================#
#                                   MAIN                                      #
#=============================================================================#

main() {
    while true; do
        show_menu
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
                echo "HEY! You didn't pick one of the selected options, dummy."
                ;;
        esac
    done
}

main
