#!/bin/bash
	
install_sudo=1; 
install_wget=1;
install_dialog=1; 
install_curl=1; 
install_gnupg2=1;
install_lsb_release=1;
install_apt_transport_https=1; 
install_ca_certificates=1;
install_p7zip_full=1; 
install_htop=1; 
install_dirmngr=1;	


#-----------------------Function---OK/Fail

		function StartScript {
			echo -n "${blue}[${Commandname}: Start]"	
			echo -n "${reset}"
			echo
		}
		function EndScript {
			if [ $? -eq 0 ]; then
				echo -n "${green}[${Commandname}: OK]"
			else
				echo -n "${red}[${Commandname}: Fail]"
			fi
			echo -n "${reset}"
			echo
		}

		red=$(tput setf 4); green=$(tput setf 2); blue=$(tput setf 3); reset=$(tput sgr0)

#-----------------------------------------

	
	if [ $install_wget = 1 ]; then
		Commandname="install wget"
		StartScript
		apt install wget
		EndScript
	fi

	if [ $install_dialog = 1 ]; then
		Commandname="install dialog"
		StartScript
		apt install dialog
		EndScript
	fi

	if [ $install_curl = 1 ]; then
		Commandname="install Curl"
		StartScript
		apt install -y curl
		EndScript
	fi

	if [ $install_gnupg2 = 1 ]; then
		Commandname="install gnupg2"
		StartScript
		apt install -y gnupg2
		EndScript
	fi

	if [ $install_lsb_release = 1 ]; then
		Commandname="install lsb-release"
		StartScript
		apt install lsb-release
		EndScript
	fi

	if [ $install_apt_transport_https = 1 ]; then
		Commandname="install apt-transport-https"
		StartScript
		apt install apt-transport-https
		EndScript
	fi

	if [ $install_ca_certificates = 1 ]; then
		Commandname="install ca-certificates"
		StartScript
		apt install ca-certificates
		EndScript
	fi

	if [ $install_p7zip_full = 1 ]; then
		Commandname="install p7zip-full"
		StartScript
		apt install -y p7zip-full
		EndScript
	fi

	if [ $install_htop = 1 ]; then
		Commandname="install htop"
		StartScript
		apt install htop
		EndScript
	fi

	if [ $install_dirmngr = 1 ]; then
		Commandname="install dirmngr"
		StartScript
		apt install dirmngr
		EndScript
	fi
