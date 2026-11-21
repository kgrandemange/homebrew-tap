cask "tmuxisland" do
  version "1.1.1"
  sha256 "c73cd93e524eaba63a38f357f7ceb47f2425d3f555da7a9ca979760fa0a0e48b"

  url "https://github.com/kgrandemange/tmux-island/releases/download/v#{version}/TmuxIsland.zip"
  name "TmuxIsland"
  desc "Dynamic Island for tmux: see which AI agent finished and jump to its pane"
  homepage "https://kgrandemange.github.io/tmux-island/"

  livecheck do
    url "https://github.com/kgrandemange/tmux-island/releases"
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
