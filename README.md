# Soren-Starck/homebrew-tap

Homebrew tap for [SessionWatcher](https://www.sessionwatcher.com/) — a macOS
menu-bar monitor for Claude, Codex, and Cursor usage.

## Install

```sh
brew tap soren-starck/tap
brew trust soren-starck/tap        # Homebrew 6+ requires trusting third-party taps
brew install --cask sessionwatcher
```

> Homebrew 6 refuses to load casks from an untrusted third-party tap until you
> run `brew trust soren-starck/tap` (one time). Without it you'll see
> "Refusing to load cask … from untrusted tap." This step is not needed for
> casks in the official `homebrew-cask` repo.

After the one-time `brew tap` + `brew trust`, the short name works directly:

```sh
brew install --cask sessionwatcher
brew upgrade --cask sessionwatcher
```

## Updating

SessionWatcher updates itself through its built-in Sparkle updater, **and** you
can update it with Homebrew — both work, in any order, and always land on a
valid, current build. If Sparkle updated the app since your last `brew`
command, Homebrew's recorded version may lag briefly; it reconciles on the next
`brew upgrade`.

## Uninstall

```sh
brew uninstall --cask sessionwatcher        # remove the app
brew uninstall --zap --cask sessionwatcher  # also remove app data / preferences
```
