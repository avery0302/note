手机首次拉取git远程仓库的流程
#克隆远程
cd /storage/emulated/0/0-github
git clone https://github.com/avery0302/hub8001.git
#授予子文件夹权限
git config --global --add safe.directory /storage/emulated/0/0-github/hub8001
git config --global --list
#建立分支映射
cd hub8001
git checkout -b dev_phone origin/dev
#查询远程
git remove -v
git branch -vv