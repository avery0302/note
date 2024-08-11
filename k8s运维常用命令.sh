#验证是否连接上k8s服务器
sudo -E kubectl version
#查询集群信息
sudo -E kubectl cluster-info
#查询工作负载
sudo -E kubectl get deployments -n isc-testservice
#查询pod
sudo -E kubectl get pods -n isc-testservice
#查询副本名称和时间
sudo -E kubectl get replicaset -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.metadata.creationTimestamp}{"\n"}{end}' -n isc-testservice
#查询修订号
sudo -E kubectl rollout history deployment/a-servicecdemoamicroservice01-demoamicroservice01 -n isc-testservice
#重启工作负载
sudo -E kubectl rollout restart deployment/a-servicecdemoamicroservice01-demoamicroservice01 -n isc-testservice
#工作负载回滚到上一个版本
sudo -E kubectl rollout undo deployment/a-servicecdemoamicroservice01-demoamicroservice01 -n isc-testservice
#工作负载回滚到指定版本
sudo -E kubectl rollout undo deployment/a-servicecdemoamicroservice01-demoamicroservice01 -n isc-testservice --to-revision=8
:'
注意事项：

1、k8s相关命令需要管理员权限

2、虚拟机连接k8s服务器需要在虚拟机增加配置文件，包含服务器证书校验字段、客户端证书和私钥

3、使用管理员权限后配置文件仍然需要读取用户路径下的，所以需要-E参数
'