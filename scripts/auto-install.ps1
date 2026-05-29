# auto-install.ps1 - Codex + DeepSeek 一键安装

# 模板 Base64 编码（避免 $ 变量被 PowerShell 解析）

$sB64 = "UmVtb3ZlLUl0ZW0gRW52Ok9QRU5BSV9BUElfS0VZIC1FcnJvckFjdGlvbiBTaWxlbnRseUNvbnRpbnVlDQpSZW1vdmUtSXRlbSBFbnY6Q09EWF9SRUxBWV9VUFNUUkVBTSAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZQ0KUmVtb3ZlLUl0ZW0gRW52OkNPRFhfUkVMQVlfQVBJX0tFWSAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZQ0KDQpTdG9wLVByb2Nlc3MgLU5hbWUgImNvZGV4LXJlbGF5IiAtRm9yY2UgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUNClN0YXJ0LVNsZWVwIC1TZWNvbmRzIDENCg0KIyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCiMgQ29kZXggUmVsYXkg5ZCv5Yqo6ISa5pysDQojIOWmguaenOmBh+WIsOmXrumimO+8jOWPlua2iOS4i+mdouS4gOihjOeahOazqOmHiuWQr+eUqOiwg+ivleaXpeW/l++8mg0KIyAkZW52OkNPRFhfUkVMQVlfTE9HX0xFVkVMID0gImRlYnVnIg0KIyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0KIyDkuI3kvb/nlKjnjq/looPlj5jph4/vvIznm7TmjqXpgJrov4flj4LmlbDlkK/liqgNCiRhcGlLZXkgPSAiX19BUElfS0VZX1BMQUNFSE9MREVSX18iICAgIyDkvaDnmoTnnJ/lrp4gRGVlcFNlZWsgQVBJIEtleQ0KJHVwc3RyZWFtID0gImh0dHBzOi8vYXBpLmRlZXBzZWVrLmNvbS92MSINCiRwb3J0ID0gIjQ0NDYiDQoNCldyaXRlLUhvc3QgIuWQr+WKqOWPguaVsOehruiupDogVXBzdHJlYW0gPSAkdXBzdHJlYW0sIFBvcnQgPSAkcG9ydCINCldyaXRlLUhvc3QgIuaPkOekujog5aaC5p6c6YGH5YiwIDUwMiDplJnor6/vvIzlj5bmtojohJrmnKzlvIDlpLTnmoTosIPor5Xml6Xlv5fms6jph4rlkI7lho3or5UiDQoNCiMg5YWz6ZSu77ya55SoIC0tdXBzdHJlYW0g5ZKMIC0tcG9ydCDlj4LmlbDlkK/liqgNCiMg5aaC6ZyA6LCD6K+V5pel5b+X77yM5re75YqgOiAtLWxvZy1sZXZlbCBkZWJ1Zw0KY29kZXgtcmVsYXkgLS11cHN0cmVhbSAkdXBzdHJlYW0gLS1wb3J0ICRwb3J0IC0tYXBpLWtleSAkYXBpS2V5"

$cB64 = "bW9kZWwgPSAiZGVlcHNlZWstY2hhdCINCm1vZGVsX3Byb3ZpZGVyID0gImRlZXBzZWVrX3JlbGF5Ig0KYXBwcm92YWxfcG9saWN5ID0gIm5ldmVyIg0Kc2FuZGJveF9tb2RlID0gImRhbmdlci1mdWxsLWFjY2VzcyINCnN1cHByZXNzX3Vuc3RhYmxlX2ZlYXR1cmVzX3dhcm5pbmcgPSB0cnVlDQoNClttb2RlbF9wcm92aWRlcnMuZGVlcHNlZWtfcmVsYXldDQpuYW1lID0gIkRlZXBTZWVrIHZpYSBSZWxheSINCmJhc2VfdXJsID0gImh0dHA6Ly8xMjcuMC4wLjE6NDQ0Ni92MSINCndpcmVfYXBpID0gInJlc3BvbnNlcyINCnJlcXVpcmVzX29wZW5haV9hdXRoID0gZmFsc2UNCnN1cHBvcnRzX3dlYnNvY2tldHMgPSBmYWxzZQ0KcmVxdWVzdF9tYXhfcmV0cmllcyA9IDANCnN0cmVhbV9tYXhfcmV0cmllcyA9IDANCnN0cmVhbV9pZGxlX3RpbWVvdXRfbXMgPSAzMDAwMDANCiMg6L+H5ruk5o6JIERlZXBTZWVrIOS4jeaUr+aMgeeahOWPguaVsO+8iOWmgiBzdG9yZe+8iQ0Kc3RyaXBfdW5zdXBwb3J0ZWRfcGFyYW1zID0gdHJ1ZQ0KDQpbcHJvZmlsZXMuZGVlcHNlZWtfY2hhdF0NCm1vZGVsID0gImRlZXBzZWVrLWNoYXQiDQptb2RlbF9wcm92aWRlciA9ICJkZWVwc2Vla19yZWxheSINCmFwcHJvdmFsX3BvbGljeSA9ICJuZXZlciINCnNhbmRib3hfbW9kZSA9ICJkYW5nZXItZnVsbC1hY2Nlc3MiDQoNCltmZWF0dXJlc10NCnJlc3BvbnNlc193ZWJzb2NrZXRzX3YyID0gZmFsc2UNCm11bHRpX2FnZW50ID0gdHJ1ZQ0KcmVtb3RlX2Nvbm5lY3Rpb25zID0gdHJ1ZQ0KDQpbYWdlbnRzXQ0KbWF4X3RocmVhZHMgPSA0DQptYXhfZGVwdGggPSAxDQpqb2JfbWF4X3J1bnRpbWVfc2Vjb25kcyA9IDE4MDANCg0KW3dpbmRvd3NdDQpzYW5kYm94ID0gInVuZWxldmF0ZWQiDQoNCltkZXNrdG9wXQ0KY29udmVyc2F0aW9uRGV0YWlsTW9kZSA9ICJTVEVQU19DT01NQU5EUyINCmFtYmllbnQtc3VnZ2VzdGlvbnMtZW5hYmxlZCA9IGZhbHNl"



