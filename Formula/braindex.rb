class Braindex < Formula
  desc "Local knowledge retrieval with citations for coding agents"
  homepage "https://github.com/sam-bretz/braindex"
  version "0.1.0-rc.6"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/sam-bretz/homebrew-tap/releases/download/braindex-v0.1.0-rc.6/braindex_v0.1.0-rc.6_darwin_arm64.tar.gz"
    sha256 "eba72e4e091cc5d0cd655ad5e890e13d9815cb76e574916339eef58695c8b60c"
  end

  on_intel do
    url "https://github.com/sam-bretz/homebrew-tap/releases/download/braindex-v0.1.0-rc.6/braindex_v0.1.0-rc.6_darwin_amd64.tar.gz"
    sha256 "087669e24225894b0e1ba4942a0f93f51adf17b4402b6052ec4340b6d1b7eaa7"
  end

  def install
    bin.install "braindex"
  end

  test do
    assert_match "Reopened source:", shell_output("#{bin}/braindex demo")
  end
end
