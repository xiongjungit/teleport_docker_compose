#!/bin/bash
#counter=$(ps -C nginx --no-heading|wc -l)
counter=$(ps -ef|grep nginx|grep -v grep|wc -l)
if [ "${counter}" = "0" ]; then
    sleep 3
    #counter=$(ps -C nginx --no-heading|wc -l)
    counter=$(ps -ef|grep nginx|grep -v grep|wc -l)
    if [ "${counter}" = "0" ]; then
        #systemctl stop keepalived
        #pkill keepalived
        ps -ef|grep keepalived|grep -v grep|awk '{print $1}'|xargs kill -9
    fi
fi
