#sql注入（网页输入框）
利用sql语句的语法规则和拼接习惯，针对用户输入直接拼接到sql语句的情况进行攻击
最终能够从数据库查询到不属于自己的信息
#脚本注入（网页输入框）
由于js中可以执行静态脚本，针对用户输入直接拼接到js执行语句的情况进行攻击
目的是为了让网站使用者跳转到自己伪造的网站，诱导用户输入用户名密码
或者为其他人使用这个网站造成阻碍，不断弹出弹窗等，也叫xss攻击
#中间人攻击（抓包工具）
使用fiddler等抓包工具，截获用户请求网站的流量，目的是拿到其他人输入的用户名密码
各种数据加密、diffie-hellman都是为了防这个的
#弱口令暴力破解（命令行）
使用Hydra等暴力破解工具，对于已知的ip端口和服务自动尝试大量常见密码，最终目的是试出网站端口的用户名密码，从而攻击
#网络阻塞攻击（命令行）
使用ab等命令行工具，对于ip进行压力测试，占用ip的全部连接数，目的是其他人访问网站卡顿，也叫ddos攻击