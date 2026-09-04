<#
.SYNOPSIS
    安装 Orange 直装版（GitHub sideload 包）。
.DESCRIPTION
    1. 把同目录的 OrangePlayer.cer 装进本机“受信任人”（需要管理员权限，
       未提权时脚本会自动请求提权，只此一步需要管理员）。
    2. 用 Add-AppxPackage 安装同目录的 OrangePlayer_<版本>_x64.msix。
    商店版不受影响；直装版与商店版可并存，但应用数据不互通。
.EXAMPLE
    右键 Install.ps1 → 使用 PowerShell 运行；按 UAC 提示点“是”即可。
    若被执行策略阻止，请在管理员 PowerShell 里运行：
    powershell -NoProfile -ExecutionPolicy Bypass -File .\Install.ps1
#>
#Requires -Version 5.1

$ErrorActionPreference = "Stop"

$scriptPath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path -Parent $scriptPath

function Test-IsAdministrator {
    $principal = New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent())
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-IsAdministrator)) {
    Write-Host "正在请求管理员权限（仅用于安装证书）…" -ForegroundColor Yellow
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit 0
}

$cerPath = Join-Path $scriptDir "OrangePlayer.cer"
$msix = Get-ChildItem -Path $scriptDir -Filter "OrangePlayer_*.msix" -File -ErrorAction SilentlyContinue |
    Sort-Object Name -Descending |
    Select-Object -First 1

if (-not (Test-Path -LiteralPath $cerPath -PathType Leaf)) {
    throw "找不到证书文件：$cerPath。请把 Release 里下载的 OrangePlayer.cer 和本脚本放在同一目录。"
}
if ($null -eq $msix) {
    throw "找不到安装包：同目录下没有 OrangePlayer_*.msix。请把 Release 里下载的 .msix 和本脚本放在同一目录。"
}

$cer = New-Object Security.Cryptography.X509Certificates.X509Certificate2($cerPath)
Write-Host "证书指纹：$($cer.Thumbprint)"
Write-Host "证书有效期至：$($cer.NotAfter.ToString('yyyy-MM-dd'))"

$alreadyTrusted = Get-ChildItem -Path "Cert:\LocalMachine\TrustedPeople" -ErrorAction SilentlyContinue |
    Where-Object { $_.Thumbprint -eq $cer.Thumbprint }
if ($null -eq $alreadyTrusted) {
    Write-Host "[1/2] 正在安装证书到本机“受信任人”…" -ForegroundColor Yellow
    Import-Certificate -FilePath $cerPath -CertStoreLocation "Cert:\LocalMachine\TrustedPeople" | Out-Null
    Write-Host "证书已信任。" -ForegroundColor Green
}
else {
    Write-Host "[1/2] 证书已在受信任列表中，跳过。" -ForegroundColor Green
}

Write-Host "[2/2] 正在安装 $($msix.Name)…" -ForegroundColor Yellow
Add-AppxPackage -Path $msix.FullName -ForceApplicationShutdown
Write-Host "安装完成。" -ForegroundColor Green

$installed = Get-AppxPackage -Name "ShawnDiego.OrangePlayer" -ErrorAction SilentlyContinue |
    Where-Object { $_.Publisher -eq "CN=ShawnDiego" }
if ($null -ne $installed) {
    Write-Host "已注册：$($installed.Name) $($installed.Version)（直装版）" -ForegroundColor Green
    Write-Host "在开始菜单搜索 OrangePlayer 即可打开。"
}
else {
    Write-Warning "未检测到直装版注册信息，请截图本窗口输出并到 GitHub 提 Issue。"
}
