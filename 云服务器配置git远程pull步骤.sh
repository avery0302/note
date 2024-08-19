云服务器配置git远程pull步骤
#安装git
git --version
yum install git

#生成ssh公钥私钥并分别配置(每次新建仓库都要重新生成)
ssh-keygen -t rsa -b 4096 -C "133585xxxx@qq.com"
在~/.ssh生成了公钥文件和私钥文件
进入id_rsa.pub文件，复制公钥到github设置的ssh key列表中

#克隆远程仓库
cd github
git clone git@github.com:avery0302/note.git

#建立本地和远程分支映射
cd note
git status
git checkout -b dev_linux origin/dev

#验证映射
git remote -v
git branch -vv