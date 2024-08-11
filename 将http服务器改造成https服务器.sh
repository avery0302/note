首先声明：https协议可以对信息加密，防止fiddler直接看到传输的信息，但是如果你在fiddler生成了证书，https就没有防护效果了
#生成自签名证书
openssl req -nodes -new -x509 -keyout server.key -out server.cert
注意点：在dockerfile文件同一级下执行，否则打包镜像时打不进去
#代码修改
改造前：http.createServer((req, res)=>{})
改造后：https.createServer({key:私钥路径,cert:证书路径},(req, res)=>{})
#用户侧的改变
url位置从灰色的不安全变成了红色的不安全（笑死，更明显了）

#申请证书
#放到dockerfile文件同一级路径下
#用户侧的改变