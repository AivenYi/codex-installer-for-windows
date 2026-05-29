# desensitize-files.ps1 - 将配置脱敏后分享给朋友
param([string]$SourceDir = "$env:USERPROFILE\.codex")

$outDir = Join-Path $SourceDir "share-to-friend"
New-Item -ItemType Directory -Path $outDir -Force | Out-Null

function Write-OK { param([string]$T) Write-Host "  [OK] $T" -ForegroundColor Green }

$script = Join-Path $SourceDir "Start_Deepseek_relay.ps1"
$config = Join-Path $SourceDir "config.toml"

if (Test-Path $script) {
    $c = Get-Content $script -Raw
    $c = $c -replace "(?<=`$apiKey = `")[^`"]*", "sk-xxxx...xxxx(此处替换为你的Key)"
    $c | Out-File (Join-Path $outDir "Start_Deepseek_relay_desensitized.ps1") -Encoding utf8
    Write-OK "Start_Deepseek_relay_desensitized.ps1"
}
if (Test-Path $config) {
    Copy-Item $config (Join-Path $outDir "config.toml") -Force
    Write-OK "config.toml"
}
$readme = "使用方法：将 Start_Deepseek_relay_desensitized.ps1 中的 '此处替换为你的Key' 替换为你的真实 API Key 即可使用。"
$readme | Out-File (Join-Path $outDir "README.txt") -Encoding utf8

Write-OK "输出目录: $outDir"
Start-Process "explorer.exe" $outDir
