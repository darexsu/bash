#!/bin/bash

user=darexsu;
epel_repo=1;
epel_url=https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm;
sudo_for_sftp=1;
install_curl=1;
install_gnupg2=1;
install_lsb_release=1;
install_p7zip=1;
install_htop=1;

install_ansible=1;


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
	if [ $epel_repo = 1 ]; then
			Commandname="install epel"
			StartScript
			dnf install -y $epel_url
			EndScript  
	fi

	if [ $sudo_for_sftp = 1 ]; then
			#winscp -> sftp -> sudo /usr/lib/sftp-server
			Commandname="rights for sftp"
			StartScript
			echo "${user} ALL=NOPASSWD:/usr/lib/sftp-server" >> /etc/sudoers
			EndScript

			Commandname="restart ssh"
			StartScript
			systemctl restart ssh
			EndScript
	fi

	if [ $install_curl = 1 ]; then
		Commandname="install Curl"
		StartScript
		yum install -y curl
		EndScript
	fi

	if [ $install_gnupg2 = 1 ]; then
		Commandname="install gnupg2"
		StartScript
		yum install -y gnupg2
		EndScript
	fi

	if [ $install_lsb_release = 1 ]; then
		Commandname="install lsb-release"
		StartScript
		yum install -y redhat-lsb-core
		EndScript
	fi

	if [ $install_p7zip = 1 ]; then
		Commandname="install p7zip"
		StartScript
		yum install -y p7zip
		EndScript
	fi

	if [ $install_htop = 1 ]; then
		Commandname="install htop"
		StartScript
		yum install -y htop
		EndScript
	fi

	#-----------------------------------------
if [ $install_ansible = 1 ]; then
		Commandname="install ansible"
		StartScript
		yum install -y ansible
		EndScript	

		Commandname="install git"
		StartScript
		yum install -y git
		EndScript

		Commandname="check ansible"
		StartScript
		ansible --version
		EndScript
fi
