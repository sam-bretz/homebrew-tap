class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.5"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.5/envctl_darwin_arm64.tar.gz"
      sha256 "21a4819c1ce136e92cb5cc6423c5ed464404a8d4a3c410a79a0dff55a8566d44"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.5/envctl_darwin_amd64.tar.gz"
      sha256 "ac0cad3f2221e471fa8292925c402ca2ba1a69ba2c8025bb318247072484bab9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.5/envctl_linux_arm64.tar.gz"
      sha256 "ae2cecdcb0c2c0ae954e06a044a5aac1b4dcf8dd7bc89b3e86e8289399a94793"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.5/envctl_linux_amd64.tar.gz"
      sha256 "2a21977342b69bc37997f8732dc950864d2748d1c0b6aaec168da88f49b3a26b"
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
