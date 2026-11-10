cask "braindex" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0-rc.4"
  sha256 arm:   "da9f6899eb472d491a597eeaf727546301c8a3b564fab4381065e8d3ef8ff203",
         intel: "c2692d49c7a74b9caf793b6b5052f98262aa221068993cd1805179f198b18807"

  url "https://github.com/sam-bretz/homebrew-tap/releases/download/braindex-v#{version}/braindex_v#{version}_darwin_#{arch}.tar.gz"
  name "Braindex"
  desc "Local knowledge retrieval with citations for coding agents"
  homepage "https://github.com/sam-bretz/braindex"

  depends_on :macos

  binary "braindex"
end
