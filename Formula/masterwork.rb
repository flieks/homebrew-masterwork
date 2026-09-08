class Masterwork < Formula
  desc "Workbench for the skills and subagents your AI coding agents use, with scored simulations"
  homepage "https://masterwork-site.vercel.app"
  url "https://github.com/flieks/masterwork/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "faa4b769a3c60711a5b1c0676e95424615073aab3f4f9855e43ceb254ce19000"
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
