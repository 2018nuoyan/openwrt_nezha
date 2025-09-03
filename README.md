# openwrt_nezha

哪吒监控 For OpenWRT


## 简介

用于在旧版OpenWRT及LEDE中快捷添加Nezha客户端的项目，解决OpenWRT需要手动添加服务的问题。
匹配最新v1版本
和旧版本v0版本

旧版和最新版本不能同时编译


## 用法

### 编译

将 `src-git nezha https://github.com/2018nuoyan/openwrt_nezha` 添加至 `feeds.conf.default` 后执行

./scripts/feeds update -a && ./scripts/feeds install -a

找到luci-app-nezha 选中后编译即可





## 致谢

部分代码来自P3TERX <https://p3terx.com> 和 KFERMercer <KFER.Mercer@gmail.com>

源项目为: <https://github.com/naiba/nezha>

非常感谢！


