class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.1/envctl_darwin_arm64.tar.gz"
      sha256 "ea7ec5cc61ec3afb312660fdf6a855d50f095bdd2225c90cf554468e678a8a1a"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.1/envctl_darwin_amd64.tar.gz"
      sha256 "8d1d1008ee2384200210212715ec752fe13c38eaf3056c72dd9cd03c94019f46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.1/envctl_linux_arm64.tar.gz"
      sha256 "d4ba6dcc0e00e523480e36865c32450b2121c823b7dcfede1dd85e551d3b06e9"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.1/envctl_linux_amd64.tar.gz"
      sha256 "d2abcf8fdf50b386fe69360682f9a0bb917bd33b2e7c809860253680a3baa13c"
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
