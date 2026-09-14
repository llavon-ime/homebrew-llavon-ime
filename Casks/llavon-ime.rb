cask "llavon-ime" do
  version "0.5.0"
  sha256 "215118303acba9edbdb469dc93c716a0e665869af43ba9011b7cd1d9531b3fb9"

  url "https://github.com/llavon-ime/ime-fcitx5/releases/download/v#{version}/llavon-ime-#{version}-arm64.pkg",
      verified: "github.com/llavon-ime/ime-fcitx5/"
  name "拉風輸入法"
  desc "Chinese input method for Fcitx5"
  homepage "https://github.com/llavon-ime/ime-fcitx5"

  depends_on macos: :ventura
  depends_on arch: :arm64

  pkg "llavon-ime-#{version}-arm64.pkg"

  uninstall pkgutil: "llavon-ime",
            delete:  "/Library/Application Support/llavon-ime"

  zap trash: [
    "~/Library/fcitx5/bin/llavon-ime-service",
    "~/Library/fcitx5/lib/fcitx5/llavon-ime-addon.so",
    "~/Library/fcitx5/plugin/llavon-ime.json",
    "~/Library/fcitx5/share/fcitx5/addon/llavon-ime.conf",
    "~/Library/fcitx5/share/fcitx5/inputmethod/llavon-ime.conf",
    "~/Library/fcitx5/share/llavon-ime/tables/bopomofo_char.json",
    "~/Library/fcitx5/share/llavon-ime/tables/tokens",
  ]
end
