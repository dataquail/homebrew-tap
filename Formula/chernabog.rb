# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.1/chernabog-v0.16.1-darwin-arm64.tar.gz"
      sha256 "053d4f8ff035e1f7be3b68507ec38d284c72b28e4b7fc9f656ede9a0c87c319b"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.1/chernabog-v0.16.1-darwin-x64.tar.gz"
      sha256 "8aad7faeca7013b7a3c8fae7e3a480080ad993aefaf4038214ebce52e65dc43f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.1/chernabog-v0.16.1-linux-arm64.tar.gz"
      sha256 "1167b068381f42ad8f0a26d090260e3d9e1ef9ef90c81924f87c12622ef85277"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.1/chernabog-v0.16.1-linux-x64.tar.gz"
      sha256 "89752dd622dbe2345b35aeadf78325c73e9e419931284660f2ec8b46f4240062"
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
