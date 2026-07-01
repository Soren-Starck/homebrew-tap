cask "sessionwatcher" do
  version "6.3.23"
  sha256 "d1dd49f91e3607b2476392d4499af5046fcdd236de590bbacdf8828d8bccb270"

  url "https://sessionwatcher-updates.vercel.app/downloads/SessionWatcher-#{version}.dmg",
      verified: "sessionwatcher-updates.vercel.app/"
  name "SessionWatcher"
  desc "Menu bar monitor for AI coding assistant usage and limits"
  homepage "https://www.sessionwatcher.com/"

  # Reads the same Sparkle appcast the app itself checks, so `brew livecheck`
  # (and the release-time bump in build-release.sh) always sees the newest
  # published version.
  livecheck do
    url "https://sessionwatcher-updates.vercel.app/api/appcast/sessionwatcher"
    strategy :sparkle, &:short_version
  end

  # NOTE: intentionally NO `auto_updates true` here. The app DOES self-update
  # via Sparkle, but in this tap we want plain `brew upgrade` to drive updates
  # too (Coexist model). Setting auto_updates true would make `brew upgrade`
  # skip the cask (only `--greedy` would catch it). The trade-off is that
  # brew's recorded version can lag when Sparkle updated the app first; it
  # self-heals on the next bump. The official Homebrew/homebrew-cask copy of
  # this cask MUST add `auto_updates true` (their policy for Sparkle apps).
  depends_on macos: :sonoma

  app "SessionWatcher.app"

  zap trash: [
    "~/Library/Application Support/SessionWatcher",
    "~/Library/Caches/com.sessionwatcher.app",
    "~/Library/HTTPStorages/com.sessionwatcher.app",
    "~/Library/Preferences/com.sessionwatcher.app.plist",
  ]
end
