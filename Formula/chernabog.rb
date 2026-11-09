# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.15.0/chernabog-v0.15.0-darwin-arm64.tar.gz"
      sha256 "6de47858bf59bac125df7600ba6c18283fe53715ecd26695d7bcc325081cc484"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.15.0/chernabog-v0.15.0-darwin-x64.tar.gz"
      sha256 "de18ee9f81f72b1f7f30fa76f55bed7c917056775dd0eef9e5ef213d716000d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.15.0/chernabog-v0.15.0-linux-arm64.tar.gz"
      sha256 "3b4cb3a5d6f2e7d06fbeb88acfecc98a6c70e19da295fd30f8587a90a36adf6d"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.15.0/chernabog-v0.15.0-linux-x64.tar.gz"
      sha256 "5c411983581b2e7a8f87466ca61eb38caf14ad50913cbec4b0f10a31c6475208"
    end
  end

  def install
    bin.install "chernabog"
  end

  def caveats
    <<~EOS
      Register the daemon with launchd or systemd, then check the setup:
        chernabog install
        chernabog doctor

      After `brew upgrade chernabog`, restart the daemon on the new version:
        chernabog stop && chernabog start
    EOS
  end

  test do
    assert_match "chernabog v#{version}", shell_output("#{bin}/chernabog --version")
  end
end
