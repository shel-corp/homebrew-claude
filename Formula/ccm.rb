class Ccm < Formula
  desc "TUI for managing Claude Code custom commands"
  homepage "https://github.com/shel-corp/Claude-command-manager"
  url "https://github.com/shel-corp/Claude-command-manager/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "fd178bc30f69f763a7dcf9967892a7637e94a4290cce4a2f9a26129b63e6d490"
  license "MIT"
  head "https://github.com/shel-corp/Claude-command-manager.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"ccm"), "./cmd"
  end

  test do
    assert_match "Claude Command Manager", shell_output("#{bin}/ccm help")
    assert_match "Usage:", shell_output("#{bin}/ccm help")
  end
end