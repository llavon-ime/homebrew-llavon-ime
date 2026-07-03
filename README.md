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

## 使用者安裝

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
