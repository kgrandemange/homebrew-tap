cask "tmuxisland" do
  version "0.1.2"
  sha256 "013e1bce7f5ef53598d6baad3aa32c2ea3f80b1c88d34f97d3ebe6267a6ee7d8"

  url "https://github.com/kgrandemange/tmux-island-site/releases/download/v#{version}/TmuxIsland.zip"
  name "TmuxIsland"
  desc "Dynamic Island for tmux: see which AI agent finished and jump to its pane"
  homepage "https://kgrandemange.github.io/tmux-island-site/"

  livecheck do
    url "https://github.com/kgrandemange/tmux-island-site/releases"
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "TmuxIsland.app"

  # The app is ad-hoc signed and not notarized (notarization needs a paid Apple developer account).
  # Homebrew has already verified the SHA-256 above, so the quarantine flag is removed to avoid the
  # first-launch Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "/Applications/TmuxIsland.app"],
        must_succeed: false
  end

  zap trash: [
    "~/.local/state/tmux-island",
    "~/Library/Preferences/io.github.kgrandemange.tmux-island.plist",
  ]
end
