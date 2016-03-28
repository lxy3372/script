#!/bin/bash

#create tables

table_desc=`cat<<EOF
(
	id int(20) NOT NULL AUTO_INCREMENT,
	name varchar(100) NOT NULL default '',
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
EOF
`

if [ $# -lt 6 ]
then
	echo "error param, use like bash *.sh host port user password db mod(number)"
	exit
else
	host=$1
	port=$2
	user=$3
	password=$4
	database=$5
fi

if [ -n $6 ]
then
	mod=$6
else
	mod=128
fi

echo `mysql -u${user} -P${port} -h${host} -p -e "drop database if exists ${database}; create database ${database}"`

while [ $mod -gt 0 ]
do
	table_name="t_tests_${mod}"
	echo `mysql -u${user} -P${port} -h${host} -p${password}	${database} -e "drop table if exists ${table_name};create table ${table_name}	${table_desc}"`
	let mod-=1
	echo $mod
done
echo "Ok!"
exit
