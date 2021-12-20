#!/bin/bash

echo "version debian: 8 - trusty, 9 - xenial, 10 - bionic, 11 - focal."
read $version
#-----------------------------------------

#Функция статуса выполнения комманд OK/Fail

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


	
	Commandname="Добавление deb в Sources.list.d"
	StartScript
	echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu ${version} main">/etc/apt/sources.list.d/ansible.list
	EndScript
	
	Commandname="Установка ключей Ansible"
	StartScript
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
	EndScript
	
	Commandname="Apt update: Обновить базы данных пакетов"
	StartScript
	apt update
	EndScript
	
	Commandname="Устанока Ansible"
	StartScript
	apt install -y ansible
	EndScript
	
	Commandname="Устанока sshpass"
	StartScript
	apt install -y sshpass
	EndScript
	
	Commandname="Проверка Ansible"
	StartScript
	ansible --version
	EndScript

