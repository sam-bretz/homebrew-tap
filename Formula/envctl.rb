class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.6"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.6/envctl_darwin_arm64.tar.gz"
      sha256 "4a7fab840419661754d758795a1b260f347db8b158090b709c4fe426efa655c2"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.6/envctl_darwin_amd64.tar.gz"
      sha256 "41e55dbed0768a529db2a697fb6615787ed3c44a9af579381e7548de80f31c9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.6/envctl_linux_arm64.tar.gz"
      sha256 "202ad1a3e0a0edb23ba4ac7ddfd86462c4faca4dd74eec330c0b942231b63f17"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.6/envctl_linux_amd64.tar.gz"
      sha256 "52e91dd53231658dcfa79ee22397486ef051fac63b2e5001a1b9f1310b4c575f"
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
