# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.13.0/chernabog-v0.13.0-darwin-arm64.tar.gz"
      sha256 "d98357118d906d9d4da8a8a00c36e8523d7f2408323b6375254d57cabe6b984a"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.13.0/chernabog-v0.13.0-darwin-x64.tar.gz"
      sha256 "e56a87ecd30b508fc021e37d8a27fea48bc9c31081c30af0d59c21a33cad01ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.13.0/chernabog-v0.13.0-linux-arm64.tar.gz"
      sha256 "58ccdcae1171fb29e8fb128b9d2c4636608781df1d5b4dcca051946e541f4f56"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.13.0/chernabog-v0.13.0-linux-x64.tar.gz"
      sha256 "5acd852d7bedbaee7821485899962a991a0af020b9146905093ed7f0a18008b4"
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
