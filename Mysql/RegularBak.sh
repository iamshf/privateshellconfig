#!/bin/bash

file_suffix=$(date +%Y%m%d%H%M)
del_folder="/data/mysqlbak/$(date -d -60-day +%Y%m%d)"
new_folder="/data/mysqlbak/$(date +%Y%m%d)"

SOURCE_USER=user
SOURCE_PWD='pwd'
SOURCE_HOST='host'
SOURCE_PORT=3306

SQL="SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN ('mysql','information_schema','performance_schema', 'log')"

tmpFile="/data/mysqlbak/databases"

/usr/bin/mysql -u${SOURCE_USER} -p${SOURCE_PWD} -h${SOURCE_HOST} -P${SOURCE_PORT} -ANe "$SQL" > $tmpFile

if [ ! -d $new_folder ]; then
    /usr/bin/mkdir $new_folder
fi


for DB in `cat ${tmpFile}`;
do
    /usr/bin/mysqldump -u${SOURCE_USER} -p${SOURCE_PWD} -h${SOURCE_HOST} -P${SOURCE_PORT} --routines --hex-blob -B ${DB}  | /usr/bin/gzip -9 > ${new_folder}/${DB}_${file_suffix}.sql.gz;
done

/usr/bin/rm -rf $del_folder
/usr/bin/rm $tmpFile;

/usr/bin/rsync -a --rsh="/usr/bin/ssh -p8704" --delete --ignore-errors --force /data/mysqlbak/ Bothshf@192.168.0.61:/data/ftp/shfftp/mysqlDatabases/BAK/ --exclude="bak.sh";
