#!/bin/bash

function qemuConfiguation(){
	sudo pacman -Sy qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq

	echo
	echo "[+] Enabling and starting libvirtd.service"
	sudo systemctl enable libvirtd.service
	sudo systemctl start libvirtd.service

	echo "[+] Enabling and starting virtlogd.socket"
	sudo systemctl enable virtlogd.socket
	sudo systemctl start virtlogd.socket

	sudo virsh net-autostart default
  sudo virsh net-start default
}

qemuConfiguation
