#!/usr/bin/env bash
#
# If your CPU supports frequency scaling and the CPU frequency scaling governor
# is set to ondemand (which is the default on a lot of distros) you could run
# into xruns. The ondemand governor scales the frequency according to the CPU
# load, the more the load, the higher the frequency. But this is happening
# independently from the DSP load on your system so it could happen that the DSP
# load suddenly rises for instance, demanding more CPU power, and that the
# scaling daemon kicks in too late, resulting in xruns because the DSP load
# maxes out. A solution would be to use a CPU frequency scaling daemon that
# scales the frequency according to the DSP load on your system like jackfreqd
# or to simply disable CPU frequency scaling altogether. The latter can be
# achieved by setting the scaling governor to performance.

echo -n performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
