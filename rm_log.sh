#!/usr/bin/env bash

#rm log files 7 days ago

log_arr=("/var/log/nginx/" "/var/log/mysql/log")

for logs in ${log_arr[@]};do
	if [ -d ${logs} ];then
		find ${logs} -name "*.log" -mtime +7 | xargs rm -f
	fi
done
