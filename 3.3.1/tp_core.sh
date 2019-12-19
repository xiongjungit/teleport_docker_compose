#!/bin/bash

#time=`date +"%Y-%m-%d %H:%M:%S"`
time=`date`
hostip=`hostname -I|grep -P -o "10.50.167.\d+"`

sendmail(){
    to="admin@cpms.com.cn"
    #subject=`echo -n $2 | base64`
    subject="=?utf-8?b?$subject?="
    subject=`echo $subject | tr '\r\n' '\n'`
    #body=`echo $3 | tr '\r\n' '\n'`
    /usr/local/bin/sendEmail -f zabbix@cpms.com.cn -t "$to" -s cpms.com.cn -u "$subject" -o message-content-type=html -o message-charset=utf8 -xu zabbix@cpms.com.cn -xp zabbix -m "$body" -o tls=no
}

restart_tp(){
	cd /teleport
    docker-compose down -v
    docker-compose up -d
    docker exec teleport bash -c "echo 10.75.13.2 mail.cpms.com.cn cpms.com.cn >> /etc/hosts"
}

check_tp_core(){
    docker exec teleport bash -c 'ps -ef | grep "tp_core" | grep -v "grep"'
    if [ $? -ne 0 ]; then
    	echo $time $hostip teleport核心服务未启动,重启teleport服务 >> /tmp/tp_core.log
        subject=`echo -n teleport核心服务未启动 | base64`
        body=`echo $time  $hostip teleport核心服务未启动,重启teleport服务 | tr '\r\n' '\n'`
        sendmail
        restart_tp
    fi
}

check_tp_core
