# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.0/chernabog-v0.16.0-darwin-arm64.tar.gz"
      sha256 "bb525097e2805170f935a0354a56d381546e1e5238631a5d8b863b88d51e3c86"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.0/chernabog-v0.16.0-darwin-x64.tar.gz"
      sha256 "3fbbc72e357fd5ee15cc61a6453723291cf09d4f0159951e6f1d35c58a9499c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.0/chernabog-v0.16.0-linux-arm64.tar.gz"
      sha256 "052e8e518a6439025f878f8dec31ef717eb617156d30a66be053147b9e632f5c"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.16.0/chernabog-v0.16.0-linux-x64.tar.gz"
      sha256 "3c2a220625f44d91252b7528e8a898978ca7b862cba5e5b8f2f58e79ff4f84c3"
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
