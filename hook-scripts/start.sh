# debugging
set -x

# load var
source "/etc/libvirt/hooks/kvm.conf"

# stop display manager
systemctl stop lightdm.service

# Unbind VTConsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid race condition
sleep 10

# Unbind Nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r drm_kms_helper 
modprobe -r nvidia
modprobe -r i2c_nvidia_gpu
modprobe -r drm 
modprobe -r nvidia_uvm

# Unbind  gpu
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO

# load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1


