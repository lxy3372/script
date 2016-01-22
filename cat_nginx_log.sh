#!/usr/bin/env bash

#split nginx log
pid_path="/run/nginx.pid"

logs_path="/var/log/nginx/"
log_name="access.log"

if [ -f ${log_path}${log_name} ];then
	mv ${logs_path}${log_name} ${logs_path}${log_name}_$(date +%Y%m%d).log
fi

kill -USR1 `cat ${pid_path}`
