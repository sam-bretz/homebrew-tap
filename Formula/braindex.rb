class Braindex < Formula
  desc "Local knowledge retrieval with citations for coding agents"
  homepage "https://github.com/sam-bretz/braindex"
  version "0.1.0-rc.4"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/sam-bretz/homebrew-tap/releases/download/braindex-v0.1.0-rc.4/braindex_v0.1.0-rc.4_darwin_arm64.tar.gz"
    sha256 "da9f6899eb472d491a597eeaf727546301c8a3b564fab4381065e8d3ef8ff203"
  end

  on_intel do
    url "https://github.com/sam-bretz/homebrew-tap/releases/download/braindex-v0.1.0-rc.4/braindex_v0.1.0-rc.4_darwin_amd64.tar.gz"
    sha256 "c2692d49c7a74b9caf793b6b5052f98262aa221068993cd1805179f198b18807"
  end

  def install
    bin.install "braindex"
  end

  test do
    assert_match "Reopened source:", shell_output("#{bin}/braindex demo")
  end
end
