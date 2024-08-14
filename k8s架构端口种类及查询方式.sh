k8s架构端口种类及查询方式
#####netstat中端口种类
①tcp监听端口
②tcp已经建立连接的端口
③tcp一方发起关闭的端口
④udp端口

###netstat不同参数查询范围的区别
（n：no，不把ip解析为主机名，p：process，显示进程名，-E:对grep增强，-v：过滤不包含的）
netstat -tul(np)
包含①④
netstat -tu(np)
包含②③
netstat (-np)
包含②，还会列出非网络协议的端口，如本地进程间通信（UNIX domain sockets）的端口
netstat -tua(np)
包含①②③④
netstat -ta(unp) | grep -E 'LISTEN'
包含①
netstat -ta(unp) | grep -E 'ESTABLISHED|LISTEN'
包含①②
netstat -ta(unp) | grep -E 'ESTABLISHED|LISTEN' | grep -v '127.0.0.1'
包含①②（过滤掉所有本地回环端口）

#####k8s中端口种类
⑤nodePort 节点监听的端口，通向特定服务
⑥loadBalancer 请求被负载均衡接管，列出的端口实际是nodePort
⑦clusterIp 服务只能在集群内部访问
⑧port 服务监听的端口
⑨targetPort 服务指定的容器端口
⑩containerPort 容器监听的端口

###查询渠道
#kubectl get svc --all-namespaces
包含⑧+⑤
#容器内执行netstat -tul(np)
包含⑩
#服务的yaml文件
包含⑧⑨⑩+⑤
#工作负载或pod的yaml文件，里面的containerPort
包含⑩

#####nmap查询范围
nmap -sS -n -p 1-65535 192.168.2.74
包含①⑤（去除①中的本地回环端口）
nmap -sU -n -p 1-65535 127.0.0.1
包含④
nmap -sS -n -p 1-65535 10.0.0.9
包含⑩

#####通讯矩阵应该包含的范围
在nmap扫描范围①④⑤⑩以外，额外加个②