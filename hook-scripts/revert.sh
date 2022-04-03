# debugging
set -x

# load var
source "/etc/libvirt/hooks/kvm.conf"

# Unload vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Rebind  gpu
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO

# Rebind VTConsoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Read nvidia x config
nvidia-xconfig --query-gpu-info > /dev/null 2>&1

# Rebind EFI-framebuffer
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Reload nvidia drivers
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe drm_kms_helper 
modprobe nvidia
modprobe i2c_nvidia_gpu
modprobe drm 
modprobe nvidia_uvm

# start display manager
systemctl start lightdm.service


