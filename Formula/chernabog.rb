# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.3/chernabog-v0.16.3-darwin-arm64.tar.gz"
      sha256 "96343b3fd3724d09bdb5773be036e4fb7f920e49d702b3900ee2ab31a3762e83"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.3/chernabog-v0.16.3-darwin-x64.tar.gz"
      sha256 "3a234e1f6caf2cf8fba406a780cfa77679df817ad4a5d3e61307d3c554b355e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.3/chernabog-v0.16.3-linux-arm64.tar.gz"
      sha256 "19594abef66f9be29d51df0df23a549aa66c0a1d47ece7fc38108045a1d71322"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.3/chernabog-v0.16.3-linux-x64.tar.gz"
      sha256 "5177788ce885bbede05c585ce7e8a7eb96243f898a6a1c79c75c95c3683ec6a8"
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
