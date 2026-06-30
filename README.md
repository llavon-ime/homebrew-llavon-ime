# Homebrew Tap for IME

This tap publishes the macOS fcitx5 package as a Homebrew Cask.

The `Casks/ime-fcitx5.rb` version and sha256 are normally updated automatically by the IME repository's `Release macOS package` GitHub Actions workflow when a `v*` tag is pushed.

## Release Steps

1. Build the package from the IME repository:

```bash
IME_FCITX5_VERSION=0.1.0 \
FCITX5_MACOS_SOURCE_DIR=/path/to/fcitx5-macos \
./scripts/package-macos.sh
```

2. Upload the package to the IME GitHub release `v0.1.0`:

```text
ime-fcitx5-0.1.0-arm64.pkg
```

3. Compute the package hash:

```bash
shasum -a 256 dist/macos/ime-fcitx5-0.1.0-arm64.pkg
```

4. Update `Casks/ime-fcitx5.rb`:

```ruby
version "0.1.0"
sha256 "<hash>"
```

## Local Test

```bash
brew install --cask ./Casks/ime-fcitx5.rb
brew uninstall --cask ime-fcitx5
brew zap --cask ime-fcitx5
```

## User Install

```bash
brew tap billy948787/ime
brew install --cask ime-fcitx5
```
