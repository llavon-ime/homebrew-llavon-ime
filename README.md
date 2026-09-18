# Homebrew Tap for Llavon IME

This tap publishes Llavon IME as a Homebrew Cask.

The `Casks/llavon-ime.rb` version and sha256 are normally updated automatically by the IME repository's `Release macOS package` GitHub Actions workflow when a `v*` tag is pushed.

## Release Steps

1. Build the package from the IME repository:

```bash
IME_FCITX5_VERSION=0.1.0 \
FCITX5_MACOS_SOURCE_DIR=/path/to/fcitx5-macos \
./scripts/package-macos.sh
```

2. Upload the package to the IME GitHub release `v0.1.0`:

```text
llavon-ime-0.1.0-arm64.pkg
```

3. Compute the package hash:

```bash
shasum -a 256 dist/macos/llavon-ime-0.1.0-arm64.pkg
```

4. Update `Casks/llavon-ime.rb`:

```ruby
version "0.1.0"
sha256 "<hash>"
```

## Local Test

```bash
brew install --cask ./Casks/llavon-ime.rb
brew uninstall --cask llavon-ime
brew zap --cask llavon-ime
```

## 使用者安裝（一鍵安裝）

以下兩種方式都會一併安裝小企鵝輸入法（Fcitx5）、拉風輸入法與模型，並自動啟用輸入法及加入 macOS 輸入來源。

### 方法一：Homebrew

```bash
brew tap llavon-ime/llavon-ime
brew trust --cask llavon-ime/llavon-ime/llavon-ime
brew install --cask llavon-ime
```

安裝過程會要求輸入管理員密碼。

### 方法二：手動下載

1. 到 <https://github.com/llavon-ime/ime-fcitx5/releases/latest> 下載 `llavon-ime-installer-<版本>-arm64.zip`。

2. 解壓縮後打開 `Fcitx5Installer.app`，按「Install」並輸入管理員密碼。安裝程式會安裝小企鵝輸入法（Fcitx5）、拉風輸入法與模型，並自動啟用輸入法及加入 macOS 輸入來源。

3. **首次安裝請登出再登入（或重新開機）**，否則候選窗無法在全螢幕應用程式中顯示；之後的更新不需要。

4. 完成後即可在右上角選單列切換小企鵝輸入法。若小企鵝沒有出現在輸入法選單，請到「系統設定 → 鍵盤 → 輸入法」將它移除後重新加入。

若 macOS 因未簽名而阻擋 `Fcitx5Installer.app`，請確認檔案來自 <https://github.com/llavon-ime/ime-fcitx5/releases>，再執行：

```bash
xattr -dr com.apple.quarantine "/path/to/Fcitx5Installer.app"
```

處理完後重新開啟 `Fcitx5Installer.app` 即可。
