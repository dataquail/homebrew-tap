# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.14.0/chernabog-v0.14.0-darwin-arm64.tar.gz"
      sha256 "446ad4db84fdcd1637d964ed908164f04fa1dcf667e84be0af570303db75a573"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.14.0/chernabog-v0.14.0-darwin-x64.tar.gz"
      sha256 "b48e7ef440ab9e5c33a617f1689b5d9713a618b644e6f0bc873e2ee328fdcfe4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.14.0/chernabog-v0.14.0-linux-arm64.tar.gz"
      sha256 "3c088eda1c53025d7a71d0a282513dadb740accfabbf06ca4696be7ccbfaa6de"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.14.0/chernabog-v0.14.0-linux-x64.tar.gz"
      sha256 "74bda3c1fe4666adebb7059e29e2b5ed537469067fbffaeda8568e2ecd6c06a5"
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
