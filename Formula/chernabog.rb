# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.8.0/chernabog-v0.8.0-darwin-arm64.tar.gz"
      sha256 "d94dab71454201f7855436bd1769e9f6e94130e8f20a58ff57036c7bf2a4097b"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.8.0/chernabog-v0.8.0-darwin-x64.tar.gz"
      sha256 "37a8ccaf1ad681d957773222723d95278f958a503eb211b25c7dd862312f7e10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.8.0/chernabog-v0.8.0-linux-arm64.tar.gz"
      sha256 "eb2fe92ca83e2cae7bf505f39aaa470af570feea912a00a95230072c109adf50"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.8.0/chernabog-v0.8.0-linux-x64.tar.gz"
      sha256 "235ec5178afcc8a07b1f5497ff29bd22fa4e70cdd52de6c9f6b2cdd9f2c4ff52"
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
