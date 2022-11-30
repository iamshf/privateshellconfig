#!/bin/bash

folders=('BothCardCenter/Formal/'  'BothEnglish/Client/'  'BothEnglish/EnExamCenter/Formal/' 'BothEnglish/EnFun/Formal/'  'BothEnglish/ExamCenter/Formal/'  'BothEnglish/GrammarCenter/Server/'  'BothEnglish/ListenTalkCenter/Formal/Server/'  'BothEnglish/ReadCenter/Formal/Server/'  'BothEnglish/SyncCenter/Formal/Server/'  'BothEnglish/UserCenter/Formal/Server/'  'BothEnglish/WriteCenter/Formal/Server/'  'BothExamCenter/Formal/'  'BothLeagueCenter/Formal/'  'BothManageCenter/Formal/'  'BothOrderCenter/Formal/'  'BothPassport/Formal/'  'BothUserCenter/Formal/'  'CnOfficial/FormalV2/'  'CnOfficial/Formal/'  'CommLib/'  'Official/Formal/'  'StaticCenter/'  'XueBaJiang/Formal/'  'ZhiJiao365/OfficialWebsite/Formal/'  'ZhiJiao365/StudyCenter/Formal/')

target_folders=('BothCardCenter/Formal/'  'BothEnglish/Client/'  'BothEnglish/EnExamCenter/Formal/' 'BothEnglish/EnFun/Formal/'  'BothEnglish/ExamCenter/Formal/'  'BothEnglish/GrammarCenter/Server/'  'BothEnglish/ListenTalkCenter/Formal/Server/'  'BothEnglish/ReadCenter/Formal/Server/'  'BothEnglish/SyncCenter/Formal/Server/'  'BothEnglish/UserCenter/Formal/Server/'  'BothEnglish/WriteCenter/Formal/Server/'  'BothExamCenter/Formal/'  'BothLeagueCenter/Formal/'  'BothManageCenter/Formal/'  'BothOrderCenter/Formal/'  'BothPassport/Formal/'  'BothUserCenter/Formal/'  'CnOfficial/FormalV2/'  'CnOfficial/Formal/'  'CommLib/'  'Official/Formal/'  'StaticCenter/'  'XueBaJiang/Formal/'  'ZhiJiao365/OfficialWebsite/Formal/'  'ZhiJiao365/StudyCenter/Formal/')

for (( i = 0; i < ${#folders[@]}; i++ )); do
    echo ${folders[$i]}
    if [ ! -d "/data/web/${folders[$i]}" ]
    then
        mkdir -p "/data/web/${folders[$i]}"
    fi
    /usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' "root@target_ip:/data2/web/${folders[$i]}" "/data/web/${target_folders[$i]}" --exclude="**/inc/Conf.inc" --exclude="**/Apis.php"
done
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' "root@target_ip:/data2/web/SSLCertificates/" "/data/web/SSLCertificates/"


:<<!
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothCardCenter/Formal/ /data/web/BothCardCenter/Formal/ --exclude="Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothEnglish/Client/ /data/web/BothEnglish/Client/
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothEnglish/EnFun/Formal/ /data/web/BothEnglish/EnFun/Formal/ --exclude="Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothEnglish/ExamCenter/Formal/ /data/web/BothEnglish/ExamCenter/Formal/ --exclude="Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothEnglish/SyncCenter/Formal/ /data/web/BothEnglish/SyncCenter/Formal/ --exclude="Entry/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothEnglish/UserCenter/Formal/ /data/web/BothEnglish/UserCenter/Formal/ --exclude="Server/Entry/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothExamCenter/Formal/ /data/web/BothExamCenter/Formal/ --exclude="Server/Entry/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothLeagueCenter/Formal/ /data/web/BothLeagueCenter/Formal/ --exclude="Server/Entry/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothManageCenter/Formal/ /data/web/BothManageCenter/Formal/ --exclude="Server/Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothOrderCenter/Formal/ /data/web/BothOrderCenter/Formal/ --exclude="Web/inc/Conf.inc"

/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothPassport/Formal/ /data/web/BothPassport/Formal/ --exclude="Web/inc/Conf.inc"

/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/BothUserCenter/Formal/ /data/web/BothUserCenter/Formal/ --exclude="Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/CnOfficial/FormalV2/ /data/web/CnOfficial/FormalV2/ --exclude="Server/Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/CnOfficial/Formal/ /data/web/CnOfficial/Formal/ --exclude="Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/CommLib/ /data/web/CommLib/
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/Official/Formal/ /data/web/Official/Formal/ --exclude="Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' "root@target_ip:/data2/web/SSL\ Certificates/" "/data/web/SSL Certificates/"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/StaticCenter/ /data/web/StaticCenter/
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/XueBaJiang/Formal/ /data/web/XueBaJiang/Formal/ --exclude="db/base_db*"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/ZhiJiao365/OfficialWebsite/Formal/ /data/web/ZhiJiao365/OfficialWebsite/Formal/ --exclude="Web/inc/Conf.inc"
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/web/ZhiJiao365/StudyCenter/Formal/ /data/web/ZhiJiao365/StudyCenter/Formal/ --exclude="Server/Entry/inc/Conf.inc"
!



rm -rf /data/tmp/mysql/*
/usr/bin/rsync -avzP --delete -e '/usr/bin/ssh -p port' root@target_ip:/data2/ftp/shfftp/mysqlDatabases/BAK/$(date +%Y%m%d)/* /data/tmp/mysql/

for file in /data/tmp/mysql/*
do
	if test -f $file
	then
		/usr/bin/gzip -d $file
	fi
done

for file in /data/tmp/mysql/*
do
	if test -f $file
	then
		/usr/bin/mysql -uroot -ppassword < $file
	fi
done
