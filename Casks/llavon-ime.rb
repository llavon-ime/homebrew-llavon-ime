cask "llavon-ime" do
  version "0.2.2"
  sha256 "cdbef220e3f0178de35f3362e0bc6a06f958733b652f3ce2a1e9b35bfc460946"

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
