渗透测试攻击方式-中间人攻击
目的是作为中间人拿到其他人输入的用户名密码
#fiddler使用技巧
1、使用管理员身份启动fiddler
2、使用reset all certificates来安装根证书，不要使用默认的安装程序
#攻击过程
比如支付宝有一个http服务器，用户访问需要输入用户名密码，我作为一个网吧老板在每台机子上都安装了fiddler抓包工具
一旦有用户在我的网吧里访问支付宝页面，我的fiddler就会自动截获用户发出的请求，等待用户离开，我就能拿到用户的信息
因为http协议明文传输，也不校验服务器身份，所以用户中间不会有任何察觉
随着用户投诉的增多，支付宝觉得http协议不安全，所以把自己的服务器改造成了https服务器
现在我在后台长期开着fiddler，用户在访问支付宝首页时会被提示网站有风险
但是我也做了进一步侵入，我让浏览器A信任了fiddler的根证书，这样浏览器A对于https服务器也不会提示风险了
那些使用了浏览器A的用户，信息会被我窃取，而使用其他浏览器的用户，也会有一部分被我窃取，因为他们忽视了网站的风险提示
但是支付宝随后进一步加强了网站的防范，在https服务器的基础上使用了hsts策略，这使得用户无法忽略网站的风险，有风险会直接阻止访问
现在我只能窃取使用浏览器A的用户的信息了
#防范方式
无法彻底防范，对于服务器只能做到配置https服务器+hsts策略
而用户最好还是检查一下浏览器的证书吧，不要在公共电脑上输入敏感信息