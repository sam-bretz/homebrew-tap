class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "0.4.8"

  on_macos do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.8/envctl_darwin_arm64.tar.gz"
      sha256 "d1fa551c3362c9b452e572373c5d5e1dc125de070a69595803b87464fd3a3657"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.8/envctl_darwin_amd64.tar.gz"
      sha256 "d06074bc8524ee9cbad591fd39e2a07151850087271ec0c2f216c5374ef50fff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.8/envctl_linux_arm64.tar.gz"
      sha256 "de1b1085ad56409f61e31d8f8dee54e1e50a81ac89e9cfe05978d179bf297d24"
    end
    on_intel do
      url "https://github.com/sam-bretz/envctl/releases/download/v0.4.8/envctl_linux_amd64.tar.gz"
      sha256 "28dc9f2adebc67fe2028d6051f774b248f061d0b3a09e48541aa7be3841969f4"
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
