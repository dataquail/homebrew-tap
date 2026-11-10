# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.2/chernabog-v0.16.2-darwin-arm64.tar.gz"
      sha256 "10f4f7605fc55009450a487a52a78e39956dc32b64955005f75572d47eef9e90"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.2/chernabog-v0.16.2-darwin-x64.tar.gz"
      sha256 "9c0f5c985b5a07eadbd75b2121f09187bb9d2b67ad6f8ca35c33abc81bc26e19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.2/chernabog-v0.16.2-linux-arm64.tar.gz"
      sha256 "2bcc778f8e4a69929181800fdca8f90e3810db238067201c84a356b413945e58"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.2/chernabog-v0.16.2-linux-x64.tar.gz"
      sha256 "a84472a30de1bda8b5216f8a7e9be1716d5c57b099bc61448262f4ff12fc8cf9"
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
