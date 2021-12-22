#!/bin/bash

echo "Enter only codename of version debian: 8 - trusty, 9 - xenial, 10 - bionic, 11 - focal."
read version
#-----------------------------------------

#----------------------Function OK/Fail---

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


	
	Commandname="update sources.list.d"
	StartScript
	echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu ${version} main">/etc/apt/sources.list.d/ansible.list
	EndScript
	
	Commandname="add gpg key Ansible"
	StartScript
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
	EndScript
	
	Commandname="apt update"
	StartScript
	apt update
	EndScript
	
	Commandname="install ansible"
	StartScript
	apt install -y ansible
	EndScript
	
	Commandname="install sshpass"
	StartScript
	apt install -y sshpass
	EndScript
	
	Commandname="install git"
	StartScript
	apt install -y git
	EndScript
	
	Commandname="check ansible"
	StartScript
	ansible --version
	EndScript

