class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.7"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.7/envctl_darwin_arm64.tar.gz"
      sha256 "5bda8f5b1f6b7cf22ca86412f995e6350714cbd8fef1bb748a8efaac96c865d9"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.7/envctl_darwin_amd64.tar.gz"
      sha256 "477806bfdb6b3995f063a55da0ba7f6b0dfa0522a6593fdf3fa1d06388a94f48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.7/envctl_linux_arm64.tar.gz"
      sha256 "ba7f7214d939b3e4ec87de03092d9c1e2e0bbbdfced23693d065b56faa2fd33a"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.7/envctl_linux_amd64.tar.gz"
      sha256 "9c6230cb7ee97151588b0a9ab02c7354261cf03c59efbc52221f2f7fd419d57a"
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
