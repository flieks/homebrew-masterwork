class Masterwork < Formula
  desc "Workbench for the skills and subagents your AI coding agents use, with scored simulations"
  homepage "https://masterwork.sh"
  url "https://github.com/flieks/masterwork/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "01e857e2bfe5c1cf9b7473fa241dff90e7473b1b4dfc55fc04ed31ba13eb7572"
  license "Elastic-2.0"

  depends_on "node"
  depends_on "uv"

  def install
    libexec.install Dir["*"]
    # The launcher installs its own backend and frontend dependencies on first run.
    (bin/"masterwork").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/bin/masterwork.mjs" "$@"
    SH
  end

  test do
    # The launcher has no --help; starting servers is not a brew test.
    assert_path_exists libexec/"bin/masterwork.mjs"
  end
end
