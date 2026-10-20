# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.7.0/chernabog-v0.7.0-darwin-arm64.tar.gz"
      sha256 "ef284468006ea14b1b92cd3cbc00b55014fe6f9194bf730aed32ff142d04e1d4"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.7.0/chernabog-v0.7.0-darwin-x64.tar.gz"
      sha256 "570a1f6dc803e944eebc91d43ba61849f2c6b6bb75d6a281337c057c1317ba00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.7.0/chernabog-v0.7.0-linux-arm64.tar.gz"
      sha256 "3bc7e0728ca3ce126b4715176118bef232359b519fd3d015631580c748dd3078"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.7.0/chernabog-v0.7.0-linux-x64.tar.gz"
      sha256 "2a5f41b914e332de0184b182f8324aa64a1cbdf94ad1493d2b74235b3079e81b"
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
