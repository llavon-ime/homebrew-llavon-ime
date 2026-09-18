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

## 使用者安裝（一鍵安裝，建議）

1. 到 <https://github.com/llavon-ime/ime-fcitx5/releases/latest> 下載 `llavon-ime-installer-<版本>-arm64.zip`（Release 頁面若尚無 installer 檔案，請改用下方 Homebrew 方式）。

2. 解壓縮後打開 `Fcitx5Installer.app`。安裝程式會安裝小企鵝輸入法（Fcitx5）、拉風輸入法與模型，並自動啟用輸入法及加入 macOS 輸入來源。

3. 安裝完成後即可直接使用；在右上角選單列可切換小企鵝輸入法。

若 macOS 因未簽名而阻擋 `Fcitx5Installer.app`，請確認檔案來自 <https://github.com/llavon-ime/ime-fcitx5/releases>，再執行：

```bash
xattr -dr com.apple.quarantine "/path/to/Fcitx5Installer.app"
```

## 使用者安裝（Homebrew，適用於已安裝 Fcitx5 者）

1. 到 <https://github.com/fcitx-contrib/fcitx5-macos-installer> 下載 `Fcitx5Installer.zip`，執行安裝程式來安裝小企鵝輸入法（Fcitx5）。只需要下載 `Fcitx5Installer.zip` 就好。

2. 打開 macOS「系統設定」，到「鍵盤」的輸入法/輸入來源設定，把小企鵝輸入法（Fcitx5）加入輸入法列表。

3. 用 Homebrew 安裝拉風輸入法：

```bash
brew tap llavon-ime/llavon-ime
brew trust --cask llavon-ime/llavon-ime/llavon-ime
brew install --cask llavon-ime
```

4. 在右上角選單列切換到小企鵝輸入法，點擊小企鵝輸入法，下面會看到輸入法的選項。

5. 點進輸入法選項後，刪除它自帶的英文輸入法，新增拉風輸入法（Llavon IME）。接著點擊拉風輸入法，就可以設定並開始使用。

## 注意事項

如果 `Fcitx5Installer.app` 打不開，或 macOS 顯示「應用程式無法打開，因為可執行檔遺失」，可以先確認 `Info.plist` 裡有沒有指定 `CFBundleExecutable`。如果缺少，可以執行：

```bash
/usr/libexec/PlistBuddy -c "Add :CFBundleExecutable string Fcitx5Installer" "/path/to/Fcitx5Installer.app/Contents/Info.plist"
```

如果 macOS 因為下載隔離或未簽名而阻擋安裝程式，請先確認檔案確實是從 <https://github.com/fcitx-contrib/fcitx5-macos-installer> 下載，再執行：

```bash
xattr -dr com.apple.quarantine "/path/to/Fcitx5Installer.app"
```

處理完後重新開啟 `Fcitx5Installer.app` 即可。
