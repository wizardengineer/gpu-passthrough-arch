# Helps with GPU passthrough
Something simple that'll be specific to me and i3 builds, however, you can use the scripts provide to help your with you single gpu passthough. Nvim script is not needed, I just love using it so I added it specifically for me.

## GRUB
`sudo nvim /etc/default/grub` and add the following:
```
GRUB_CMDLINE_LINUX_DEFAULT = "... intel_iommu=on iommu=1"

or

GRUB_CMDLINE_LINUX_DEFAULT = "... amd_iommu=on iommu=pt iommu=1"
```
then execute `sudo grub-mkconfig -o /boot/grub/grub.cfg`
after executing, reboot.

## Virt-manager

Make sure to execute `qemu-downloads.sh` after rebooting

Make sure to add the following in your Virtual Machine XML file:
```xml
    <hyperv mode="custom">
      <relaxed state="on"/>
      <vapic state="on"/>
      <spinlocks state="on" retries="8191"/>
      <vendor_id state="on" value="AnythingTbh"/>
    </hyperv>
    <kvm>
      <hidden state="on"/>
    </kvm>
		...
 <cpu mode="host-passthrough" check="none" migratable="on">
```

## I3-Gap Specific config add-on
```
#######################
# config starts here: #
#######################
exec xrandr --output DP-2 --mode 1920x1080 --rate 144.00
...
```
# Resource

[Where I got most of my info from, great resource](https://www.youtube.com/watch?v=BUSrdUoedTo&t=2413s)

