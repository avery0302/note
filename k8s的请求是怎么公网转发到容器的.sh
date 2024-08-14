k8s的请求是怎么公网转发到容器的

#部署架构示例
|beta集群
——|节点192.168.0.132
——|节点192.168.0.151/100.95.xxx.214
————|实例172.18.0.103
————|实例172.18.0.102
——|服务10.247.30.162/100.93.xxx.126
——|服务10.247.205.31/100.95.xxx.184
|safe集群
——|节点192.168.2.74/100.85.xxx.73
————|实例10.0.0.9
————|实例10.0.0.7
——|服务10.247.63.66
——|服务10.247.102.201

#各级别之间的关系
集群：无ip，一个集群包含多个节点，包括master节点和工作节点，实例运行在工作节点上，master节点负责总的调度
节点：节点ip+nodePort，一个节点可以运行多个实例，也就是pod，pod重启后ip会改变
服务：集群ip+port，服务不包含任何进程，只作为一种策略存在，用于固定一组pod的对外ip，负责分发流量
工作负载：无ip，是实例的模板，一个工作负载可以生成多个实例
实例/pod：实例ip+targetPort，一个pod可以运行多个容器，通过不同的端口提供服务，
容器：实例ip+containerPort，比如前端容器和后端容器

#外部请求走elb
elb公网ip——>elb私网ip
——>服务port:8080(配置targetPort:5000)
——>后端容器containerPort:5000（前端容器containerPort:3000闲置）
#外部请求不走elb
弹性公网ip——>节点nodePort:30080
——>服务port:8080(配置targetPort:5000)
——>后端容器containerPort:5000（前端容器containerPort:3000闲置）
#内部前端请求路径
http请求
——>服务port:8080(配置targetPort:5000)
——>后端容器containerPort:5000
#外部前端请求路径
http请求
——>elb公网ip——>elb私网ip
——>服务port:8080(配置targetPort:5000)
——>后端容器containerPort:5000
注：前端不能直接请求后端，要通过服务来请求，这样才能让权给k8s实现资源的调配