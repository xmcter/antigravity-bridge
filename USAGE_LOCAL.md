# Antigravity Bridge（本机）

把 Google Antigravity / Gemini Code Assist 会员变成 OpenAI 兼容 API，供 Codex 使用。

## 地址
- Base URL: `http://127.0.0.1:52847/v1`
- API Key: 见同目录 `.bridge_api_key`（chmod 600）
- 健康检查: `curl http://127.0.0.1:52847/health`

## 服务管理
```bash
# 状态
launchctl print gui/$(id -u)/com.user.antigravity-bridge | head

# 重启
launchctl kickstart -k gui/$(id -u)/com.user.antigravity-bridge

# 停止
launchctl bootout gui/$(id -u)/com.user.antigravity-bridge

# 启动
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.user.antigravity-bridge.plist
```

## 依赖
- 本机 Clash 代理 `127.0.0.1:7897`（访问 Google 必需）
- Keychain 中 Antigravity OAuth（`service=gemini` / `account=antigravity`）
- `.env` 里的 refresh_token 会自动刷新 access_token

## Codex
`~/.codex/config.toml` 已配置:
- `model_provider = "antigravity"`
- `model = "gemini-2.5-flash"`
- 备份: `~/.codex/config.toml.bak-ag-bridge-*`

切回 SDP：把 `model_provider` 改回 `sdp`，`model` 改回 `gpt-5.6-sol`。

## 注意
- 桥跑在 **这台 Mac** 的 localhost。Windows 上的 Codex 访问不到，除非在 Windows 也部署一份，或做内网穿透。
- CC Switch 若切换供应商，可能覆盖 `config.toml`；需要的话在 CC Switch 里新增同名供应商。
