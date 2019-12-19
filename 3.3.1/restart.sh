#!/bin/bash

DATE=`date +"%Y-%m-%d %H:%M:%S"`
cd /teleport
docker-compose restart > /dev/null 2>&1 
docker exec -it teleport bash -c "echo 10.75.13.2 mail.cpms.com.cn cpms.com.cn >> /etc/hosts"
if [ $? -eq 0 ];then
  echo $DATE,restart ok >> restart.log
else
  echo $DATE,restart fail >> restart.log
fi
docker exec -it teleport bash -c "cat /etc/hosts"
