# -*- coding: utf-8 -*-
# This file is auto-generated, don't edit it. Thanks.

import sys
import json
from get_domain_list import Sample as DomainGetList
from edit_domain_list import Sample as DomainEdit



def to_new(domain_list):
    for domain_item in domain_list:
        DomainGetList.main(domain_item, sys.argv[1:])
        with open('./' + domain_item + '.json', 'r', encoding='utf8')as fp:
            json_data = json.load(fp)
            DomainRecords = json_data['body']['DomainRecords']['Record']
            for item in DomainRecords:
                if item['Value'] == '202.85.217.64':
                    item['Value'] = '182.92.101.228'

                if item['Value'] == '202.85.217.61':
                    item['Value'] = '123.57.7.113'

                if item["RR"] + "." + item['DomainName'] == 'ftp.bsccedu.com':
                    item['Value'] = '123.57.7.113'

                if item["RR"] + "." + item['DomainName'] == 'git.bsccedu.com':
                    item['Value'] = '101.200.90.19'

                if item["RR"] + "." + item['DomainName'] == 'svn.bsccedu.com':
                    item['Value'] = '101.200.90.19'

                if item['Value'] == '202.85.217.97' and item['DomainName'] == 'xuebajiang100.com':
                    item['Value'] = '123.57.7.113'
                DomainEdit.main(item, sys.argv[1:])
            with open(domain_item + ".new.json", 'w') as f:
                json_data['body']['DomainRecords']['Record'] = DomainRecords
                f.write(json.dumps(json_data))


def to_old(domain_list):
    for domain_item in domain_list:
        DomainGetList.main(domain_item, sys.argv[1:])
        with open('./' + domain_item + '.json', 'r', encoding='utf8')as fp:
            json_data = json.load(fp)
            DomainRecords = json_data['body']['DomainRecords']['Record']
            for item in DomainRecords:
                if item['Value'] == '182.92.101.228':
                    item['Value'] = '202.85.217.64'

                if item['Value'] == '123.57.7.113':
                    item['Value'] = '202.85.217.61'

                if item["RR"] + "." + item['DomainName'] == 'ftp.bsccedu.com':
                    item['Value'] = '202.85.217.97'

                if item["RR"] + "." + item['DomainName'] == 'git.bsccedu.com':
                    item['Value'] = '202.85.217.71'

                if item["RR"] + "." + item['DomainName'] == 'svn.bsccedu.com':
                    item['Value'] = '202.85.217.71'

                if item['Value'] == '123.57.7.113' and item['DomainName'] == 'xuebajiang100.com':
                    item['Value'] = '202.85.217.97'
                DomainEdit.main(item, sys.argv[1:])
            with open(domain_item + ".new.json", 'w') as f:
                json_data['body']['DomainRecords']['Record'] = DomainRecords
                f.write(json.dumps(json_data))


if __name__ == '__main__':
    if len(sys.argv) == 3 and sys.argv[1] and sys.argv[2]:
        domain_list = ['ruidamath.com', 'ruidamath.cn']
        if sys.argv[1] == 'formal':
            domain_list = ['shuborui.cn','yujing100.cn','bsccedu.com','ruidaenglish.com.cn','yuwen100.cn','zhijiao365.com','en100.com.cn','xuebajiang100.com','bsccall.cn']
        if sys.argv[2] == 'to_new':
            # to_new(domain_list)
            print("to_new", domain_list)
        else:
            # to_old(domain_list)
            print("to_old", domain_list)
    else:
        print('参数错误')