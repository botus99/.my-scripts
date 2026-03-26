#!/bin/sh
#
# Simultaneous Multithreading (SMT) or hyper-threading
# can cause spikes in DSP load at higher DSP loads.
# In such cases it might be beneficial to disable SMT.
# This can be done by setting the SMT control flag to off.

echo on | sudo tee /sys/devices/system/cpu/smt/control
