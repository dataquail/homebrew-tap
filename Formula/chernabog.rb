# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.18.0/chernabog-v0.18.0-darwin-arm64.tar.gz"
      sha256 "fc27932bcac95c5f5825aeed640caf022b9fb3148892d9973362ff8f8b00c6f8"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.18.0/chernabog-v0.18.0-darwin-x64.tar.gz"
      sha256 "a61e1e1c0f11ebc3d9a5ae9bd5fc8a0ace52e3872532952519c4c6942d53e759"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.18.0/chernabog-v0.18.0-linux-arm64.tar.gz"
      sha256 "0e9f4bf9f0cd3f23856e76da5319f088a70776f08351956d2d28d571e28f5a7c"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.18.0/chernabog-v0.18.0-linux-x64.tar.gz"
      sha256 "161dd05de18c75c1ef4b881695e36e46eda1444128bb2cc5058f22fedd3c60d0"
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
