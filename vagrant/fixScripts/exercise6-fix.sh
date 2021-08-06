#!/bin/bash
#add fix to exercise6-fix here
declare -A servers=( ['1']='2' ['2']='1')
server_name=`hostname`
server_num=${server_name: -1}
line="'$*'"
read -a arr <<< $line
dest_dir=arr[-1]

for i in "${arr[@]::${#arr[@]}-1}"
do
	scp $i "server${servers[$server_num]}/$dest_dir"
done
mkdir exercises
echo 'export PATH=$PATH/home/vagrant/exercises/' >> ~/.bashrc 
source ~/.bashrc

