# Codex + DeepSeek Automatic Installation Tool 🚀

> **One command, from zero to usage.**  
> Automatically detects environment, installs dependencies, generates config files, starts services — fully guided, no manual steps required.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Automated Workflow](#automated-workflow)
- [Manual Setup](#manual-setup)
- [Share Configuration (Desensitized)](#share-configuration-desensitized)
- [Troubleshooting](#troubleshooting)
- [File Reference](#file-reference)
- [FAQ](#faq)

---

## Overview

This tool installs and configures **Codex CLI** + **DeepSeek API** on **Windows** from scratch, enabling AI-assisted programming on your local machine.

### Key Features

| Feature | Description |
|---------|-------------|
| 🎯 **One-click automation** | Run one command, everything completes automatically |
| 🔍 **Smart environment detection** | Detects Python ≥3.11 / Node.js ≥20.x, auto installs/upgrades |
| 📄 **Verified config templates** | Uses battle-tested template files, not AI-generated |
| 🔄 **Relay proxy** | Auto installs and configures codex-relay |
| 🚀 **Auto-start on boot** | Sets up relay to launch at system startup |
| 🛡️ **Admin elevation** | Automatically starts relay with administrator privileges |
| 🔒 **Desensitized sharing** | One-click generation of anonymized configs for sharing |

---

## Quick Start

### System Requirements

- **OS**: Windows 10 / Windows 11 (64-bit)
- **Network**: Access to GitHub, python.org, nodejs.org required

### One-Click Installation

Run the following command in **PowerShell**:

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\Administrator\.codex\skills\codex-installer\scripts\auto-install.ps1"
```

> ⚠️ **Note**: Adjust the script path to match your actual installation location.

### What You Need

1. ✅ A Windows PC with internet access
2. ✅ A **DeepSeek API Key** (see registration steps below)
3. ✅ About **10-15 minutes** (depends on network speed)

### How to Get a DeepSeek API Key

1. Open https://platform.deepseek.com/
2. Click "Sign Up" and register with your email
3. Log in, go to **API Keys**
4. Click "Create API Key", copy the `sk-...` string

> 💡 **Tip**: New DeepSeek users get 5 million free tokens — enough for daily use.

---

## Automated Workflow

The script executes **9 steps** sequentially. You only need to provide your API Key and confirm desktop app installation.

### Flow Chart

```
┌─────────────────────────────────────────────────┐
│        Codex Automatic Installation Tool         │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ① Check Python                                 │
│     ├── ≥3.11 installed → ✅ Skip                │
│     ├── <3.11 installed → ⬇️ Auto upgrade        │
│     └── Not installed → ⬇️ Auto install          │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ② Check Node.js                                │
│     ├── ≥20.x installed → ✅ Skip               │
│     ├── <20.x installed → ⬇️ Auto upgrade       │
│     └── Not installed → ⬇️ Auto install          │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ③ Configure DeepSeek API Key  ← You input     │
│     ├── Opens DeepSeek registration page        │
│     └── Enter your sk-... API Key               │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ④ Generate Config Files                        │
│     ├── Start_Deepseek_relay.ps1  ← Launch      │
│     └── config.toml              ← Config       │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ⑤ Install codex-relay                          │
│     ├── npm global install → ✅ Success         │
│     └── Failed → Local fallback                 │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ⑥ Install Codex Desktop  ← Manual step        │
│     ├── Opens official download page            │
│     ├── Download Windows installer              │
│     └── Install, then type y to confirm ✅      │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ⑦ Verify Configuration                        │
│     ├── Python ✓  Node.js ✓  Codex ✓  Relay ✓  │
│     └── Config files ✓                          │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ⑧ Set Auto-start                              │
│     └── Startup shortcut created ✅             │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│  ⑨ Start Relay                                 │
│     ├── Launched as admin ✅                    │
│     └── Opens Codex official page               │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│              🎉 Installation Complete!          │
│         Open PowerShell and run: codex           │
└─────────────────────────────────────────────────┘
```

### Step Details

#### Step ①: Check Python

Auto-detects Python installation:
- **≥ 3.11** → Use existing, skip installation
- **< 3.11** or **not installed** → Auto download & install latest

Installation priority:
1. `winget` (fastest)
2. Download from python.org, silent install
3. Open website for manual installation

#### Step ②: Check Node.js

- **≥ 20.x** → Skip
- **< 20.x** or **not installed** → Auto download & install latest

#### Step ③: Get API Key

The script opens DeepSeek's registration page. You need to:
1. Register/log in to DeepSeek
2. Go to API Keys, create a new key
3. Copy the `sk-...` string
4. Paste it into the PowerShell prompt

#### Step ④: Generate Config Files

**This is the most critical step.**  
The script writes **verified, complete configuration files** directly — no AI generation, ensuring reliability.

Files are created in `%USERPROFILE%\.codex\`:

| File | Purpose |
|------|---------|
| `Start_Deepseek_relay.ps1` | Script to launch the relay proxy |
| `config.toml` | Codex CLI configuration |

> The API Key placeholder in the startup script is automatically replaced with your real key.

#### Step ⑤: Install codex-relay

`codex-relay` is a proxy that forwards Codex requests to the DeepSeek API.

Installation methods:
1. npm global install (preferred)
2. Local install (fallback)

#### Step ⑥: Install Codex Desktop

The script opens the official Codex download page:
> https://openai.com/en-US/codex/get-started/

You need to:
1. Click "Download for Windows"
2. Run the installer
3. Follow the setup wizard
4. Return to PowerShell, type `y` to confirm

#### Step ⑦: Verify Configuration

The script checks:
- ✅ `Start_Deepseek_relay.ps1` exists
- ✅ `config.toml` exists
- ✅ Python version
- ✅ Node.js version
- ✅ Codex command available
- ✅ codex-relay command available

#### Step ⑧: Set Auto-start

Creates a Windows startup shortcut to launch Relay automatically on boot.

Shortcut location:
```
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\CodexRelay.lnk
```

#### Step ⑨: Start Relay

Launches codex-relay with **administrator privileges**.  
Once started, Relay runs in the background on port `4446`.

---

## Manual Setup

If the automated script fails or you prefer manual setup, follow these steps.

### 1. Install Python

1. Open https://www.python.org/downloads/
2. Download the latest Python installer
3. Run the installer, **check** "Add Python to PATH"
4. Verify: `python --version`

### 2. Install Node.js

1. Open https://nodejs.org/
2. Download LTS version
3. Run the installer (default options)
4. Verify: `node --version`

### 3. Install Codex Desktop

1. Open https://openai.com/en-US/codex/get-started/
2. Click download for Windows
3. Run the installer
4. Verify: `codex --version`

### 4. Install codex-relay

```powershell
npm install -g codex-relay
```

Verify:
```powershell
codex-relay --version
```

### 5. Create Config Files

#### Create Directory

```powershell
New-Item -ItemType Directory -Path "$env:USERPROFILE\.codex" -Force
```

#### Create Start_Deepseek_relay.ps1

Save to `%USERPROFILE%\.codex\Start_Deepseek_relay.ps1`:

```powershell
Remove-Item Env:OPENAI_API_KEY -ErrorAction SilentlyContinue
Remove-Item Env:CODX_RELAY_UPSTREAM -ErrorAction SilentlyContinue
Remove-Item Env:CODX_RELAY_API_KEY -ErrorAction SilentlyContinue

Stop-Process -Name "codex-relay" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1

# Use parameters directly (not environment variables)
$apiKey = "sk-xxxx...xxxx"   # Replace with your real DeepSeek API Key
$upstream = "https://api.deepseek.com/v1"
$port = "4446"

Write-Host "✅ Launch config: Upstream = $upstream, Port = $port"

# Launch relay with --upstream and --port parameters
codex-relay --upstream $upstream --port $port --api-key $apiKey
```

> ⚠️ **Replace `$apiKey` value with your real DeepSeek API Key.**

#### Create config.toml

Save to `%USERPROFILE%\.codex\config.toml`:

```toml
# =========================================================
# Global default config (forced to DeepSeek Relay)
# =========================================================
model = "deepseek-chat"
model_provider = "deepseek_relay"
approval_policy = "never"
sandbox_mode = "danger-full-access"
suppress_unstable_features_warning = true

# =========================================================
# Model provider definition (DeepSeek via Relay)
# =========================================================
[model_providers.deepseek_relay]
name = "DeepSeek via Relay"
# Point to local codex-relay
base_url = "http://127.0.0.1:4446/v1"
# Key: Relay pretends to be Responses API, internally uses Chat
wire_api = "responses"
# Key: Relay handles auth, Codex does not need OpenAI auth
requires_openai_auth = false
# Key: DeepSeek does not support WebSocket
supports_websockets = false
# Key: Disable retries to prevent multiple responses
request_max_retries = 0
stream_max_retries = 0
# Extend timeout for DeepSeek thinking time
stream_idle_timeout_ms = 300000

# =========================================================
# Profile config (optional)
# =========================================================
[profiles.deepseek_chat]
model = "deepseek-chat"
model_provider = "deepseek_relay"
approval_policy = "never"
sandbox_mode = "danger-full-access"

# =========================================================
# Features & Agent Settings
# =========================================================
[features]
# Must disable, DeepSeek does not support
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
```

### 6. Start Relay Manually

Run PowerShell **as Administrator**, then execute:

```powershell
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.codex\Start_Deepseek_relay.ps1"
```

### 7. Start Codex

Keep the Relay window running. Open a **new PowerShell** window:

```powershell
codex
```

### 8. Set Auto-start (Manual)

1. Press `Win + R`, type `shell:startup`, press Enter
2. Right-click → New → Shortcut
3. Location:
   ```
   powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "%USERPROFILE%\.codex\Start_Deepseek_relay.ps1"
   ```
4. Name: `CodexRelay`

---

## Share Configuration (Desensitized)

After setup, you can share your config with friends without exposing your API Key:

### Using Script

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\Administrator\.codex\skills\codex-installer\scripts\desensitize-files.ps1"
```

Files will be generated in `%USERPROFILE%\.codex\share-to-friend\`.

### Manual Desensitization

In `Start_Deepseek_relay.ps1`, replace:
```powershell
$apiKey = "sk-xxxx...xxxx"   # Replace with your real DeepSeek API Key
```

`config.toml` does not contain your API Key, so it can be shared as-is.

---

## Troubleshooting

### General Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| `Cannot be loaded because running scripts is disabled` | PowerShell execution policy | Use `-ExecutionPolicy Bypass` flag |
| `python is not recognized` | Python not in PATH | Restart PowerShell, or add PATH manually |
| `node is not recognized` | Node.js not in PATH | Restart PowerShell, or add PATH manually |

### Python Issues

| Problem | Solution |
|---------|----------|
| winget install fails | Script falls back to python.org download |
| Download is slow | Manually download from https://www.python.org/downloads/ |
| `python` command not working after install | Restart PowerShell, ensure "Add to PATH" was checked |

### Node.js Issues

| Problem | Solution |
|---------|----------|
| winget install fails | Script falls back to nodejs.org download |
| Download is slow | Manually download from https://nodejs.org/ |
| `node` command not working after install | Restart PowerShell |

### codex-relay Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| `codex-relay is not recognized` | Not installed or PATH not updated | Restart terminal, or `npm install -g codex-relay` |
| npm install fails | Network issue | Check internet, use proxy if needed |
| Relay closes immediately | Insufficient permissions | Run PowerShell **as Administrator** |
| Port already in use | Port 4446 occupied | Change `-port` parameter in script |

### Codex Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| `codex is not recognized` | Not installed or PATH issue | Ensure Codex Desktop is installed, restart terminal |
| `Connection refused` | Relay not running | Start Relay first, then Codex |
| `401 Unauthorized` | Invalid API Key | Check API Key on DeepSeek platform |
| `Rate limit exceeded` | API quota exhausted | Top up on DeepSeek platform |
| Slow responses | Model thinking time | Timeout is set to 300s in config.toml |

### Config File Issues

| Problem | Solution |
|---------|----------|
| config.toml format error | Check for extra spaces, use `=` alignment |
| Port mismatch | Ensure `base_url` port matches `--port` in startup script (default 4446) |
| Wrong proxy config | Ensure `base_url` points to `http://127.0.0.1:4446/v1` |

---

## File Reference

### Skill Directory Structure

```
codex-installer/
│
├── SKILL.md                    ← Codex skill guide
├── README.md                   ← Documentation (Chinese)
├── README_EN.md                ← Documentation (English)
├── README_JP.md                ← Documentation (Japanese)
├── agents/
│   └── openai.yaml            ← UI metadata
├── assets/                    ← Reserved
└── scripts/
    ├── auto-install.ps1        ← 🚀 Core auto-installation script
    └── desensitize-files.ps1   ← Desensitized sharing script
```

### Core Script Functions (auto-install.ps1)

| Function | Description |
|----------|-------------|
| `Install-Python` | Check and install Python (≥3.11) |
| `Install-NodeJS` | Check and install Node.js (≥20.x) |
| `Get-ApiKeyInput` | Interactive API Key input |
| `Generate-ConfigFiles` | Generate config files from verified templates |
| `Install-Relay` | Install codex-relay proxy |
| `Install-CodexDesktop` | Guide Codex Desktop installation |
| `Verify-Config` | Verify all configurations |
| `Set-AutoStart` | Set auto-start on boot |
| `Start-RelayService` | Start relay service |

### Generated Files

```
%USERPROFILE%\.codex/
│
├── Start_Deepseek_relay.ps1   ← 🚀 Relay startup script
├── config.toml                ← ⚙️  Codex CLI config
│
└── share-to-friend/           ← 📤 Share folder (desensitized)
    ├── Start_Deepseek_relay_desensitized.ps1
    ├── config.toml
    └── README.txt
```

---

## FAQ

### Q1: What if the internet disconnects during installation?

The script will guide you through manual steps at the failed point. Re-running the script will skip completed steps.

### Q2: Can I use the same API Key on multiple computers?

**Yes.** The DeepSeek API Key is account-level and can be used on multiple devices. Keep it secure and do not share it publicly.

### Q3: How do I update Codex to the latest version?

Re-run `auto-install.ps1` or download the latest version from the official website.

### Q4: Can I switch to other AI models?

The script currently supports DeepSeek only. To use other models (e.g., OpenAI, Claude), modify `config.toml` manually.

### Q5: Does this work on Linux/Mac?

**No.** This tool is designed specifically for Windows, using PowerShell and Windows-specific features (COM objects for shortcuts, winget, etc.).

### Q6: Do I need to start Relay every time I use Codex?

**Yes.** Relay is the bridge between Codex and DeepSeek API. With auto-start enabled, Relay launches automatically at boot.

### Q7: How do I check if Relay is running?

```powershell
Get-Process -Name "codex-relay" -ErrorAction SilentlyContinue
```
If a process is shown, Relay is running.

### Q8: How do I stop Relay?

```powershell
Stop-Process -Name "codex-relay" -Force
```

---

## License

This project is for learning and personal use only. Please comply with the terms of DeepSeek, OpenAI, and Codex.

---

## Changelog

### v1.0 (2026-05-28)

- 🎉 Initial release
- Fully automated Python / Node.js / Codex / codex-relay installation
- Environment version detection (≥3.11 / ≥20.x)
- Verified config templates for reliability
- Codex Desktop installation guide
- Auto-start on boot
- Admin privilege auto-elevation
- Desensitized sharing feature

---

> 💡 **Tip**: If you encounter any issues, refer to the [Troubleshooting](#troubleshooting) section.  
> If problems persist, re-run `auto-install.ps1` to reconfigure.
