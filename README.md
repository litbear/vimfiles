# 我的vim配置文件

初学阶段，没什么插件，不建议大家拿去用。


## 使用流程

### windows

- 首先将本代码库克隆到用户文件夹下
- 再更新git仓库子模块
- 安装vundle插件列表
- 使用管理员权限建立软连接 

```
cd %USERPROFILE%

git clone git@github.com:litbear/vimfiles.git

cd vimfiles

git submodule update --init --recursive

mklink /H /J "%USERPROFILE%\.vim" "%USERPROFILE%\vimfiles"
```