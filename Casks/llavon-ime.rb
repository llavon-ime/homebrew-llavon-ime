cask "llavon-ime" do
  version "0.9.0"
  sha256 "006c96d92eeca3fd7056b3254b7506dcba030423bf4668326bf2cb4e933f5655"

  url "https://github.com/llavon-ime/ime-unix/releases/download/v#{version}/llavon-ime-#{version}-arm64.pkg",
      verified: "github.com/llavon-ime/ime-unix/"
  name "拉風輸入法"
  desc "Native macOS Chinese input method"
  homepage "https://github.com/llavon-ime/ime-unix"

  depends_on macos: :ventura
  depends_on arch: :arm64

  pkg "llavon-ime-#{version}-arm64.pkg"

  uninstall pkgutil: "llavon-ime",
            delete:  [
              "/Library/Application Support/llavon-ime",
              "/Library/Input Methods/LlavonIME.app",
            ]

  zap trash: [
    "~/.config/llavon-ime",
    # Files left by the earlier fcitx5-based installs.
    "~/Library/fcitx5/bin/llavon-ime-service",
    "~/Library/fcitx5/bin/llavon-ime-unix-service",
    "~/Library/fcitx5/lib/fcitx5/llavon-ime-addon.so",
    "~/Library/fcitx5/plugin/llavon-ime.json",
    "~/Library/fcitx5/share/fcitx5/addon/llavon-ime.conf",
    "~/Library/fcitx5/share/fcitx5/inputmethod/llavon-ime.conf",
    "~/Library/fcitx5/share/llavon-ime",
  ]
end
