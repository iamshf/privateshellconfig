#!/bin/bash
LOG_FILE='/data/migration/migration.log';

echo '' >> $LOG_FILE;
echo '' >> $LOG_FILE;
echo '' >> $LOG_FILE;


echo '*****************************************开始时间：'$(date "+%Y-%m-%d %H:%M:%S")'*******************************************************' >> $LOG_FILE;
echo '' >> $LOG_FILE;

/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p 8704' "user@sourceIP:/data2/ftp/public/" "/data/ftp/public/"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p 8704' "user@sourceIP:/data2/ftp/shfftp/" "/data/ftp/shfftp/" --exclude="web"

/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p 8704' "user@sourceIP:/data2/web/" "/data/web/"


find /data/web/ -name "Apis.php" -print0 | xargs -0 perl -pi -e 's|http://192.168.0.61/|http://123.57.7.113/|g'

#修改正式版Memcached
find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|array\('sourceMemcachedIP',\s*11211\)|array('targetMemcachedIP', 11211)|g"
find /data/web/ -path "/data/web/*/Formal*/*" -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|(\/\/\s*)*array\('targetMemcachedIP',\s*11211\)|array('targetMemcachedIP', 11211)|g"
find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|array\('sourceMemcachedIP',\s*11211\)|array('targetMemcachedIP', 11211)|g"

#修改测试版Memcached
find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|array\('sourceMemcachedIP',\s*11211\)|array('targetMemcachedIP', 11211)|g"

find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|'server'\s*=>\s*'sourceMySQLServer'|'server' => 'targetMySQLServer'|g"
find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|'server'\s*=>\s*'sourceMySQLServer'|'server' => 'targetMySQLServer'|g"
find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|'server'\s*=>\s*'sourceMySQLServer'|'server' => 'targetMySQLServer'|g"
find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|'server'\s*=>\s*'sourceMySQLServer'|'server' => 'targetMySQLServer'|g"
find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|,\s*'port'\s*=>\s*'?3307'?||g"

find /data/web/ -name "Conf.inc" -print0 | xargs -0 perl -pi -e "s|/data2/web/|/data/web/|g"


/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p 8704' "user@sourceIP:/etc/nginx/conf.d/" "/etc/nginx/conf.d/" --exclude="BsccallOfficial.conf"
find /etc/nginx/conf.d/ -name "*.conf" -print0 | xargs -0 perl -pi -e "s|/data2/web/|/data/web/|g"
find /etc/nginx/conf.d/ -name "*.conf" -print0 | xargs -0 perl -pi -e "s|http://192.168.0.96|http://202.85.217.96|g"
find /etc/nginx/conf.d/ -name "*.conf" -print0 | xargs -0 perl -pi -e "s|\s*fastcgi_pass 127.0.0.1:9000;|        include fastcgi.conf;\n	    fastcgi_pass unix:/run/php-fpm/www.sock;|g"

/usr/sbin/nginx -s reload

echo '开始导入数据时间：'$(date "+%Y-%m-%d %H:%M:%S") >> $LOG_FILE;
/usr/bin/sh /data/migration/syncDatabase.sh
echo '导入数据完成时间：'$(date "+%Y-%m-%d %H:%M:%S") >> $LOG_FILE;


echo '开始修改DNS解析时间：'$(date "+%Y-%m-%d %H:%M:%S") >> $LOG_FILE;
/data/migration/run test to_new
#/data/migration/run formal to_new
echo '修改DNS解析结束时间：'$(date "+%Y-%m-%d %H:%M:%S") >> $LOG_FILE;

