# Homebrew tap for TmuxIsland

```bash
brew tap kgrandemange/tap
brew trust --tap kgrandemange/tap   # Homebrew asks you to trust third-party taps (once)
brew install --cask tmuxisland
```

[TmuxIsland](https://kgrandemange.github.io/tmux-island/) is a Dynamic Island for tmux on macOS: it tells you
which AI agent finished and jumps to the right pane in one click. Free to use, not open source.

- Apple Silicon only, macOS 14 or later.
- The app is **not notarized** (that needs a paid Apple developer account). Homebrew verifies the SHA-256 of the
  download, then the cask removes the quarantine flag so macOS doesn't show the first-launch warning.
- Uninstall: `brew uninstall --cask tmuxisland` (`--zap` also removes its settings).
