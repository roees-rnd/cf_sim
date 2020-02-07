#!/bin/bash

A=`cat /proc/self/cgroup | grep docker | wc -l`
a=1


MY_IP=`ifconfig | grep 172 | cut -d: -f2 | cut -d' ' -f1`

if [ $A -lt $a ]
then 
	echo "Not in docker"
	CNT_ID=`docker ps -a  | head -n2 | tail -n1 | cut -d' ' -f1`
	CONTAINER_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CNT_ID`
	
	echo "expot ROS_MASTER_URI=http://$CONTAINER_IP:11311"
	echo "expot ROS_IP=$MY_IP"
	export ROS_MASTER_URI=http://$CONTAINER_IP:11311
	export ROS_IP=$MY_IP
else
	echo "In container"
	export ROS_MASTER_URI=http://$MY_IP:11311
	export ROS_IP=$MY_IP
	echo "expot ROS_MASTER_URI=http://$MY_IP:11311"
	echo "expot ROS_IP=$MY_IP"
	
fi

