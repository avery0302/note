常用网络协议用途及联系

#TCP/UDP
数据传输协议：提供数据传输服务
#SSL/TLS
安全协议：提供加密、完整性校验、身份认证服务
#HTTP/HTTPS
web协议：提供浏览网页服务
#SSH
远程访问协议：提供远程登录服务
#不同协议之间的关系
HTTPS=TCP+TLS，基于tcp的443端口
SSH=TCP+五大加密协议，基于tcp的22端口
HTTP≈TCP，http用tcp建立的可靠连接来传输超文本，基于tcp的80端口
DNS解析和电话会议通常基于UDP，DNS基于UDP或者TCP的53端口
UDP和TCP的端口号可以重复使用，不会互相影响