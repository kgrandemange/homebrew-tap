cask "tmuxisland" do
  version "1.1.0"
  sha256 "4100ed0046c926de3a18712ff517f552a0d23bbcd6d4ff8135f8fef354603a12"

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
