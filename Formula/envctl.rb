class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.0/envctl_darwin_arm64.tar.gz"
      sha256 "f489bc212a62884c0f5e77519797979f0f2e94935d67911e2bf80090da71224e"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.0/envctl_darwin_amd64.tar.gz"
      sha256 "8e1256dde30e69ea27201d4f7dc55ce3476b8332c42c8147340f772e832c6770"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.0/envctl_linux_arm64.tar.gz"
      sha256 "782f7c0eb266c31f0b7ee61b8045aca2fc50c3bbb5d60ccf3e9af03ec7526664"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.0/envctl_linux_amd64.tar.gz"
      sha256 "c9a989cf8671c6ecec7d4f8fe7d63d153b4b12e4e89b5f1d3a72e436b224c990"
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
