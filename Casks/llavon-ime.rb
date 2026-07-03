cask "llavon-ime" do
  version "0.1.0"
  sha256 "0d084aedbe9b868b5c8b9a27d5d55916cf0ad7a36bb744b279f8a6fef59d3ea7"

  url "https://github.com/llavon-ime/IME/releases/download/v#{version}/llavon-ime-#{version}-arm64.pkg",
      verified: "github.com/llavon-ime/IME/"
  name "拉風輸入法"
  desc "Llavon IME for fcitx5-macos"
  homepage "https://github.com/llavon-ime/IME"

  depends_on macos: ">= :ventura"

  pkg "llavon-ime-#{version}-arm64.pkg"

  uninstall pkgutil: "llavon-ime",
            delete: "/Library/Application Support/llavon-ime"

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
