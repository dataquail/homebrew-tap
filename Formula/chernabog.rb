# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.1/chernabog-v0.6.1-darwin-arm64.tar.gz"
      sha256 "2d8620a9651bf0280b474146084768e39edbfe1f32e04dfa39317a7019b863aa"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.1/chernabog-v0.6.1-darwin-x64.tar.gz"
      sha256 "65cc528a0b755ebec060c4fdf9933a0e1848942bb1ee6c33a433db73a1ba94ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.1/chernabog-v0.6.1-linux-arm64.tar.gz"
      sha256 "6593c84f51970ec418bcd8c4254dd1164682f15b44ecf86e7c98c92b8ad12e95"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.1/chernabog-v0.6.1-linux-x64.tar.gz"
      sha256 "9464da3c295ab9e1b9f7e924f47fb6461a0f908e7aba3a60fddfa8ce5c4f4d78"
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
