class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.2.0/envctl_darwin_arm64.tar.gz"
      sha256 "26d45aa40434d49d6c7882ca6afb2470e17728d9fef337ca89ffd458bbd9d791"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.2.0/envctl_darwin_amd64.tar.gz"
      sha256 "d6324f184066eaf5163ddd7ee33fbdebb6829eae7881f9195638585d0c73b0c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.2.0/envctl_linux_arm64.tar.gz"
      sha256 "217476a0cf5a62d5e3f3a3e3f7ec8493d3f9d81e8ee29427749f1e103151cc1b"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.2.0/envctl_linux_amd64.tar.gz"
      sha256 "c9d8025e80301d8142b7eeae4d4b614b05243305c31d270c9e30594cba434f1c"
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
