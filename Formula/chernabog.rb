# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.12.0/chernabog-v0.12.0-darwin-arm64.tar.gz"
      sha256 "26cc59159436d45fc29c0c190562831b3e2ddb0420216e40274df921966b422a"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.12.0/chernabog-v0.12.0-darwin-x64.tar.gz"
      sha256 "2dff7a634edca6fc0e6eb72f39d60dfebb7ce687128114d8d691a149a72d328e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.12.0/chernabog-v0.12.0-linux-arm64.tar.gz"
      sha256 "a67d3a8167e34f22342ac258d7adb0277dca51056138aed8d8be20d981a1726b"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.12.0/chernabog-v0.12.0-linux-x64.tar.gz"
      sha256 "1963c3e5ba0d1f777fae40edf4ac933510562a8516422e61ba6d21d738bf26c7"
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
