cask "fcitx5-macos" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.4"
  sha256 arm:   "f52bf3a6cb407368ccaf841a7a1b8da433ae1c7771dae250f283c9966f0e1280",
         intel: "8395fe3813ed3458a4a7b5615e314ae9cc1d3e565b31a3a88f048505b0d0a69f"

  url "https://github.com/fcitx/fcitx5-macos/releases/download/#{version}/Fcitx5-#{arch}.tar.bz2",
      verified: "github.com/fcitx/fcitx5-macos/"
  name "Fcitx5"
  desc "Input method framework"
  homepage "https://github.com/fcitx/fcitx5-macos"

  depends_on macos: :ventura

  artifact "Fcitx5.app", target: "/Library/Input Methods/Fcitx5.app"

  preflight do
    system_command "/usr/bin/pkill",
                   args:         ["-x", "Fcitx5"],
                   must_succeed: false,
                   sudo:         true

    if File.exist?("/Library/Input Methods/Fcitx5.app")
      system_command "/bin/rm",
                     args: ["-rf", "/Library/Input Methods/Fcitx5.app"],
                     sudo: true
    end
  end

  uninstall quit:   "org.fcitx.inputmethod.Fcitx5",
            delete: "/Library/Input Methods/Fcitx5.app"

  zap trash: [
    "~/.config/fcitx5",
    "~/.local/share/fcitx5",
    "~/Library/Application Support/fcitx5",
    "~/Library/fcitx5",
    "~/Library/Preferences/org.fcitx.inputmethod.Fcitx5.plist",
  ]

  caveats do
    logout
  end
end
