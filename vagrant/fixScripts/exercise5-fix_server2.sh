#!/bin/bash
#add fix to exercise5-server2 here
#ssh-keygen -q -t rsa -N '' <<< ""$'\n'"y" 2>&1 >/dev/null && scp -i ~/.ssh/id_rsa.pub vagrant@server1:~/.ssh/authorized_keys
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd.service
sudo -s
echo "vagrant:123" | chpasswd
exit
spawn ssh vagrant@server1
expect "assword:"
send "123\r"
interact
sudo apt-get update && sudo apt-get install sshpass
sshpass -p "123" ssh -o StrictHostKeyChecking=no vagrant@server1
echo -e "\n"|ssh-keygen -t rsa -N ""
ssh-copy-id vagrant@server2
exit
