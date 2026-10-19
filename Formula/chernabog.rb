# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.3.0/chernabog-v0.3.0-darwin-arm64.tar.gz"
      sha256 "355c7a4f047c54b0cdd59ff52ceab0b330006c90abe197460d0bd8970bd6e7ad"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.3.0/chernabog-v0.3.0-darwin-x64.tar.gz"
      sha256 "428733e8f08a005c2f4964d9decb10706b7d0bdc88b5d4caf77cf5c3682e4816"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.3.0/chernabog-v0.3.0-linux-arm64.tar.gz"
      sha256 "9d8df0dfc27e530b39a9cd09b8fc4ffae2b3c4e58c2970fa1e5b9f061364aed4"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.3.0/chernabog-v0.3.0-linux-x64.tar.gz"
      sha256 "2cc1fd54ab9422061f14d0349286501a036cbf88f1ce916250d8094cb1e01572"
    end
  end

  depends_on "gh"

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

