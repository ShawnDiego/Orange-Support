# Orange Player 安装（GitHub 安装包版）

> 首选仍是 [Microsoft Store](https://apps.microsoft.com/detail/9NTVLFKQM6LP?cid=orange_github_setup&gl=CN&hl=zh-cn)（自动更新）。
> 用不了商店就用下面这个安装包：**一个文件，双击，下一步到底**，不需要管理员权限，不用装证书。

## 1.0.4.0

| 文件 | SHA256 |
| --- | --- |
| `OrangePlayer_Setup_1.0.4.0_x64.exe`（约 106MB） | `234c8cea9c5b1b1db0be96d357e8900b37e5278a9ff9dc104dbc3981bb561a42` |

安装前可核对哈希：`Get-FileHash OrangePlayer_Setup_1.0.4.0_x64.exe -Algorithm SHA256`

## 步骤（3 步）

1. 从本仓库 [Releases](../../releases)（`v1.0.4.0`）下载 `OrangePlayer_Setup_1.0.4.0_x64.exe`
2. 双击 → 按提示“下一步”装完（装到你自己的用户目录，不用管理员）
3. 开始菜单搜 **Orange Player** 打开；双击视频文件也能直接用 Orange Player 播

首次运行下载的 exe 时，Edge / Windows 可能会提示“不常见下载”或“未知发布者”→
选“保留”/“更多信息 → 仍要运行”。这是未花钱买签名证书的独立软件的正常现象，
文件哈希对得上就没问题。

## 说明

- 系统要求：Windows 10 2004（10.0.19041）及以上 · 64 位
- 安装包不会抢你的默认播放器：它只把 Orange Player 加进“打开方式”，设默认由你在
  Windows 设置 → 默认应用里决定
- 更新：下载新版安装包直接覆盖安装即可，媒体库和播放进度保留
- 卸载：设置 → 应用 → Orange Player → 卸载（媒体库数据默认保留）

装不上就带着截图和 Windows 版本到 [Issue](https://github.com/ShawnDiego/Orange-Support/issues/new/choose) 找我们。
