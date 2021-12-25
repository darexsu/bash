#!/bin/bash

user=darexsu;
sudo_for_sftp=1;
install_dialog=1;
install_curl=1;
install_gnupg2=1;
install_lsb_release=1;
install_apt_transport_https=1;
install_ca_certificates=1;
install_p7zip_full=1;
install_htop=1;
install_dirmngr=1;

install_ansible=1;
install_test_playbook=1;


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
  if [ $sudo_for_sftp = 1 ]; then
		#winscp -> sftp -> sudo /usr/lib/sftp-server
		Commandname="rights for sftp"
		StartScript
		echo "${user} ALL=NOPASSWD:/usr/lib/sftp-server" >> /etc/sudoers
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

	#-----------------------------------------
if [ $install_ansible = 1 ]; then
	echo "Enter only codename ubuntu: trusty, xenial, bionic, focal."
	read ansible_version

		Commandname="update sources.list.d"
		StartScript
		echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu ${ansible_version} main">/etc/apt/sources.list.d/ansible.list
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
fi
if [ $install_test_playbook = 1 ]; then
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
ansible-playbook start.yml -i ./hosts.ini -kK
EndScript
fi
