# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Runs coding agents on schedules you set, across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.0/chernabog-v0.17.0-darwin-arm64.tar.gz"
      sha256 "c4cf20c576d966aeeb3975f1f03dd9324d619ff3789c5795113bb02bdd197960"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.0/chernabog-v0.17.0-darwin-x64.tar.gz"
      sha256 "893d713cafef6b6178738550afb791fd83a5cf633ddefd730ff0ad264c3f44db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.0/chernabog-v0.17.0-linux-arm64.tar.gz"
      sha256 "a176b59c3124ba676f41ff7c9c66abad852a8ebfb6f4c5fb3ab0ef4714d51ca5"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.17.0/chernabog-v0.17.0-linux-x64.tar.gz"
      sha256 "b8320a9a64508489e7eb930774d9ad0d11a9391a6061a0f2b892ee335d7d3182"
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
