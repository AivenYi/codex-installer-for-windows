[![Author](https://img.shields.io/badge/Author-Aiven_Yi-blue?style=flat-square)](https://aizhuxuan.feishu.cn/wiki/Q9bAwhUZriPddJkX0JTcCTrVn7g?from=from_copylink)
[![Multiplatform](https://img.shields.io/badge/Multiplatform-Windows-blue?style=flat-square)](https://github.com/AivenYi/codex-installer-for-windows)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/AivenYi/codex-installer-for-windows/main?style=flat-square)](https://github.com/AivenYi/codex-installer-for-windows/commits/main)
[![WaytoAGI](https://img.shields.io/badge/WaytoAGI%E6%B1%9F%E8%A5%BF%E7%BB%84%E7%BB%87%E8%80%85-blue?style=flat-square)](https://www.waytoagi.com/zh)
[![Email](https://img.shields.io/badge/Email-aivenyi5241%40gmail.com-blue?style=flat-square)](mailto:aivenyi5241@gmail.com)

[English](./README_EN.md) | [日本語](./README_JP.md) | 中文

---

# Codex + DeepSeek 全自动安装工具 🚀

> **一行命令，从零到使用。**  
> 自动检测环境、安装依赖、生成配置文件、启动服务，全程引导，无需手动操作。


---

## 📋 目录

- [功能概述](#功能概述)
- [快速开始](#快速开始)
- [全自动流程详解](#全自动流程详解)
- [手动配置方案](#手动配置方案)
- [脱敏分享配置](#脱敏分享配置)
- [故障排除指南](#故障排除指南)
- [文件说明](#文件说明)
- [常见问题](#常见问题)

---

## 功能概述

本工具用于在 **Windows 系统** 上从零安装配置 **Codex CLI** + **DeepSeek API**，实现 AI 编程助手的本地运行。

### 核心特性

| 特性 | 说明 |
|------|------|
| 🎯 **一键自动化** | 运行一条命令，全程自动完成 |
| 🔍 **智能环境检测** | Python ≥3.11 / Node.js ≥20.x 检测，自动安装/升级 |
| 📄 **配置文件直接写入** | 使用经过验证的完整模板，非 AI 动态生成 |
| 🔄 **Relay 代理** | 自动安装配置 codex-relay 中转代理 |
| 🚀 **开机自启** | 自动设置 Relay 开机启动 |
| 🛡️ **管理员提权** | 自动以管理员权限启动 Relay |
| 🔒 **脱敏分享** | 一键生成脱敏版配置，安全分享给朋友 |

---

## 快速开始

### 系统要求

- **操作系统**：Windows 10 / Windows 11（64位）
- **网络**：需要能够访问 GitHub、python.org、nodejs.org

### 安装步骤

#### 一步到位（推荐）

在 **PowerShell** 中运行以下命令：

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\Administrator\.codex\skills\codex-installer\scripts\auto-install.ps1"
```

> ⚠️ **注意**：该脚本路径需要根据实际安装位置调整。
> 如果你是通过 Codex 的 `codex-installer` 技能调用的，Codex 会自动找到脚本路径。

#### 你需要准备什么

1. ✅ 一台能联网的 Windows 电脑
2. ✅ 一个 **DeepSeek API Key**（注册获取方式见下文）
3. ✅ 大约 **10-15 分钟** 的安装时间（取决于网络速度）

### 注册 DeepSeek 获取 API Key

1. 打开 https://platform.deepseek.com/
2. 点击「注册」，使用邮箱注册账号
3. 登录后进入 **API Keys** 页面
4. 点击「创建 API Key」，复制得到的 `sk-...` 字符串

> 💡 **提示**：DeepSeek 新注册用户赠送 500 万 tokens，足够日常使用。

---

## 全自动流程详解

脚本运行后会依次执行以下 **9 个步骤**，你只需在提示时输入 API Key 和确认安装即可。

### 流程总览


flowchart TD
    A([🚀 Codex 全自动安装工具启动]) --> B
    B["① 检查 Python 环境<br>• 已安装 ≥3.11 → ✅ 跳过<br>• 已安装 <3.11 → ⬇️ 自动升级最新版<br>• 未安装 → ⬇️ 自动下载安装最新版"] --> C
    C["② 检查 Node.js 环境<br>• 已安装 ≥20.x → ✅ 跳过<br>• 已安装 <20.x → ⬇️ 自动升级最新版<br>• 未安装 → ⬇️ 自动下载安装最新版"] --> D
    D["③ 配置 DeepSeek API Key 🔑<br>（需要你输入）<br>• 打开 DeepSeek 官网注册页面<br>• 输入你的 sk-... API Key"] --> E
    E["④ 生成配置文件<br>• Start_Deepseek_relay.ps1  ← 启动脚本<br>• config.toml  ← 配置文件"] --> F
    F["⑤ 安装 codex-relay 中转代理<br>• npm 全局安装 → 成功 ✅<br>• 失败 → 本地安装备选方案"] --> G
    G["⑥ 安装 Codex 桌面程序 🖥️<br>（需要你手动操作）<br>• 自动打开官网下载页<br>• 下载 Windows 版本安装包<br>• 双击安装，完成后输入 y 确认 ✅"] --> H
    H["⑦ 验证配置<br>• Python ✓  Node.js ✓  Codex ✓  Relay ✓<br>• 配置文件完整 ✓"] --> I
    I["⑧ 设置开机自启<br>• Startup 快捷方式已创建 ✅"] --> J
    J["⑨ 启动 Relay 代理<br>• 以管理员权限启动 ✅<br>• 打开 Codex 官方页面"] --> K
    K(["🎉 安装完成！<br>打开 PowerShell 运行: codex"])


### 详细步骤说明

#### 步骤 ①：检查 Python 环境

自动检测系统中是否已安装 Python：
- **≥ 3.11** → 直接使用，跳过安装
- **< 3.11** 或 **未安装** → 自动下载最新版 Python 并静默安装

安装优先级：
1. `winget` 安装（最快）
2. 从 python.org 下载安装包静默安装
3. 打开官网引导手动安装

#### 步骤 ②：检查 Node.js 环境

自动检测系统中是否已安装 Node.js：
- **≥ 20.x** → 直接使用，跳过安装
- **< 20.x** 或 **未安装** → 自动下载最新版 Node.js 并静默安装

> Node.js 用于运行 `codex-relay` 中转代理。

#### 步骤 ③：获取 API Key

脚本会打开 DeepSeek 官网注册页面，你需要：
1. 注册/登录 DeepSeek 账号
2. 进入 API Keys 创建新 Key
3. 复制 `sk-...` 开头的密钥
4. 粘贴到 PowerShell 窗口中

#### 步骤 ④：生成配置文件

**这是最关键的一步。**  
脚本会直接写入你**经过验证的完整配置内容**，不做任何 AI 动态生成，确保万无一失。

生成的文件位于 `%USERPROFILE%\.codex\` 目录下：

| 文件 | 用途 |
|------|------|
| `Start_Deepseek_relay.ps1` | 启动 Relay 代理的脚本 |
| `config.toml` | Codex CLI 的配置文件 |

> 启动脚本中的 API Key 占位符会自动替换为你输入的真实 Key。

#### 步骤 ⑤：安装 codex-relay

`codex-relay` 是一个中转代理，负责将 Codex 的请求转发到 DeepSeek API。

安装方式：
1. npm 全局安装（优先）
2. 本地安装（备选）

#### 步骤 ⑥：安装 Codex 桌面程序

脚本会自动打开 Codex 官方下载页面：
> https://openai.com/zh-Hans-CN/codex/get-started/

你需要：
1. 点击「下载 Windows 版本」
2. 运行下载的安装程序
3. 按照安装向导完成安装
4. 回到 PowerShell，输入 `y` 确认安装完成

#### ��骤 ���：验证配置

脚本会检查以下项目：
- ✅ `Start_Deepseek_relay.ps1` 启动脚本是否存在
- ✅ `config.toml` 配置文件是否存在
- ✅ Python 版本是否正确
- ✅ Node.js 版本是否正确
- ✅ Codex 命令是否可用
- ✅ codex-relay 命令是否可用

#### 步骤 ⑧：设置开机自启

创建 Windows 开机启动快捷方式，确保每次开机时 Relay 自动运行。

快捷方式位置：
```
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\CodexRelay.lnk
```

#### 步骤 ⑨：启动 Relay

以 **管理员权限** 启动 codex-relay 代理服务。  
启动成功后，Relay 会在后台运行，监听 `4446` 端口。

---

## 手动配置方案

如果自动安装过程中出现问题，或你想手动配置，可以按照以下步骤操作。

### 1. 手动安装 Python

1. 打开 https://www.python.org/downloads/
2. 下载最新版 Python 安装包
3. 运行安装程序，**务必勾选**「Add Python to PATH」
4. 验证安装：`python --version`

### 2. 手动安装 Node.js

1. 打开 https://nodejs.org/
2. 下载 LTS 版本
3. 运行安装程序，使用默认选项
4. 验证安装：`node --version`

### 3. 手动安装 Codex 桌面程序

1. 打开 https://openai.com/zh-Hans-CN/codex/get-started/
2. ��击下载 Windows 版本
3. 运行安装程序
4. 验证安装：`codex --version`

### 4. 手动安装 codex-relay

```powershell
npm install -g codex-relay
```

验证安装：
```powershell
codex-relay --version
```

### 5. 手动创建配置文件

#### 创建目录

```powershell
New-Item -ItemType Directory -Path "$env:USERPROFILE\.codex" -Force
```

#### 创建 Start_Deepseek_relay.ps1

将以下内容保存到 `%USERPROFILE%\.codex\Start_Deepseek_relay.ps1`：

```powershell
Remove-Item Env:OPENAI_API_KEY -ErrorAction SilentlyContinue
Remove-Item Env:CODX_RELAY_UPSTREAM -ErrorAction SilentlyContinue
Remove-Item Env:CODX_RELAY_API_KEY -ErrorAction SilentlyContinue

Stop-Process -Name "codex-relay" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1

# 不使用环境变量，直接通过参数启动
$apiKey = "sk-xxxx...xxxx"   # 替换为你的真实 API Key
$upstream = "https://api.deepseek.com/v1"
$port = "4446"

Write-Host "✅ 启动参数确认: Upstream = $upstream, Port = $port"

# 关键：用 --upstream 和 --port 参数启动
codex-relay --upstream $upstream --port $port --api-key $apiKey
```

> ⚠️ **请将 `$apiKey` 的值替换为你的真实 DeepSeek API Key。**

#### 创建 config.toml

将以下内容保存到 `%USERPROFILE%\.codex\config.toml`：

```toml
# =========================================================
# 全局默认配置（强制指向 DeepSeek Relay）
# =========================================================
model = "deepseek-chat"
model_provider = "deepseek_relay"
approval_policy = "never"
sandbox_mode = "danger-full-access"
suppress_unstable_features_warning = true

# =========================================================
# 模型提供商定义（DeepSeek via Relay）
# =========================================================
[model_providers.deepseek_relay]
name = "DeepSeek via Relay"
# 指向本地运行的 codex-relay
base_url = "http://127.0.0.1:4446/v1"
# 关键：Relay 对外伪装成 Responses，对内转成 Chat
wire_api = "responses"
# 关键：Relay 负责鉴权，Codex 不要插手
requires_openai_auth = false
# 关键：DeepSeek 不支持 WebSocket，必须关闭
supports_websockets = false
# 关键：彻底关闭重试，防止"回复 N 次"
request_max_retries = 0
stream_max_retries = 0
# 拉长超时，给 DeepSeek 思考时间
stream_idle_timeout_ms = 300000

# =========================================================
# Profile 配置（可选）
# =========================================================
[profiles.deepseek_chat]
model = "deepseek-chat"
model_provider = "deepseek_relay"
approval_policy = "never"
sandbox_mode = "danger-full-access"

# =========================================================
# 功能与 Agent 设置
# =========================================================
[features]
# 必须关闭，DeepSeek 不支持
responses_websockets_v2 = false
multi_agent = true
remote_connections = true

[agents]
max_threads = 4
max_depth = 1
job_max_runtime_seconds = 1800

[windows]
sandbox = "unelevated"

[desktop]
conversationDetailMode = "STEPS_COMMANDS"
ambient-suggestions-enabled = false

[marketplaces.openai-primary-runtime]
last_updated = "2026-05-28T03:45:18Z"
source_type = "local"
source = '\\?\C:\Users\Administrator\.cache\codex-runtimes\codex-primary-runtime\plugins\openai-primary-runtime'

[plugins."documents@openai-primary-runtime"]
enabled = true

[plugins."spreadsheets@openai-primary-runtime"]
enabled = true

[plugins."presentations@openai-primary-runtime"]
enabled = true

[projects.'d:\users\documents\new project']
trust_level = "trusted"
```

### 6. ��动��动 Relay

以 **管理员身份** 运行 PowerShell，然后执行：

```powershell
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.codex\Start_Deepseek_relay.ps1"
```

### 7. 启动 Codex

保持 Relay 窗口运行，打开**新的 PowerShell** 窗口：

```powershell
codex
```

### 8. 设置开机自启（手动）

1. 按 `Win + R`，输入 `shell:startup`，回车
2. 右键 → 新建快捷方式
3. 位置：
   ```
   powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "%USERPROFILE%\.codex\Start_Deepseek_relay.ps1"
   ```
4. 名称：`CodexRelay`

---

## 脱敏分享配置

配置完成后，如果你想将配置分享给朋友（不暴露你的 API Key）：

### 使用脚本

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\Administrator\.codex\skills\codex-installer\scripts\desensitize-files.ps1"
```

会在 `%USERPROFILE%\.codex\share-to-friend\` 目录下生成脱敏版本。

### 手动脱敏

手动复制以下两个文件，替换掉 API Key：

**Start_Deepseek_relay.ps1** 中将：
```powershell
$apiKey = "sk-xxxx...xxxx"
```
替换为：
```powershell
$apiKey = "sk-xxxx...xxxx（替换为你的 Key）"
```

**config.toml** 不需要修改（不包含 API Key）。

---

## 故障排除指南

### 通用问题

| 问题 | 原因 | 解决方案 |
|------|------|---------|
| `无法加载文件，因为在此系统上禁止执行脚本` | PowerShell 执行策略限制 | 使用 `-ExecutionPolicy Bypass` 参数运行 |
| `python 不是内部或外部命令` | Python 未添加到 PATH | 重启 PowerShell，或手动添加 PATH |
| `node 不是内部或外部命令` | Node.js 未添加到 PATH | 重启 PowerShell，或手动添加 PATH |

### Python 相关问题

| 问题 | 解决方案 |
|------|---------|
| winget 安装 Python 失败 | 脚本会自动从官网下载安装 |
| Python 下载缓慢 | 手动访问 https://www.python.org/downloads/ 下载 |
| 安装后 python 命令不可用 | 重启 PowerShell确保安装时勾选了 Add to PATH |

### Node.js 相关问题

| 问题 | 解决方案 |
|------|---------|
| winget 安装 Node.js 失败 | 脚本会自动从官网下载安装 |
| Node.js 下载缓慢 | 手动访问 https://nodejs.org/ 下载 |
| 安装后 node 命令不可用 | 重启 PowerShell |

### codex-relay 问题

| 问题 | 原因 | 解决方案 |
|------|------|---------|
| `codex-relay 不是内部或外部命令` | 未安装或 PATH 未更新 | 重启终端，或运行 `npm install -g codex-relay` |
| npm 安装失败 | 网络问题 | 检查网络，或使用代理 |
| Relay 启动后闪退 | 权限不足 | **以管理员身份**运行 PowerShell |
| Relay 端口被占用 | 4446 端口已被使用 | 修改启动脚本中的 `-port` 参数 |

### Codex 问题

| 问题 | 原因 | 解决方案 |
|------|------|---------|
| `codex 不是内部或外部命令` | 未安装或 PATH 未更新 | 确认已安装 Codex 桌面程序，重启终端 |
| Codex 启动后 `Connection refused` | Relay 未运行 | 先启动 Relay，再启动 Codex |
| Codex 报 `401 Unauthorized` | API Key 无效 | 检查 DeepSeek 官网的 API Key 是否有效 |
| Codex 报 `Rate limit exceeded` | API 额度用尽 | 到 DeepSeek 后台充值 |
| Codex 响应缓慢 | 模型思考时间长 | config.toml 中已设置 `stream_idle_timeout_ms = 300000`（5分钟） |

### 配置文件问题

| 问题 | 解决方案 |
|------|---------|
| config.toml 格式错误 | 检查是否有多余空格，使用等号 `=` 对齐 |
| 端口不匹配 | 确保 `config.toml` 中的 `base_url` 端口和启动脚本的 `--port` 一致（默认 4446） |
| 代理配置错误 | 确保 `base_url` 指向 `http://127.0.0.1:4446/v1` |

---

## 文件说明

### Skill 目录结构

```
codex-installer/
��
├── SKILL.md                    ← Codex 技能引导文档
├── README.md                   ← 文档（中文）
├── README_EN.md                ← 文档（英语）
├── README_JP.md                ← 文档（日语）
├── agents/
│   └── openai.yaml            ← UI 元数据（技能列表显示）
├── assets/                    ← 预留资源目录
└── scripts/
    ├── auto-install.ps1        ← 🚀 全自动安装脚本（核心）
    └── desensitize-files.ps1   ← 脱敏分享脚本
```

### 核心文件说明

#### auto-install.ps1（全自动安装脚本）

**大小**：约 16 KB  
**功能**：全自动完成 Python/Node.js 环境检测安装、API 配置、配置文件生成、Codex 桌面程序引导、Relay 安装启动、开机自启设置。

**内部函数说明**：

| 函数 | 功能 |
|------|------|
| `Install-Python` | 检测并安装 Python（≥3.11） |
| `Install-NodeJS` | 检测并安装 Node.js（≥20.x） |
| `Get-ApiKeyInput` | 交互式获取 DeepSeek API Key |
| `Generate-ConfigFiles` | 生成 Start_Deepseek_relay.ps1 + config.toml |
| `Install-Relay` | 安装 codex-relay 代理 |
| `Install-CodexDesktop` | 引导安装 Codex 桌面程序 |
| `Verify-Config` | 验证所有配置 |
| `Set-AutoStart` | 设置开机自启 |
| `Start-RelayService` | 启动 Relay 服务 |

#### desensitize-files.ps1（脱敏分享脚本）

**功能**：将 `%USERPROFILE%\.codex\` 中的配置脱敏后复制到 `share-to-friend\` 目录。

### 生成的目标文件

```
%USERPROFILE%\.codex/
│
├── Start_Deepseek_relay.ps1   ← 🚀 启动 Relay 的脚本
├── config.toml                ← ⚙️  Codex CLI 配置文件
│
└── share-to-friend/           ← 📤 脱敏分享目录
    ├── Start_Deepseek_relay_desensitized.ps1
    ├── config.toml
    └── README.txt
```

---

## 常见问题

### Q1：安装过程中断网了怎么办？

脚本会在当前步骤失败后引导你手动操作。重新运行脚本会跳过已完成的步骤。

### Q2：我可以在多台电脑上使用同一个 API Key 吗？

**可以**。DeepSeek API Key 是账号级别的，可以在多台设备上使用。  
但请注意保护你的 API Key 安全，不要公开分享。

### Q3：如何更新 Codex 到最新版本？

重新运行 `auto-install.ps1` 脚本，或从官网下载最新版覆盖安装。

### Q4：如何切换其他模型？

目前脚本只支持 DeepSeek。如需使用其他模型（如 OpenAI、Claude），需要手动修改 `config.toml` 文件。

### Q5：这个工具是否支持 Linux/Mac？

**不支持**。本工具专门为 Windows 系统设计，使用了 PowerShell 和 Windows 特有的功能（如 COM 对象创建快捷方式、winget 包管理器等）。

### Q6：每次使用 Codex 都需要先启动 Relay 吗？

**是的**。Relay 是 Codex 和 DeepSeek API 之间的桥梁，必须先启动 Relay，才能使用 Codex。  
设置为开机自启后，每次开机 Relay 会自动运行，你就不需要手动启动了。

### Q7：如何查看 Relay 是否在运行？

```powershell
Get-Process -Name "codex-relay" -ErrorAction SilentlyContinue
```
如果显示了进程信息，说明 Relay 正在运行。

### Q8：如何停止 Relay？

```powershell
Stop-Process -Name "codex-relay" -Force
```

---

## 许可证

本项目仅供学习和个人使用。请遵守 DeepSeek、OpenAI 和 Codex 的相关使用条款。

---

## 更新日志

### v1.0（2026-05-28）

- 🎉 首次发布
- 全自动安装 Python / Node.js / Codex / codex-relay
- 支持环境版本检测（≥3.11 / ≥20.x）
- 使用已验证的完整配置模板
- 引导安装 Codex 桌面程序
- 开机自启设置
- 管理员权限自动提权
- 脱敏分享功能

---

> 💡 **提示**：如果在使用过程中遇到任何问题，请参考 [故障排除指南](#故障排除指南)。  
> 如果问题仍未解决，可以重新运行 `auto-install.ps1` 脚本重新配置。
