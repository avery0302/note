目的是为了从数据库查询到不属于自己的信息
#攻击方式
如果输入框的信息是直接拼接到sql语句的where条件里，比如where user='${输入信息}'
攻击者可以在input框输入
admin' or '1'='1
sql语句会被拼接成where user='admin' or '1'='1'
进而打破where条件的限制，查询到任何用户的信息
#防范方式
"
使用where user=#{输入信息}
同样的输入会被转义拼接为where user='admin'' or ''1''=''1'
sql数据库把'视为有实际作用的单引号，而把''视为字符串中没有作用的单引号，从而导致攻击失败
"
#${}需要保留的必要性
如果列名是动态引用的 where #{user}='admin'
会被解析为 where 'user'='admin' 导致报错，因为列名不是字符串
此时只能使用 where ${user}='admin'
