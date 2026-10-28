# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.10.0/chernabog-v0.10.0-darwin-arm64.tar.gz"
      sha256 "b9593bb3aad2088b5393778da39705a22eed33bc9a0c06e6d51e7a2748ebfcbc"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.10.0/chernabog-v0.10.0-darwin-x64.tar.gz"
      sha256 "3b600df27903e5b12623393533f7c1802d2581240a7cafddb60473eb6392e647"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.10.0/chernabog-v0.10.0-linux-arm64.tar.gz"
      sha256 "6244bf882a8cb59e5e0bc5fb7a6ea5e5c7248ffdfd80fd708bd80e6306210c97"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.10.0/chernabog-v0.10.0-linux-x64.tar.gz"
      sha256 "61317fc37795fffdc1f03c39c1d872f3eaba1f9cbba2f59ea66c66f9828675be"
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
