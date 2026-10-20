# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.5.0/chernabog-v0.5.0-darwin-arm64.tar.gz"
      sha256 "4e9b4bbcb67d7abca16f24953f55b68ee2e9a749afc7f30854b733fe9a9b0231"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.5.0/chernabog-v0.5.0-darwin-x64.tar.gz"
      sha256 "1138e139dab4aa9a7180f5f0dd7e9649b42555b98e1685d10f84d8225cb64597"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.5.0/chernabog-v0.5.0-linux-arm64.tar.gz"
      sha256 "c9242a57441a85a106c0b82cf718eb116beddfe8f95966106147a5382862fa8c"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.5.0/chernabog-v0.5.0-linux-x64.tar.gz"
      sha256 "243e4f32bb02a44fdea9c4c51467197a28ff6fe3e6c374de51c9600d4e497bf6"
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
