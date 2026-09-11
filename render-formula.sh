#!/usr/bin/env bash
# Render Formula/envctl.rb for one envctl release tag from its checksums.txt.
# Usage: ./render-formula.sh v0.2.0 checksums.txt > Formula/envctl.rb
set -euo pipefail
tag="$1"
checksums="$2"
version="${tag#v}"
sha() {
  local value
  value=$(awk -v f="envctl_$1.tar.gz" '$2 == f { print $1 }' "$checksums")
  [[ "$value" =~ ^[0-9a-f]{64}$ ]] || { echo "missing checksum for envctl_$1.tar.gz" >&2; exit 1; }
  printf '%s' "$value"
}
base="https://github.com/sam-bretz/envctl/releases/download/$tag"
cat <<EOF
class Envctl < Formula
  desc "Isolated Compose environments per branch and checkpointed agent workflows"
  homepage "https://github.com/sam-bretz/envctl"
  version "$version"

  on_macos do
    on_arm do
      url "$base/envctl_darwin_arm64.tar.gz"
      sha256 "$(sha darwin_arm64)"
    end
    on_intel do
      url "$base/envctl_darwin_amd64.tar.gz"
      sha256 "$(sha darwin_amd64)"
    end
  end

  on_linux do
    on_arm do
      url "$base/envctl_linux_arm64.tar.gz"
      sha256 "$(sha linux_arm64)"
    end
    on_intel do
      url "$base/envctl_linux_amd64.tar.gz"
      sha256 "$(sha linux_amd64)"
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
EOF
