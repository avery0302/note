判断虚拟机所处的网络环境
1. sudo ping -c 2 baidu.com
2. sudo ping -c 2 w3.huawei.com
3. sudo curl ifconfig.me
百度通w3不通：虚拟机属于外网
百度不通w3通：虚拟机属于内网
三个都不通：虚拟机没有公网ip，只能在局域网内使用，curl也是不通的