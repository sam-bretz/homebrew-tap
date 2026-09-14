class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.3/envctl_darwin_arm64.tar.gz"
      sha256 "011875ec8ac138a5dcc97e8beb4e7993e9519be348440dbc779772e967e18eac"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.3/envctl_darwin_amd64.tar.gz"
      sha256 "bb2b499bd76d45b69161891dea31f53a1d3740eb8dfe517bb54f89e7b9c1a342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.3/envctl_linux_arm64.tar.gz"
      sha256 "fab4e499dd37739657c32b35448d9fd322436e00472a947d718b934f5d3f6e4e"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.3/envctl_linux_amd64.tar.gz"
      sha256 "df3ca499ad152bb23d2deb571f236a620b19770786511af224365ae6e4922c77"
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
