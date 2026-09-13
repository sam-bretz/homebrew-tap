class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.0/envctl_darwin_arm64.tar.gz"
      sha256 "0128fad14da0a8d871a7cbd3c64cde558edac2d16d0f0f7114f4d1a167723670"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.0/envctl_darwin_amd64.tar.gz"
      sha256 "d03df86918afa417d080dbbb0c7f9c379ee1522c2633f36fab90f4a78836a15d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.0/envctl_linux_arm64.tar.gz"
      sha256 "c8f55422b29b0e0fa05eae7dab0165aeb9b2f001e5a6913ad5a8a1dbc0393833"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.3.0/envctl_linux_amd64.tar.gz"
      sha256 "fab5a110d01df33d7dbca9718b1fa1dc0eef6112ee4b93880f94c39f0c5c4a02"
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
