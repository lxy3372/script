#!/usr/bin/env bash

#rm log files 7 days ago

log_arr=("/data/xiaoaiai/xiaoaiai_webapi_v2/src/application/logs" "/data/xiaoaiai/admin/src/application/logs" "/data/xiaoaiai/xiaoaiai_webapi_v2/log" "/var/log/nginx")

for logs in ${log_arr[@]};do
	if [ -d ${logs} ];then
		find ${logs} -name "*.log" -mtime +7 | xargs rm -f
	fi
done
