#!/usr/bin/env bash
#=============================================================================#
# name:        update-deb-get
# author:      botus99
# messed with: 2026-05-04
# dep/reqs:    deb-get
# description: updates the deb-get repos, then performs the upgrades
#              I link this to 'update-deb-get' in my '$HOME/.local/bin'
#=============================================================================#

sudo deb-get update --repos-only
sudo deb-get upgrade --dg-only

# probably unnecessary...
# actually, my updater script needs this to report that deb-get updated successfully, I think...
exit 0
