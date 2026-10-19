# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.4.0/chernabog-v0.4.0-darwin-arm64.tar.gz"
      sha256 "8743e8185ce73f287199c693406a545e05ae7d5e141fe0e174e3f3f5b0c4848d"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.4.0/chernabog-v0.4.0-darwin-x64.tar.gz"
      sha256 "f0af7270362ec2ca874d89a6968cc25406d261bdcc77e3fe10641d316b818f64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.4.0/chernabog-v0.4.0-linux-arm64.tar.gz"
      sha256 "62659e0f0431f49e5f0bfd91481185266d9b5eea5c3a51c03899df27b7a5fdbb"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.4.0/chernabog-v0.4.0-linux-x64.tar.gz"
      sha256 "bb911191d0cfb5863049e065c0cc2d3630d1b308ca27f720462c1f8f307313de"
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
