#!/bin/bash;
#修改SOURCE_HOST、SOURCE_PORT、--lock-all-tables
SOURCE_USER=''
SOURCE_PWD=''
SOURCE_HOST=''
SOURCE_PORT='3306'

TARGET_USER=''
TARGET_PWD=''
TARGET_HOST=''
TARGET_PORT='3306'

SQL="SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN ('mysql','information_schema','performance_schema', 'log')"

tmpFile="/data/migration/databases"

DBLIST=""

BAK_SQL="/data/migration/alldbs.sql"

/usr/bin/mysql -u${SOURCE_USER} -p${SOURCE_PWD} -h${SOURCE_HOST} -P${SOURCE_PORT} -ANe "$SQL" > $tmpFile

for DB in `cat ${tmpFile}`;
do
    DBLIST="${DBLIST} ${DB}";
done

/usr/bin/rm $tmpFile;

if [ -f ${BAK_SQL} ]; then
    /usr/bin/rm $BAK_SQL;
fi

#正式执行
/usr/bin/mysqldump -u${SOURCE_USER} -p${SOURCE_PWD} -h${SOURCE_HOST} -P${SOURCE_PORT} --lock-all-tables --routines --flush-logs --hex-blob -B ${DBLIST} > ${BAK_SQL};
#测试
#/usr/bin/mysqldump -u${SOURCE_USER} -p${SOURCE_PWD} -h${SOURCE_HOST} -P${SOURCE_PORT} --routines --flush-logs --hex-blob -B ${DBLIST} > ${BAK_SQL};

/usr/bin/mysql -u${TARGET_USER} -p${TARGET_PWD} -h${TARGET_HOST} -P${TARGET_PORT} < ${BAK_SQL};