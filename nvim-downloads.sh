#!/bin/bash

function neovimExtension() {
	if [ ! -f /bin/nvim ]
	then
		sudo pacman -Sy neovim	
	fi
	
	echo
	echo "[+] Initializing Things for your NeoVim";
	sudo pacman -Sy npm;
	echo "	- Downloading packages with 'npm'";
	sudo npm i -g pyright bash-language-server;
  
	echo "	- Downloading packages with 'yay'";
	yay -Sy ccls rust-analyzer ctags;
	
	if [ -d "$HOME/.config/nvim/" ] 
	then
		echo
    echo "	- Directory $HOME/.config/nvim/ exists."
	else
		echo
		echo "	- Creating directory"

		mkdir "$HOME/.config/nvim/"
		cp init.vim "$HOME/.config/nvim/"
		#wget https://gist.githubusercontent.com/medievalghoul/0e307aa3190a3c38c3d5d5f9166dc557/raw/c627fa8446898382eeff9738c68e7e42492111cf/init.vim
		
	fi

	curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

neovimExtension
