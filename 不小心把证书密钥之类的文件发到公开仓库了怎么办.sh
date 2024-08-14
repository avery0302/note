不小心把证书密钥之类的文件发到公开仓库了怎么办
就算删除再推送一次，记录中也会一直包含这个隐私信息
只能清除本地和远程的所有提交记录重开了
#重开本地
rm -rf .git 递归强制删除.git
git init
#设置远程和分支
git remote add origin git@github.com:avery0302/hub8001.git
git checkout -b dev_yuki
#强制推送
git add .
git commit -m "Initial commit"
git push -uf origin dev_yuki:dev
git push -f origin dev_yuki:main
#删除远程脏分支（可选）
git push origin --delete dev_yuki
注：要保证删除的分支不是远程的默认分支