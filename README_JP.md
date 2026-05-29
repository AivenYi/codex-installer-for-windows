# Codex + DeepSeek 自動インストールツール 🚀

> **1つのコマンドで、ゼロからすぐに使えるように。**  
> 環境の検出、依存関係のインストール、設定ファイルの生成、サービスの起動までを完全自動化。手動操作は最小限です。

---

## 📋 目次

- [概要](#概要)
- [クイックスタート](#クイックスタート)
- [自動化ワークフロー](#自動化ワークフロー)
- [手動セットアップ](#手動セットアップ)
- [設定の共有（匿名化）](#設定の共有匿名化)
- [トラブルシューティング](#トラブルシューティング)
- [ファイルリファレンス](#ファイルリファレンス)
- [よくある質問](#よくある質問)

---

## 概要

このツールは、**Windows** 上で **Codex CLI** + **DeepSeek API** をゼロからインストール・設定し、ローカル環境で AI プログラミングアシスタントを利用できるようにします。

### 主な機能

| 機能 | 説明 |
|------|------|
| 🎯 **ワンクリック自動化** | 1つのコマンドで全てを自動完了 |
| 🔍 **スマート環境検出** | Python ≥3.11 / Node.js ≥20.x を検出し、自動インストール/アップグレード |
| 📄 **検証済み設定テンプレート** | 実績のある完全なテンプレートを直接書き込み |
| 🔄 **リレープロキシ** | codex-relay を自動インストール・設定 |
| 🚀 **自動起動設定** | システム起動時にリレーが自動起動 |
| 🛡️ **管理者権限昇格** | リレーを管理者権限で自動起動 |
| 🔒 **匿名化共有** | API Key を伏せた状態で設定を安全に共有 |

---

## クイックスタート

### システム要件

- **OS**: Windows 10 / Windows 11（64ビット）
- **ネットワーク**: GitHub、python.org、nodejs.org にアクセス可能

### ワンクリックインストール

**PowerShell** で以下のコマンドを実行するだけ：

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\Administrator\.codex\skills\codex-installer\scripts\auto-install.ps1"
```

> ⚠️ **注意**: 実際のインストール場所に合わせてパスを調整してください。

### 必要なもの

1. ✅ インターネットに接続された Windows PC
2. ✅ **DeepSeek API Key**（登録方法は下記参照）
3. ✅ 約 **10〜15分**（ネットワーク速度によります）

### DeepSeek API Key の取得方法

1. https://platform.deepseek.com/ を開く
2. 「Sign Up」をクリックしてメールアドレスで登録
3. ログイン後、**API Keys** ページへ
4. 「Create API Key」をクリックし、`sk-...` の文字列をコピー

> 💡 **ヒント**: 新規ユーザーには500万トークンが無料で付与されます。

---

## 自動化ワークフロー

スクリプトは **9つのステップ** を順に実行します。入力が必要なのは API Key とデスクトップアプリのインストール確認のみです。

### フローチャート

```
① Python チェック → ② Node.js チェック → ③ API Key 入力
→ ④ 設定ファイル生成 → ⑤ codex-relay インストール
→ ⑥ Codex デスクトップインストール（手動）
→ ⑦ 設定確認 → ⑧ 自動起動設定 → ⑨ リレー起動
→ 🎉 完了！
```

### ステップ詳細

#### ステップ ①: Python チェック

- **≥ 3.11** インストール済み → ✅ スキップ
- **< 3.11** または未インストール → ⬇️ 最新版を自動インストール

インストール優先順位：
1. `winget`（最速）
2. python.org からサイレントインストール
3. 手動インストールを案内

#### ステップ ②: Node.js チェック

- **≥ 20.x** → スキップ
- **< 20.x** または未インストール → 自動インストール

#### ステップ ③: API Key の取得

スクリプトが DeepSeek の登録ページを開きます：
1. DeepSeek に登録/ログイン
2. API Keys → 新しいキーを作成
3. `sk-...` の文字列をコピー
4. PowerShell のプロンプトに貼り付け

#### ステップ ④: 設定ファイルの生成

**最も重要なステップです。**  
スクリプトは**検証済みの完全な設定ファイル**を直接書き込みます。AI による動的生成ではないため、信頼性が高いです。

`%USERPROFILE%\.codex\` に以下のファイルが作成されます：

| ファイル | 用途 |
|---------|------|
| `Start_Deepseek_relay.ps1` | リレープロキシ起動スクリプト |
| `config.toml` | Codex CLI 設定ファイル |

#### ステップ ⑤: codex-relay のインストール

`codex-relay` は Codex のリクエストを DeepSeek API に転送するプロキシです。

#### ステップ ⑥: Codex デスクトップのインストール

公式ダウンロードページが開きます：
> https://openai.com/en-US/codex/get-started/

1. 「Download for Windows」をクリック
2. インストーラーを実行
3. セットアップウィザードに従う
4. PowerShell に戻り `y` と入力して確認

#### ステップ ⑦〜⑨: 確認・自動起動・リレー起動

設定ファイルの存在確認、起動ショートカットの作成、管理者権限でのリレー起動を自動実行します。

---

## 手動セットアップ

自動スクリプトが失敗した場合や手動で設定したい場合の手順です。

### 1. Python のインストール

1. https://www.python.org/downloads/ を開く
2. 最新のインストーラーをダウンロード
3. 「Add Python to PATH」に**チェック**を入れてインストール
4. 確認: `python --version`

### 2. Node.js のインストール

1. https://nodejs.org/ を開く
2. LTS 版をダウンロード
3. デフォルト設定でインストール
4. 確認: `node --version`

### 3. Codex デスクトップのインストール

1. https://openai.com/en-US/codex/get-started/ を開く
2. Windows 版をダウンロード
3. インストーラーを実行
4. 確認: `codex --version`

### 4. codex-relay のインストール

```powershell
npm install -g codex-relay
```

確認：
```powershell
codex-relay --version
```

### 5. 設定ファイルの作成

#### ディレクトリ作成

```powershell
New-Item -ItemType Directory -Path "$env:USERPROFILE\.codex" -Force
```

#### Start_Deepseek_relay.ps1 の作成

`%USERPROFILE%\.codex\Start_Deepseek_relay.ps1` に保存：

```powershell
Remove-Item Env:OPENAI_API_KEY -ErrorAction SilentlyContinue
Remove-Item Env:CODX_RELAY_UPSTREAM -ErrorAction SilentlyContinue
Remove-Item Env:CODX_RELAY_API_KEY -ErrorAction SilentlyContinue

Stop-Process -Name "codex-relay" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1

# 環境変数を使わず、直接パラメータで起動
$apiKey = "sk-xxxx...xxxx"   # 実際の DeepSeek API Key に置き換えてください
$upstream = "https://api.deepseek.com/v1"
$port = "4446"

Write-Host "✅ 起動パラメータ: Upstream = $upstream, Port = $port"

# --upstream と --port パラメータで起動
codex-relay --upstream $upstream --port $port --api-key $apiKey
```

> ⚠️ **`$apiKey` の値は実際の DeepSeek API Key に置き換えてください。**

#### config.toml の作成

`%USERPROFILE%\.codex\config.toml` に保存：

```toml
# =========================================================
# グローバルデフォルト設定（DeepSeek Relay を強制）
# =========================================================
model = "deepseek-chat"
model_provider = "deepseek_relay"
approval_policy = "never"
sandbox_mode = "danger-full-access"
suppress_unstable_features_warning = true

# =========================================================
# モデルプロバイダー定義（DeepSeek via Relay）
# =========================================================
[model_providers.deepseek_relay]
name = "DeepSeek via Relay"
base_url = "http://127.0.0.1:4446/v1"
wire_api = "responses"
requires_openai_auth = false
supports_websockets = false
request_max_retries = 0
stream_max_retries = 0
stream_idle_timeout_ms = 300000

# =========================================================
# プロファイル設定（オプション）
# =========================================================
[profiles.deepseek_chat]
model = "deepseek-chat"
model_provider = "deepseek_relay"
approval_policy = "never"
sandbox_mode = "danger-full-access"

# =========================================================
# 機能とエージェント設定
# =========================================================
[features]
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

### 6. リレーの手動起動

PowerShell を**管理者として実行**し、以下を実行：

```powershell
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.codex\Start_Deepseek_relay.ps1"
```

### 7. Codex の起動

リレーを起動したまま、**新しい PowerShell** ウィンドウを開く：

```powershell
codex
```

### 8. 自動起動の設定（手動）

1. `Win + R` を押し、`shell:startup` と入力して Enter
2. 右クリック → 新規 → ショートカット
3. 場所：
   ```
   powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "%USERPROFILE%\.codex\Start_Deepseek_relay.ps1"
   ```
4. 名前：`CodexRelay`

---

## 設定の共有（匿名化）

API Key を公開せずに設定を友人と共有する方法：

### スクリプトを使用

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\Administrator\.codex\skills\codex-installer\scripts\desensitize-files.ps1"
```

`%USERPROFILE%\.codex\share-to-friend\` に匿名化されたファイルが生成されます。

### 手動で匿名化

`Start_Deepseek_relay.ps1` 内の以下を置き換え：
```powershell
$apiKey = "sk-xxxx...xxxx"   # 実際の DeepSeek API Key に置き換えてください
```

`config.toml` には API Key が含まれていないため、そのまま共有できます。

---

## トラブルシューティング

### 一般的な問題

| 問題 | 原因 | 解決策 |
|------|------|--------|
| `スクリプトの実行が無効` | PowerShell 実行ポリシー | `-ExecutionPolicy Bypass` フラグを使用 |
| `python が認識されない` | PATH が通っていない | PowerShell を再起動、または PATH を手動追加 |
| `node が認識されない` | PATH が通っていない | PowerShell を再起動、または PATH を手動追加 |

### Python の問題

| 問題 | 解決策 |
|------|--------|
| winget インストール失敗 | python.org からのダウンロードに自動フォールバック |
| ダウンロードが遅い | https://www.python.org/downloads/ から手動ダウンロード |
| インストール後も `python` が使えない | PowerShell を再起動、「PATH に追加」がチェックされているか確認 |

### codex-relay の問題

| 問題 | 原因 | 解決策 |
|------|------|--------|
| `codex-relay が認識されない` | 未インストールまたは PATH 未更新 | 端末を再起動、または `npm install -g codex-relay` |
| npm インストール失敗 | ネットワーク問題 | インターネット接続を確認 |
| リレーがすぐに終了する | 権限不足 | PowerShell を**管理者として実行** |
| ポートが既に使用中 | ポート4446が占有 | スクリプトの `-port` パラメータを変更 |

### Codex の問題

| 問題 | 原因 | 解決策 |
|------|------|--------|
| `codex が認識されない` | 未インストール | Codex デスクトップをインストール、端末を再起動 |
| `Connection refused` | リレーが未起動 | 先にリレーを起動してから Codex を起動 |
| `401 Unauthorized` | API Key が無効 | DeepSeek プラットフォームで API Key を確認 |
| `Rate limit exceeded` | API クォータ不足 | DeepSeek でチャージ |

---

## ファイルリファレンス

### スキルディレクトリ構造

```
codex-installer/
│
├── SKILL.md                    ← Codex スキルガイド
├── README.md                   ← ドキュメント（中国語）
├── README_EN.md                ← ドキュメント（英語）
├── README_JP.md                ← ドキュメント（日本語）
├── agents/openai.yaml          ← UI メタデータ
├── assets/                     ← 予約ディレクトリ
└── scripts/
    ├── auto-install.ps1        ← 🚀 自動インストールスクリプト
    └── desensitize-files.ps1   ← 匿名化共有スクリプト
```

### 生成されるファイル

```
%USERPROFILE%\.codex/
│
├── Start_Deepseek_relay.ps1   ← 🚀 リレー起動スクリプト
├── config.toml                ← ⚙️  Codex CLI 設定
│
└── share-to-friend/           ← 📤 共有フォルダ（匿名化）
    ├── Start_Deepseek_relay_desensitized.ps1
    ├── config.toml
    └── README.txt
```

---

## よくある質問

### Q1: インストール中にネットワークが切断されたら？

その時点での手順を案内します。スクリプトを再実行すると、完了済みのステップはスキップされます。

### Q2: 複数のPCで同じAPI Keyを使えますか？

**はい。** DeepSeek API Key はアカウント単位で、複数デバイスで使用できます。公開しないよう注意してください。

### Q3: Codex を最新版に更新するには？

`auto-install.ps1` を再実行するか、公式サイトから最新版をダウンロードしてください。

### Q4: 他のAIモデルに変更できますか？

現在は DeepSeek のみ対応しています。他のモデル（OpenAI、Claude 等）を使用するには、`config.toml` を手動で編集してください。

### Q5: Linux/Mac でも使えますか？

**いいえ。** このツールは Windows 専用です（PowerShell、COM オブジェクト、winget 等を使用）。

### Q6: Codex を使うたびにリレーを起動する必要がありますか？

**はい。** リレーは Codex と DeepSeek API の橋渡しをします。自動起動を設定すれば、起動時に自動で起動します。

### Q7: リレーが動作しているか確認するには？

```powershell
Get-Process -Name "codex-relay" -ErrorAction SilentlyContinue
```

### Q8: リレーを停止するには？

```powershell
Stop-Process -Name "codex-relay" -Force
```

---

## ライセンス

このプロジェクトは学習および個人利用のみを目的としています。DeepSeek、OpenAI、Codex の利用規約に従ってください。

---

## 更新履歴

### v1.0（2026-05-28）

- 🎉 初回リリース
- Python / Node.js / Codex / codex-relay の完全自動インストール
- 環境バージョン検出（≥3.11 / ≥20.x）
- 検証済み設定テンプレート
- Codex デスクトップインストールガイド
- 自動起動設定
- 管理者権限自動昇格
- 匿名化共有機能

---

> 💡 **ヒント**: 問題が発生した場合は[トラブルシューティング](#トラブルシューティング)を参照してください。
