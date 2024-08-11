#修改代码
#进入compose文件同级路径下
cd yuki/server
#重新打包镜像+启动
docker-compose up --build
注意点：不需要停止容器，不需要删除容器，这些compose会全部接管，不要操心