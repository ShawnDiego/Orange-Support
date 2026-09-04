# Orange · 你的 Windows 个人影视库

> Windows 上的个人影视库管理与沉浸播放工具：把本地文件夹、NAS、网盘和媒体服务器里的内容，整理成一个好找、好看、好播的影视库。

**本仓库只承载产品公开说明、版本信息、公开问题讨论和安全报告入口，不包含 Orange 主程序源码，也不是开源代码仓库。成品首选 Microsoft Store，同时在 Releases 提供 GitHub 直装包。**

---

## 从 Microsoft Store 获取

[![Microsoft Store](https://img.shields.io/badge/Microsoft%20Store-OrangePlayer-0078D4?logo=microsoftstore&logoColor=white)](https://apps.microsoft.com/detail/9NTVLFKQM6LP?cid=orange_github_support&gl=CN&hl=zh-cn)

**[➜ 打开 Microsoft Store：OrangePlayer](https://apps.microsoft.com/detail/9NTVLFKQM6LP?cid=orange_github_support&gl=CN&hl=zh-cn)**

- 系统要求：Windows 10 2004（10.0.19041）及以上 · 64 位
- 当前版本以商店页面为准；安装与更新全部由商店负责
- 如果 Orange 帮到了你，请在商店里打个评分、留句话——这是对我们最大的支持 🙏

> 用不了商店？可用 [GitHub 直装包](INSTALL-SIDELOAD.md)：去 [Releases](../../releases) 下载
> 同版本的 `.msix` + `.cer` + `Install.ps1`，右键脚本一键安装（需点一次 UAC）。
> 直装版与商店版可并存、数据不互通；直装版需手动更新。

---

## Orange 是什么

- **All in One：** 你只需要记得想看什么，不必记得它存在哪里。一次搜索，同时覆盖本地资料库与已连接的媒体源（NAS、网盘、Plex、Emby 等），结果里直接写清来源和下一步。
- **从文件夹到影视库：** 自动整理海报、年份、演员、分集信息与播放进度；匹配不准可以人工确认。
- **沉浸播放，不打扰：** 内置播放器（libmpv），控制层按需出现；多音轨、多字幕、倍速、截图、播放队列、断点续播、画中画置顶小窗。
- **默认本地：** 媒体库、播放记录、截图默认保存在本机（`%APPDATA%\Orange\`）；媒体源凭据由 Windows Credential Manager 保管。

详细介绍见 **[产品介绍（PRODUCT.md）](PRODUCT.md)**。

---

## 当前版本

- **最新提交：1.0.4.0**（桌面体验版，已提交 Microsoft Store 审核，商店上架状态以商店页面为准）
  - 标题栏全局搜索：合并本地与已连接远端来源（Emby、Plex 等），支持来源筛选与远端详情入库
  - 双击或拖放视频即可播放，支持多文件队列与可选后台入库；注册 `.mp4` / `.mkv` / `.mov` / `.avi` / `.m4v` / `.webm` / `.m2ts` / `.mts` 文件关联
  - 画中画窗口：置顶、可缩放，带播放与前后 15 秒控制
  - 设置页、字幕 / 音轨、缓冲与完成状态体验优化
- **发布边界（诚实说明）：** 1.0.4.0 默认关闭 Orange Cloud 登录、云端备份、增量同步、应用内反馈、Plus / 推荐人入口；微信扫码登录保持关闭。云端能力会在真实账号与双设备验收完成后由后续版本开放，不会在本版本里“画饼”。
- 历史版本说明见官网 [版本说明](https://orange-official-site-orange1-d2gaxdul7d814785d.webapps.tcloudbase.com/release-notes)，GitHub [Releases](../../releases) 会同步每次商店提交的公告。

---

## 官方入口

- [Orange 官网](https://orange-official-site-orange1-d2gaxdul7d814785d.webapps.tcloudbase.com/)
- [产品介绍](PRODUCT.md)（本仓库）
- [版本说明](https://orange-official-site-orange1-d2gaxdul7d814785d.webapps.tcloudbase.com/release-notes)
- [隐私政策](https://orange-official-site-orange1-d2gaxdul7d814785d.webapps.tcloudbase.com/privacy)
- [支持中心](https://orange-official-site-orange1-d2gaxdul7d814785d.webapps.tcloudbase.com/support)
- [提交普通问题或建议](https://github.com/ShawnDiego/Orange-Support/issues/new/choose)
- [私密报告安全问题](https://github.com/ShawnDiego/Orange-Support/security/advisories/new)

---

## 反馈与支持

1. 先看官网 [支持中心](https://orange-official-site-orange1-d2gaxdul7d814785d.webapps.tcloudbase.com/support) 做快速排查（版本、复现步骤、媒体源类型、文件格式/字幕/音轨）。
2. 仍有问题，用 [Issue 模板](https://github.com/ShawnDiego/Orange-Support/issues/new/choose) 提交：Orange 版本、Windows 版本、发生页面、最短复现步骤、实际 vs 预期结果。
3. 涉及账号接管、凭据泄露、跨用户数据访问等安全风险：走 [安全政策](SECURITY.md)，不要建公开 Issue。

⚠️ 不要在公开 Issue 里贴密码、访问令牌、验证码、手机号、邮箱、完整私人媒体路径。诊断日志在 `%APPDATA%\Orange\app.log`，贴之前先脱敏。

---

## 第三方组件

播放器使用 `libmpv`（LGPL-2.1-or-later，上游源码见 [mpv-player/mpv](https://github.com/mpv-player/mpv)），应用不修改 libmpv 本体。完整第三方声明随商店包与官网文档提供。
