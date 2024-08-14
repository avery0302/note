centos7安装软件包步骤
#查询是否已安装
node -v
#查询centos官方源中可用的版本
yum repolist
yum list available nodejs

#方式1：安装旧版本
yum install nodejs

#方式2：从github下载最新的版本
从github拷贝新版本的下载路径
curl -L https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
L:自动跟随重定向 o:下载路径 /usr/local/bin:全局可执行文件路径
#添加执行权限
chmod +x /usr/local/bin/docker-compose
x:execute