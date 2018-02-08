#!/bin/bash

wget https://raw.githubusercontent.com/bhargav-ak/scratchpad/master/sidekick/cheatsheets/bashrc -O .bashrc
wget https://raw.githubusercontent.com/bhargav-ak/scratchpad/master/sidekick/cheatsheets/bash_aliases -O .bash_aliases
source ~/.bashrc

wget https://raw.githubusercontent.com/bhargav-ak/scratchpad/master/sidekick/cheatsheets/vimrc -O .vimrc


echo "Pull Sublime text"
cd ~/Downloads
wget https://download.sublimetext.com/sublime_text_3_build_3143_x64.tar.bz2
tar -xvjf -C sublime_text sublime_text_3_build_3143_x64.tar.bz2
mv sublime_text_3 sublime_text
sudo mv sublime_text /opt
cd /opt
sudo chown -R bhargav:bhargav sublime_text/
sudo ln -s /opt/sublime_text/sublime_text /usr/bin/sublime
cp /opt/sublime_text/sublime_text/sublime_text.desktop ~/.local/share/applications/
chmod +x ~/.local/share/applications/sublime_text.desktop 

sudo apt-get -y install vim git meld gnome-tweak-tool nmap net-tools make gparted synaptic gcc libncurses5-dev libncurses5 libncurses5-dbg gksu minicom cscope
mkdir ~/Camera
mkdir ~/Coder


# Stop screen rotation in Budgie
echo "--------------------------------------------------------------------"
echo "Is this Ubuntu Budgie ?"
echo "--------------------------------------------------------------------"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true; break;;
		No  ) break;;
	esac
done

# Pull Raspberry Pi Sources
echo y"--------------------------------------------------------------------"
echo "Pull Raspberry Pi Kernel and Tools ?"
echo "--------------------------------------------------------------------"
select yn in "Yes" "No"; do
	case $yn in
		Yes )	mkdir ~/Coder/raspberrypi;
			cd ~/Coder/raspberrypi;
			git clone https://github.com/raspberrypi/tools;
			git clone --depth=1 https://github.com/raspberrypi/linux;
			git clone https://github.com/bhargav-ak/scratchpad.git;
			alert;
			break;;
		No  ) break;;
	esac
done

# Pull root
echo y"--------------------------------------------------------------------"
echo "Pull _root ?"
echo "--------------------------------------------------------------------"
select yn in "Yes" "No"; do
	case $yn in
                Yes )	echo "Generating SSH Key"; 
			ssh-keygen -t rsa -b 4096 -C "anur.bhargav@gmail.com"; 
			echo ""
			cat /home/bhargav/.ssh/id_rsa.pub;
			echo ""
			echo "Copy the SSH Key into your github page..."
			read -p "Press [Enter] to continue..."
			git clone git@github.com:bhargav-ak/_root.git;
			break;;
		No  ) break;;
	esac
done

