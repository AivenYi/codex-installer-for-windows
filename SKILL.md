---
name: codex-installer
description: 全自动安装配置 Codex CLI + DeepSeek 一键脚本。自动检测安装 Python(≥3.11)、Node.js(≥20.x)、codex-relay，引导安装 Codex 桌面程序，生成已验证的配置文件。适用于新用户从零开始配置 Codex。
---

# Codex 全自动安装 Skill

## 一键命令

```powershell
powershell -ExecutionPolicy Bypass -File "$skillDir\scripts\auto-install.ps1"
```

## 自动流程（9步）

① Python 环境（≥3.11）→ ② Node.js 环境（≥20.x）→ ③ 获取 DeepSeek API Key → ④ 安装 codex-relay → ⑤ 生成 Start_Deepseek_relay.ps1 + config.toml → ⑥ 引导安装 Codex 桌面程序 → ⑦ 验证配置 → ⑧ 开机自启 → ⑨ 启动 Relay

## 已知问题与应对

| 问题 | 说明 | 应对 |
|------|------|------|
| npm 不自动安装平台包 | `@openai/codex` 的 `optionalDependencies` 在全局安装时可能被跳过 | 脚本已加 `--include=optional` 参数 |
| 502 Bad Gateway | Codex 桌面向 Relay 发请求时返回 502 | 启动脚本中已加调试提示，config.toml 加 `strip_unsupported_params=true` |
| auth_mode 不支持 none | Codex CLI 枚举不含 none 选项 | 使用 `approval_policy = "never"` + Relay 处理认证 |

## 脱敏分享

```powershell
powershell -ExecutionPolicy Bypass -File "$skillDir\scripts\desensitize-files.ps1"
```

## 故障排除速查

| 症状 | 操作 |
|------|------|
| `Missing optional dependency @openai/codex-win32-x64` | 手动安装：`npm install -g @openai/codex --include=optional` |
| 连接 Relay 返回 502 | 编辑 `Start_Deepseek_relay.ps1`，取消 `$env:CODX_RELAY_LOG_LEVEL = "debug"` 注释，查看日志 |
| codex-relay 找不到 | 重启终端 或 `npm install -g codex-relay` |
| Relay 启动闪退 | **以管理员身份**运行 PowerShell |
| 401 Unauthorized | API Key 无效，去 https://platform.deepseek.com/ 重新生成 |
