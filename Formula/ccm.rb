class Ccm < Formula
  desc "TUI for managing Claude Code custom commands"
  homepage "https://github.com/shel-corp/Claude-command-manager"
  url "https://github.com/shel-corp/Claude-command-manager/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "1f01a523677ec7fb47046cbecdc16d5c8b1db3c369bf6f7a8edf97a1bed9e210"
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