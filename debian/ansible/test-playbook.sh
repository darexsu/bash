#!/bin/bash

#------------------------Function-Ok/Fail-----------------
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

#---------------------------------------------------------


echo "Enter host ip"
read host_ip

echo "Enter ansible user"
read ansible_user
	
Commandname="Creat start.yml"
StartScript
echo "---
- hosts: myservers
  become: yes
  
  tasks:
    - name: test ping
      ansible.builtin.ping:  
" > "start.yml"
EndScript

Commandname="Creat hosts.ini"
StartScript
echo "[myservers]
${host_ip} ansible_user=${ansible_user}" > "hosts.ini"
EndScript

Commandname="Start test playbook"
StartScript
ansible-playbook start.yml -i ./hosts.ini -k
EndScript
