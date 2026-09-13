class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.2/envctl_darwin_arm64.tar.gz"
      sha256 "ba25e49d1a83175a0f056ee63544f518f729e8f89e3400b13b275791cef707dd"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.2/envctl_darwin_amd64.tar.gz"
      sha256 "15efcedbcda4825a3f8c6496a9fde8a5c23553975378224f90376cc3679d489e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.2/envctl_linux_arm64.tar.gz"
      sha256 "89ffd85a1d094312ded59575174b526d27d377db00e628dd7285bf8a88830a29"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.2/envctl_linux_amd64.tar.gz"
      sha256 "8d3ad98c704878f0bfdb1bc9ca5a42900fad939f7791cb1b1cd6c25f59a167f7"
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
