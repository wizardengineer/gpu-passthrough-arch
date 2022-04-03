function hookInit() {
	echo
	echo "This should be ran after installing you're windows vm. Do you still want to continue? y/n"
	read ANSWER

	if [ ! ANSWER = y ]
	then
		echo "Exiting script..."
		return 1	
	fi

	if [ -d "/etc/libvirt/hooks/"]
	then
		echo "Hook Directory already exist"
		return 1
	else
		sudo mkdir /etc/libvirt/hooks/
		sudo cp ./hook-scripts/kvm.conf /etc/libvirt/hooks/kvm.conf

		sudo cp ./hook-script/qemu /etc/libvirt/hooks/qemu
		sudo chmod +x /etc/libvirt/hooks/qemu
		

		echo
		echo "[+] Creating Hook folders"
		echo "what is the name of the vm? >>> "
		read VM_NAME
		sudo mkdir -p /etc/libvirt/hooks/qemu.d/$VM_NAME/prepare/begin
		sudo mkdir -p /etc/libvirt/hooks/qemu.d/$VM_NAME/release/end

		sudo chmod +x ./hook-scripts/start.sh
   	sudo chmod +x ./hook-scripts/revert.sh
  	sudo cp ./hook-scripts/start.sh /etc/libvirt/hooks/qemu.d/$VM_NAME/prepare/begin/start.sh
		sudo cp ./hook-scripts/revert.sh /etc/libvirt/hooks/qemu.d/$VM_NAME/release/end/revert.sh
	fi

	if [ -f /bin/tree]
	then
		tree /etc/libvirt/hooks/
	else
		sudo pacman -Sy tree
		tree /etc/libvirt/hooks/
	fi
}

hookInit
