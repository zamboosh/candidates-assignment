#!/bin/bash
#add fix to exercise2 here
sudo -s
head -n -1 /etc/hosts > temp.txt ; mv temp.txt /etc/hosts
exit
