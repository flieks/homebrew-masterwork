class Masterwork < Formula
  desc "Workbench for the skills and subagents your AI coding agents use, with scored simulations"
  homepage "https://masterwork.sh"
  url "https://github.com/flieks/masterwork/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "1291f459cd6fef786d63bf1637be7bc0b1415a081563e3462afd0c393c6885c6"
  license "Elastic-2.0"

  depends_on "node"
  depends_on "uv"

  def install
    libexec.install Dir["*"]
    # The launcher installs its own backend and frontend dependencies on first run.
    (bin/"masterwork").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/masterwork.mjs" "$@"
    SH
  end

  test do
    # The launcher has no --help; starting servers is not a brew test.
    assert_predicate libexec/"bin/masterwork.mjs", :exist?
  end
end
