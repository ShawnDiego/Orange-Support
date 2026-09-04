# Orange 直装版安装指南（GitHub sideload 包）

> 首选仍是 [Microsoft Store](https://apps.microsoft.com/detail/9NTVLFKQM6LP?cid=orange_github_sideload&gl=CN&hl=zh-cn)（自动更新、无需任何手动步骤）。
> 直装包是给“用不了商店”的情况准备的：手动下载、手动更新。

## 版本信息（1.0.4.0）

| 文件 | SHA256 |
| --- | --- |
| `OrangePlayer_1.0.4.0_x64.msix` | `774fb7476c7f3affdc3b62065f57b23a1d93a84a1a8073b44b19769322552c14` |
| `OrangePlayer.cer` | `e91a41260a358c6ced39f742f7a08640cf1ec4152cd3d196e8bae05131ef97d4` |

- 证书主题：`CN=ShawnDiego`，指纹 `EBECA604846D45F01417B28EC733D282DA0F6046`，有效期至 2031-09-04
- 安装前可用 `Get-FileHash <文件> -Algorithm SHA256` 自行核对
- 系统要求：Windows 10 2004（10.0.19041）及以上 · 64 位；无需开发者模式

## 安装步骤

1. 从本仓库 [Releases](../../releases) 下载同一版本（如 `v1.0.4.0`）的 3 个文件，
   放进同一个文件夹：`OrangePlayer_1.0.4.0_x64.msix`、`OrangePlayer.cer`、`Install.ps1`
2. 右键 `Install.ps1` → **使用 PowerShell 运行**，在 UAC 弹窗点“是”
   - 脚本只做两件事：把证书装进本机“受信任人”，然后安装 `.msix`
   - 若右键运行被执行策略阻止，改用管理员 PowerShell 执行：
     `powershell -NoProfile -ExecutionPolicy Bypass -File .\Install.ps1`
3. 看到“安装完成”，去开始菜单搜索 **OrangePlayer** 打开

Edge 下载时若提示“不常见下载”→ 选“保留”；这是自签名包的正常现象，
文件哈希对得上就没问题。

## 更新

直装版没有自动更新：新版本发布后重新下载 3 个文件（`.msix` 换成新版），
再跑一次 `Install.ps1` 覆盖安装即可（要求新版本号大于已安装版本，数据保留）。

## 和商店版的关系

- 可**并存**，互不干扰；但**应用数据不互通**（媒体库、播放进度各存各的）
- 文件关联（双击视频默认用谁打开）按你在 Windows“默认应用”里的选择生效

## 卸载

1. 设置 → 应用 → 找到 OrangePlayer → 卸载（商店版和直装版是两个条目，别卸错）
2. 可选：不再用直装版时，在 `certlm.msc`（本地计算机证书）
   → 受信任人 → 证书里删除主题为 `CN=ShawnDiego` 的那张

## 常见问题

- `0x800B0109`（证书不受信任）：证书没装好，重新以管理员身份跑一次 `Install.ps1`
- 脚本一闪而过：右键运行时被执行策略拦了，用上面的管理员 PowerShell 命令运行
- 提示版本低于已安装：Release 里拿的是旧包，去拿最新版
- 证书过期后装新版：先双击新 `OrangePlayer.cer` 装进“受信任人”，再装新 `.msix`
  （证书轮换时 Release 说明会置顶提醒）

装不上就带着截图和 Windows 版本到 [Issue](https://github.com/ShawnDiego/Orange-Support/issues/new/choose) 找我们。
