# Homebrew Tap for Llavon IME

This tap publishes Llavon IME and its fcitx5-macos runtime dependency as Homebrew Casks.

The `Casks/llavon-ime.rb` version and sha256 are normally updated automatically by the IME repository's `Release macOS package` GitHub Actions workflow when a `v*` tag is pushed.

`Casks/fcitx5-macos.rb` tracks the signed upstream fcitx5-macos release and is installed automatically as a dependency of `llavon-ime`.

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
brew install --cask ./Casks/fcitx5-macos.rb
brew install --cask ./Casks/llavon-ime.rb
brew uninstall --cask llavon-ime
brew uninstall --cask fcitx5-macos
brew zap --cask llavon-ime
```

## User Install

```bash
brew tap llavon-ime/llavon-ime
brew install --cask llavon-ime
```
