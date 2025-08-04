class CommandLibrary < Formula
  desc "TUI application for managing Claude Code custom commands"
  homepage "https://github.com/shel-corp/Claude-command-manager"
  url "https://github.com/shel-corp/Claude-command-manager/archive/v1.0.0.tar.gz"
  sha256 "ec97c7f867e8bf1d657ae91939fd1e2505b424c6a81a9dd392e3cd197468ac09"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"ccm"), "./cmd"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ccm --help")
  end
end