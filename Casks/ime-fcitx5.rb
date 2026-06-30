cask "ime-fcitx5" do
  version "0.1.0"
  sha256 "REPLACE_WITH_SHA256"

  url "https://github.com/billy948787/IME/releases/download/v#{version}/ime-fcitx5-#{version}-arm64.pkg",
      verified: "github.com/billy948787/IME/"
  name "拉風輸入法 Fcitx5"
  desc "Lafon IME for fcitx5-macos"
  homepage "https://github.com/billy948787/IME"

  depends_on macos: ">= :ventura"

  pkg "ime-fcitx5-#{version}-arm64.pkg"

  uninstall pkgutil: "org.lafonime.ime-fcitx5",
            delete: "/Library/Application Support/IME-Fcitx5"

  zap trash: [
    "~/Library/fcitx5/bin/ime-fcitx5-service",
    "~/Library/fcitx5/lib/fcitx5/ime-fcitx5-addon.so",
    "~/Library/fcitx5/plugin/ime-fcitx5.json",
    "~/Library/fcitx5/share/fcitx5/addon/ime-fcitx5.conf",
    "~/Library/fcitx5/share/fcitx5/inputmethod/ime-fcitx5.conf",
    "~/Library/fcitx5/share/ime/tables/bopomofo_char.json",
    "~/Library/fcitx5/share/ime/tables/tokens",
  ]
end
