class Braindex < Formula
  desc "Local knowledge retrieval with citations for coding agents"
  homepage "https://github.com/sam-bretz/braindex"
  version "0.1.0-rc.5"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/sam-bretz/homebrew-tap/releases/download/braindex-v0.1.0-rc.5/braindex_v0.1.0-rc.5_darwin_arm64.tar.gz"
    sha256 "e8cfb435aded600cbb444053d30e585426ab2b35f687e9148bfded3e89d7a4c5"
  end

  on_intel do
    url "https://github.com/sam-bretz/homebrew-tap/releases/download/braindex-v0.1.0-rc.5/braindex_v0.1.0-rc.5_darwin_amd64.tar.gz"
    sha256 "b707035e2d4530aa282d7d0ef263d20e69480899a5192f389be982c78d8f1c2f"
  end

  def install
    bin.install "braindex"
  end

  test do
    assert_match "Reopened source:", shell_output("#{bin}/braindex demo")
  end
end
