#!/bin/bash

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