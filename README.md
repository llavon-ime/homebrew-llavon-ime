# 拉風輸入法 Homebrew Tap

這個 Homebrew Tap 提供拉風輸入法（Llavon IME）的 macOS Cask。

拉風輸入法是一套專為繁體中文注音輸入打造的輸入法。它使用約 2.5 億參數的語言模型，根據前文與注音內容預測更合適的文字，同時確保候選字符合輸入的讀音。

所有輸入內容與模型推論都在電腦本機完成，不需要連線至雲端，也不會為了選字而上傳正在輸入的文字。

> [!IMPORTANT]
> 本專案仍在早期開發階段，功能、操作方式及安裝流程都可能變動。目前 Homebrew Cask 僅支援 Apple Silicon Mac。

## 安裝

```bash
brew tap llavon-ime/llavon-ime
brew trust --cask llavon-ime/llavon-ime/llavon-ime
brew install --cask llavon-ime
```

安裝過程會要求管理員密碼，並安裝：

- 原生 macOS「拉風輸入法」
- 注音表
- 本機 GGUF 模型
- AI 預測服務

安裝程式會向 macOS 註冊輸入來源。

若系統中仍有早期 Fcitx5 版本留下的檔案，安裝程式會詢問是否一併移除。只有明確選擇移除時才會刪除 Fcitx5.app 與相關元件。

### 啟用輸入法

安裝完成後，可前往：

**系統設定 → 鍵盤 → 輸入方式**

加入「拉風輸入法」。

macOS 26（Tahoe）對第三方輸入來源的啟用方式有所變更，第一次安裝時需要由「系統設定」手動加入；較舊版本通常可由安裝程式完成註冊與啟用。

也可以直接從 [ime-unix Releases](https://github.com/llavon-ime/ime-unix/releases/latest) 下載 `llavon-ime-<版本>-arm64.pkg` 安裝。

## 更新

```bash
brew update
brew upgrade --cask llavon-ime
```

更新時會保留 `~/.config/llavon-ime/` 中的設定與替代詞彙。

## 解除安裝

移除輸入法：

```bash
brew uninstall --cask llavon-ime
```

若也要刪除使用者設定與舊版 Fcitx5 安裝留下的檔案：

```bash
brew zap --cask llavon-ime
```

`brew uninstall` 會移除拉風輸入法本體以及 `/Library/Application Support/llavon-ime`。

`brew zap` 會另外清除 `~/.config/llavon-ime` 與早期 Fcitx5 版本留下的 Llavon IME 檔案。

## 專案來源

macOS 輸入法、預測服務與發行套件的原始碼位於：

[llavon-ime/ime-unix](https://github.com/llavon-ime/ime-unix)

模型相關資訊：

[llavon-ime-llama-250m-GGUF](https://huggingface.co/tony65535/llavon-ime-llama-250m-GGUF)

## 維護者資訊

`Casks/llavon-ime.rb` 的 `version` 與 `sha256` 通常由 `ime-unix` 的 macOS release workflow 自動更新。

建立 `v*` release 時，workflow 會建置 macOS pkg、發布 GitHub Release，並更新這個 Tap。

若需要手動更新，可先建立套件並計算 SHA-256：

```bash
./scripts/package-macos.sh
shasum -a 256 dist/macos/llavon-ime-<版本>-arm64.pkg
```

再更新 `Casks/llavon-ime.rb` 中的 `version` 與 `sha256`。

### 本機測試

```bash
brew install --cask ./Casks/llavon-ime.rb
brew uninstall --cask llavon-ime
brew zap --cask llavon-ime
```
