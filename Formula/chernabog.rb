# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.0/chernabog-v0.6.0-darwin-arm64.tar.gz"
      sha256 "1514f8ed60fe6ba49561b4d0715ebc2cb41cfbceda68ceed2b790c8cd4900e5a"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.0/chernabog-v0.6.0-darwin-x64.tar.gz"
      sha256 "cb045b4aea8b6fd6bb6b58ddc41b4acdfa1383dbff4dff33439ab3b7d0c19c7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.0/chernabog-v0.6.0-linux-arm64.tar.gz"
      sha256 "3fdef876dcf5a124a9513d7071916cdb1764bf73421c591b5d38d54533e2809e"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.6.0/chernabog-v0.6.0-linux-x64.tar.gz"
      sha256 "5cd39ffc6cde7362a61264d799e37d8407ef63ecf390d8e0857d2aa41489429a"
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
