# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.1/chernabog-v0.17.1-darwin-arm64.tar.gz"
      sha256 "db46cc42de7ba969c58fedaeebc58a957505af67fce829790248e95ed71bb842"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.1/chernabog-v0.17.1-darwin-x64.tar.gz"
      sha256 "5899d2a889bdb729a7e8f6d7bd74dfffb317a8d60a172500eba0740b8e6f4f50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.1/chernabog-v0.17.1-linux-arm64.tar.gz"
      sha256 "8daeeacba1def8418958f40c5a7f709efdba8f8a61ad03543963b6a4d67989ac"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.1/chernabog-v0.17.1-linux-x64.tar.gz"
      sha256 "89d31c2264f8788113fe7cf56982224855b2ad2663b7cbc039555c61c607662f"
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
