# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.1/chernabog-v0.11.1-darwin-arm64.tar.gz"
      sha256 "f2887836f5d4ee38139da0fa999bcb2b431903155e095c3187288f41366756f7"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.1/chernabog-v0.11.1-darwin-x64.tar.gz"
      sha256 "99f1af1bbd1abec07509ecf9069b9e0bb0bc0557f7d1fcee3f611721f0e3857c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.1/chernabog-v0.11.1-linux-arm64.tar.gz"
      sha256 "9f4285e0f8a98b39b23f8795cd0d8a8da985c5bd841cf0fe4c6671c1c3d821b7"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.11.1/chernabog-v0.11.1-linux-x64.tar.gz"
      sha256 "6d5d50cba44da6db3041817dfb5c6a9be529c6447e0dbc890d2d4733607e4a87"
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