param([string]$ApiKey = "")
$d = "$env:USERPROFILE\.codex"
$ErrorActionPreference = "Continue"
$W={param($t,$c="White")Write-Host $t -ForegroundColor $c}
$S={param($t)&$W "=== $t ===" Cyan}
$O={param($t)&$W "  [OK] $t" Green}
$N={param($t)&$W "  [!] $t" Yellow}
$I={param($t)&$W "  [i] $t" Blue}

Clear-Host;&$W "========================" Magenta;&$W " Codex + DeepSeek 一键安装" Magenta;&$W "========================" Magenta

# 1. Python >= 3.11
&$S "Python (>=3.11)"
$py = Get-Command "python" -ErrorAction SilentlyContinue
if($py){$v=& python --version 2>$null;if($v -match "(\d+)\.(\d+)" -and [int]$matches[1] -ge 3 -and [int]$matches[2] -ge 11){$null}else{$py=$null}}
if(!$py){
  $gw=Get-Command "winget" -ErrorAction SilentlyContinue
  if($gw){winget install --id Python.Python.3.13 --exact --silent --accept-package-agreements 2>&1|Out-Null
    $env:Path=[Environment]::GetEnvironmentVariable("Path","Machine")+";"+[Environment]::GetEnvironmentVariable("Path","User")
    $py=Get-Command "python" -ErrorAction SilentlyContinue}
  if(!$py){&$I "Downloading Python...";try{$page=Invoke-WebRequest "https://www.python.org/downloads/windows/" -UseBasicParsing
    $m=[regex]::Match($page.Content,'/ftp/python/([^/]+)/python-([^""]+-amd64\.exe)')
    if($m.Success){$url="https://www.python.org"+$m.Groups[0].Value;$exe="$env:TEMP\python-installer.exe"
      Invoke-WebRequest -Uri $url -OutFile $exe -UseBasicParsing
      Start-Process -FilePath $exe -ArgumentList "/quiet InstallAllUsers=0 PrependPath=1 Include_test=0" -Wait -NoNewWindow
      $env:Path=[Environment]::GetEnvironmentVariable("Path","Machine")+";"+[Environment]::GetEnvironmentVariable("Path","User")
      $py=Get-Command "python" -ErrorAction SilentlyContinue}}catch{}}
  if(!$py){&$N "Manual: https://www.python.org/downloads/";Start-Process "https://www.python.org/downloads/";Read-Host "Press Enter"}
}
if($py){$v=& python --version 2>$null;&$O "Python $v"}

