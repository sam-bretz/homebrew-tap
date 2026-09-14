class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.4"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.4/envctl_darwin_arm64.tar.gz"
      sha256 "3573c68c24ce98b3cc0a370427194ffa058b79810c362d3aa6f2ff9b45576a91"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.4/envctl_darwin_amd64.tar.gz"
      sha256 "8a5b27f1421d7824c7af419b7aafe9a824889e8de8ffaba558cb26e424838c80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.4/envctl_linux_arm64.tar.gz"
      sha256 "d04dbb178b14c292d1291b697b5e5063972da14b8df613ebc34446682a3fa560"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.4/envctl_linux_amd64.tar.gz"
      sha256 "23b1d0802c56c2ccbf7622898a5eccd8c5591bcf248aeabe699d23accc20b343"
    end
  end

  depends_on "lima"

  def install
    bin.install "envctl", "envctl-worktree-create", "envctl-worktree-remove"
    pkgshare.install "skill"
  end

  def caveats
    <<~EOS
      envctl needs Docker with the compose plugin (OrbStack, Docker Desktop or Colima).
      The Claude Code worktree hooks need jq.
      Workflow agents need long-lived credentials (claude setup-token, a Codex
      access token, or an API key). Setup guide:
        https://github.com/sam-bretz/envctl/blob/main/docs/src/content/docs/install.mdx
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envctl --version")
  end
end
