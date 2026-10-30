# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.0/chernabog-v0.11.0-darwin-arm64.tar.gz"
      sha256 "6e1080618b4d5c31067c60583cdc25f66293a285a2d7b06be9eff188f2b45dd2"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.0/chernabog-v0.11.0-darwin-x64.tar.gz"
      sha256 "c6789d2ce44944c95264c9a5cb6baf54f92ae375873fc464ca334d736e463604"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.0/chernabog-v0.11.0-linux-arm64.tar.gz"
      sha256 "f11d24f366901b0abcca21cf6d8376ffe4cb6845be51ca606082c088b337c094"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.0/chernabog-v0.11.0-linux-x64.tar.gz"
      sha256 "e16033e4a5efc7682b83f69d526c804d3bbfaaba235b3babb837ba8189126f76"
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
