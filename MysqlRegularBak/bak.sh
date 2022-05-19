#!/bin/bash
file_suffix=$(date +%Y%m%d%H%M)
del_folder="/mydata/mysqlbak/$(date -d -60-day +%Y%m%d)"
new_folder="/mydata/mysqlbak/$(date +%Y%m%d)"

if [ ! -d $new_folder ]; then
    /usr/bin/mkdir $new_folder
fi

for db in "db1" "db2" "db……"
do
    /usr/bin/mysqldump -uBothshf -ppassword -B $db | /usr/bin/gzip -9 > ${new_folder}/${db}_${file_suffix}.sql.gz
done

/usr/bin/rm -rf $del_folder

/usr/bin/rsync -a --rsh="/usr/bin/ssh -p8704" --delete --ignore-errors --force /mydata/mysqlbak/ root@192.168.0.61:/data/mysqlDatabases/BAK/
