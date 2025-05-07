awk '{sec=substr($4,2,20);reqs++;reqBySec[sec]++;bytes+=$10;byteBySec[sec]+=$10;}END{printf("请求总次数：%d\n", reqs);printf("平均每秒请求次数：%f\n",reqs/length(reqBySec));printf("服务器下行总流量：%fGB\n", bytes/1024/1024/1024);printf("平均每秒带宽：%fMB\n",bytes/1024/1024/length(byteBySec))}'  access.log;

awk '{print $7 $10}' access.log|sort |uniq -c |sort -nr |head -10

awk '{if ($7 > 5){print $6}}' access.log|sort|uniq -c|sort -rn |head -10


awk '{sec=substr($4,2,20);byteBySec[sec]+=$10;} END{for(s in byteBySec){printf("%fMB %s\n", byteBySec[s]/1024/1024, s)}}' access.log | sort -nr | head -n 50 | awk '{printf("%s %fMB\n",$2,$1)}';

awk '{ip=$1;reqByIp[ip]++;}END{printf("请求总IP数量:%d\n", length(reqByIp));}' access.log;


awk -v limit=2 '{min=substr($4,2,17);reqs[min]++;if($11>limit){slowReqs[min]++;}} END{for(m in slowReqs){printf("%s %s%s %s %s\n", m, slowReqs[m]/reqs[m] * 100, "%", slowReqs[m], reqs[m])}}' access.log

