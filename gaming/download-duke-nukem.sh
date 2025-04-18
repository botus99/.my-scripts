#!/usr/bin/env bash

flatpak install com.eduke32.EDuke32 -y
wget --no-verbose --show-progress "https://archive.org/download/DUKE3D_DOS/DUKE3D.zip/DUKE3D%2FDUKE3D.GRP" --output-document="$HOME/.var/app/com.eduke32.EDuke32/.config/eduke32/DUKE3D.GRP"
