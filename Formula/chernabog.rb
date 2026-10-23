# Written by dataquail/chernabog's release workflow (scripts/homebrew-formula.ts).
# Edits here are overwritten by the next release.
class Chernabog < Formula
  desc "Spends spare coding-agent capacity on queued work across your repos"
  homepage "https://github.com/dataquail/chernabog"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.9.0/chernabog-v0.9.0-darwin-arm64.tar.gz"
      sha256 "2e8e6c6055eb9483c8aa469519839e4a2a2a6dfd375bbe8e769968da8d375ce3"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.9.0/chernabog-v0.9.0-darwin-x64.tar.gz"
      sha256 "d36516e06fe6e5a50b9b67183dc3ea3a76e93a928e92b45533afc120b4bfabaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataquail/chernabog/releases/download/v0.9.0/chernabog-v0.9.0-linux-arm64.tar.gz"
      sha256 "c9bdc55a4bb0c035b0ce5ee2b19c9f9fade67092942a28d4dd24baa7735969a8"
    end
    on_intel do
      url "https://github.com/dataquail/chernabog/releases/download/v0.9.0/chernabog-v0.9.0-linux-x64.tar.gz"
      sha256 "a67ab02b48f02d582204862a40ed36acabcc75b135972bfa2fbc03233bd67550"
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
