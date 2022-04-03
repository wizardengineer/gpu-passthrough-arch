#!/bin/bash

# for some reason, you can't sudo all of these commands that deal with dump the rom
# RUN AS `su` for this code to work

# make sure to `ls` in /sys/devices/pci0000:00/
# to see where you rom is lowkey, it may not be these specific
# locations I'm using

echo 1 > /sys/devices/pci0000:00/0000:00:01.1/0000:01:00.0/rom
cat /sys/devices/pci0000:00/0000:00:01.1/0000:01:00.0/rom > vbios.dump
echo 0 > /sys/devices/pci0000:00/0000:00:01.1/0000:01:00.0/rom
echo
echo "Dumped the file..."

chmod +x vbios.dump