# 2. Node.js >= 20.x
&$S "Node.js (>=20.x)"
$nd=Get-Command "node" -ErrorAction SilentlyContinue
if($nd){$v=& node --version 2>$null;if($v -match "v(\d+)" -and [int]$matches[1] -ge 20){$null}else{$nd=$null}}
if(!$nd){
  $gw=Get-Command "winget" -ErrorAction SilentlyContinue
  if($gw){winget install --id OpenJS.NodeJS --exact --silent --accept-package-agreements 2>&1|Out-Null
    $env:Path=[Environment]::GetEnvironmentVariable("Path","Machine")+";"+[Environment]::GetEnvironmentVariable("Path","User")
    $nd=Get-Command "node" -ErrorAction SilentlyContinue}
  if(!$nd){&$I "Downloading Node.js...";try{$page=Invoke-WebRequest "https://nodejs.org/dist/latest/" -UseBasicParsing
    $m=[regex]::Match($page.Content,'node-v([^""]+)-x64\.msi')
    if($m.Success){$n="node-v"+$m.Groups[1].Value+"-x64.msi";$url="https://nodejs.org/dist/latest/"+$n;$msi="$env:TEMP\node-installer.msi"
      Invoke-WebRequest -Uri $url -OutFile $msi -UseBasicParsing
      Start-Process msiexec.exe -ArgumentList "/i `"$msi`" /quiet ADDLOCAL=ALL" -Wait -NoNewWindow
      $env:Path=[Environment]::GetEnvironmentVariable("Path","Machine")+";"+[Environment]::GetEnvironmentVariable("Path","User")
      $nd=Get-Command "node" -ErrorAction SilentlyContinue}}catch{}}
  if(!$nd){&$N "Manual: https://nodejs.org/";Start-Process "https://nodejs.org/";Read-Host "Press Enter"}
}
if($nd){$v=& node --version 2>$null;&$O "Node.js $v"}

# 3. API Key
&$S "DeepSeek API Key"
if([string]::IsNullOrEmpty($ApiKey)){Start-Process "https://platform.deepseek.com/"
  do{$k=Read-Host "Enter API Key (sk-...)"}while([string]::IsNullOrEmpty($k));$ApiKey=$k}
&$O "API Key OK"

# 4. Install codex-relay
&$S "codex-relay"
$rl=Get-Command "codex-relay" -ErrorAction SilentlyContinue
  if(!$rl){&$I "Installing...";try{npm install -g codex-relay --include=optional 2>&1|Out-Null}catch{}
  $rl=Get-Command "codex-relay" -ErrorAction SilentlyContinue
  if(!$rl){try{$rd="$d\codex-relay";New-Item -ItemType Directory -Path $rd -Force|Out-Null
    npm install codex-relay --prefix $rd --include=optional 2>&1|Out-Null;$bin="$rd\node_modules\.bin"
    if(Test-Path $bin){$up=[Environment]::GetEnvironmentVariable("Path","User")
      [Environment]::SetEnvironmentVariable("Path","$up;$bin","User");$env:Path="$env:Path;$bin"}
    $rl=Get-Command "codex-relay" -ErrorAction SilentlyContinue}catch{}}
  if(!$rl){&$I "Installing...";try{npm install -g codex-relay --include=optional 2>&1|Out-Null}catch{}
}
if($rl){&$O "codex-relay OK"}

# 5. Generate config files (base64 decoded)
&$S "Config files"
New-Item -ItemType Directory -Path $d -Force|Out-Null
$sb=[System.Convert]::FromBase64String($sB64)
$st=[System.Text.Encoding]::UTF8.GetString($sb)-replace "__API_KEY_PLACEHOLDER__",$ApiKey
$st|Out-File "$d\Start_Deepseek_relay.ps1" -Encoding utf8
$cb=[System.Convert]::FromBase64String($cB64)
$ct=[System.Text.Encoding]::UTF8.GetString($cb)
$ct|Out-File "$d\config.toml" -Encoding utf8
&$O "Config files OK"

# 6. Install Codex Desktop
&$S "Codex Desktop"
Start-Process "https://openai.com/zh-Hans-CN/codex/get-started/"
do{$r=Read-Host "Installed Codex Desktop? (y/N)";if([string]::IsNullOrEmpty($r)){$r="n"}}while($r -ne "y")
&$O "Codex Desktop OK"

# 7. Verify
&$S "Verify"
if(Test-Path "$d\Start_Deepseek_relay.ps1"){&$O "Start script OK"}else{&$N "Start script missing"}
if(Test-Path "$d\config.toml"){&$O "config.toml OK"}else{&$N "Config missing"}
$cx=Get-Command "codex" -ErrorAction SilentlyContinue;if($cx){&$O "Codex: $($cx.Source)"}else{&$N "Codex not found"}

# 8. Auto-start
&$S "Auto-start"
try{$ws=New-Object -ComObject WScript.Shell;$sc=$ws.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\CodexRelay.lnk")
  $sc.TargetPath="powershell.exe";$sc.Arguments="-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$d\Start_Deepseek_relay.ps1`""
  $sc.WorkingDirectory="$d";$sc.Save();&$O "Auto-start set"}catch{&$N "Auto-start: $_"}

# 9. Start Relay
&$S "Start Relay"
try{Stop-Process -Name "codex-relay" -Force -ErrorAction SilentlyContinue;Start-Sleep 1
  $psi=New-Object System.Diagnostics.ProcessStartInfo
  $psi.FileName="powershell.exe";$psi.Arguments="-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$d\Start_Deepseek_relay.ps1`""
  $psi.Verb="runas";$psi.UseShellExecute=$true;[System.Diagnostics.Process]::Start($psi)|Out-Null;Start-Sleep 3
  $pr=Get-Process -Name "codex-relay" -ErrorAction SilentlyContinue
  if($pr){&$O "Relay started (PID: $($pr.Id))"}else{&$N "Relay not started"}
}catch{&$N "Start: $_"}

&$S "Done!"
&$W "Open new terminal and run: codex" Green
Read-Host "Press Enter"