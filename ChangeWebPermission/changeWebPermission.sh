#!/bin/bash

changeContext() {
    echo "正在更改目录Context：$1";
    sudo semanage fcontext -a -t httpd_sys_content_rw_t "$1(/.*)?";
    sudo restorecon -R -v $1;
}

changePermission() {
    echo "正在更改目录Permission：$1";
    sudo /usr/bin/setfacl -R -m u:apache:rwx $1
    sudo /usr/bin/setfacl -R -d -m u:apache:rwx $1
}


changePermission '/data/web';

# sudo semanage fcontext -a -t httpd_sys_content_t "/data/web(/.*)?";
# sudo restorecon -R -v /data/web/

folders=$(find /data/web/ -name Upload* -type d)
for folder in $folders
do
    changeContext $folder;
    changePermission $folder;
    # echo "$folder(/.*)?";
    # sudo semanage fcontext -a -t httpd_sys_content_rw_t "$folder(/.*)?";
    # sudo restorecon -R -v $folder;
    # /usr/bin/chcon -R -t httpd_sys_content_rw_t $folder
    # /usr/bin/setfacl -R -m u:apache:rwx $folder
    # /usr/bin/setfacl -R -d -m u:apache:rwx $folder
done;

