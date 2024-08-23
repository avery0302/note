生产环境前后端架构
#obs部署前端
静态资源请求（目标是obs，一般是首次请求）：url地址栏——cdn——obs
ajax请求（目标是mysql/obs）：网页点击/初始化——apig——cce(java)——mysql/obs

#nginx部署前端
静态资源请求（目标是cce中的nginx）：url地址栏——cdn——cce(nginx)
ajax请求（目标是mysql/nginx）：网页点击/初始化——apig——cce(java)——mysql/cce(nginx)

#每个环节的作用
cdn：解决地域距离服务器较远导致的网络请求慢问题
apig：前端和后端的桥梁，接口列表，请求日志
cce：后端服务冗余部署，实现高可用
obs：非结构化数据存储服务，提供http请求的能力，这里存储前端静态页面
mysql：结构化数据存储服务，这里存储所有业务数据
nginx：提供http请求的能力，同时隐藏服务器ip