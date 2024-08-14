云服务器配置git远程push步骤
#安装git
git --version
yum install git

#配置本地仓库的身份标识（首次commit前需要用到）
git config --global --list
git config --global user.email "133585xxxx@qq.com"
git config --global user.name "yuki"

#生成ssh公钥私钥并分别配置
ssh-keygen -t rsa -b 4096 -C "133585xxxx@qq.com"
在/root/.ssh生成了公钥文件和私钥文件
进入id_rsa.pub文件，复制公钥到github

#项目初始化成git仓库
cd note
git status
git init

#建立本地和远程映射（用ssh地址，因为https地址会超时）
git remote add origin git@github.com:avery0302/note.git
git checkout -b dev_linux（如果远程是空的，那么这一步无法建立分支映射）

#验证映射
git remote -v
git branch -vv

#执行提交:本地文件>暂存区>本地仓库>远程仓库
git status
git add .
git commit -m "初始化代码仓"
git push -u origin dev_linux:dev（先建立的dev为远程默认分支，打开仓库页面会先看到这个分支）
git push origin dev_linux:main