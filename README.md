# Homebrew Tap for Llavon IME

This tap publishes the native macOS 「拉風輸入法」 (Llavon IME) as a Homebrew Cask.

The `Casks/llavon-ime.rb` version and sha256 are normally updated automatically by the IME repository's `Release macOS package` GitHub Actions workflow when a `v*` tag is pushed.

## 使用者安裝（一鍵安裝）

```bash
brew tap llavon-ime/llavon-ime
brew trust --cask llavon-ime/llavon-ime/llavon-ime
brew install --cask llavon-ime
```

安裝過程會要求管理員密碼，會安裝原生「拉風輸入法」、注音表、模型與 AI 預測服務，並自動向系統註冊輸入來源。

若偵測到舊版安裝包留下的 Fcitx5 輸入法（fcitx5-macos），安裝程式會**先跳出對話框詢問是否一併移除**：只有選擇「移除」才會刪除 Fcitx5.app 與它的附加元件；選擇「保留」、關閉對話框或沒有人回應時都不會刪除。

安裝完成後到「系統設定 › 鍵盤 › 輸入方式」加入「拉風輸入法」，macOS 會詢問是否允許這個第三方輸入法。**首次安裝請登出再登入（或重新開機）**，輸入來源才會出現。

也可以到 <https://github.com/llavon-ime/ime-fcitx5/releases/latest> 直接下載 `llavon-ime-<版本>-arm64.pkg` 安裝；未簽名，若被 Gatekeeper 阻擋請右鍵選擇「打開」。

## 更新

```bash
brew update
brew upgrade --cask llavon-ime
```

設定（`~/.config/llavon-ime/`）與替代詞彙會保留。升級時如果 Fcitx5 還在，會再次詢問是否移除。

## 移除

```bash
brew uninstall --cask llavon-ime
brew zap --cask llavon-ime
```

`brew uninstall` 移除拉風輸入法本體與 `/Library/Application Support/llavon-ime`。Fcitx5 是否移除由安裝時的詢問決定，不會跟著被刪除；`brew zap` 另外清掉 `~/.config/llavon-ime` 與舊版 fcitx5 留下的檔案。

## Release Steps

通常不需要手動更新：`v*` tag 推到 `main` 後，IME 儲存庫的 `Release macOS package` workflow 會建置 pkg、發布 release，並自動更新此 tap 的 `version` 與 `sha256`。

手動建置時：

```bash
./scripts/package-macos.sh
shasum -a 256 dist/macos/llavon-ime-<版本>-arm64.pkg
```

再把 `version` 與 `sha256` 填進 `Casks/llavon-ime.rb`。

## Local Test

```bash
brew install --cask ./Casks/llavon-ime.rb
brew uninstall --cask llavon-ime
brew zap --cask llavon-ime
```
