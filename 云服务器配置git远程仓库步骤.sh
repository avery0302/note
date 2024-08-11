#安装git
git --version
yum install git
#项目初始化成git仓库
进入项目文件夹下
git status
git init
#配置本地仓库的身份标识
git config --global user.email "133585xxxx@qq.com"
git config --global user.name "yuki"
git config --global credential.helper store（地址为https时配置记住密码，ssh不需要）
#配置git远程仓库地址（用ssh地址，因为https地址会超时）
git remote -v
git remote add origin git@github.com:avery0302/note.git
#生成ssh公钥私钥并分别配置
ssh-keygen -t rsa -b 4096 -C "133585xxxx@qq.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
进入id_rsa.pub文件，复制公钥到github
#创建分支:本地文件>暂存区>本地仓库>远程仓库
git status
git branch -vv 
git checkout -b dev_yuki
git add .
git commit -m "初始化代码仓"
git push -u origin dev_yuki:dev
git push origin dev_yuki:main
