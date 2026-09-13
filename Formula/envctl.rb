class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.1/envctl_darwin_arm64.tar.gz"
      sha256 "929268b699ce77d5db0d75539d5185d802f830fc04de6ed76a9ea896031498be"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.1/envctl_darwin_amd64.tar.gz"
      sha256 "9e516278cf8d7e3782ee403afe920f36b9e09e7d9c30ea7cdfc34a1c85213acb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.1/envctl_linux_arm64.tar.gz"
      sha256 "aa112567655798967e4b0d51d334ebd14489234e16b3d6948c6956b98097c05e"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.1/envctl_linux_amd64.tar.gz"
      sha256 "fade8ebd4a3a58d371e7b11778360141cb3fe6790960574440cd22e9df5cc65f"
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
