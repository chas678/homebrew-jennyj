class Jenny < Formula
  desc "Pairwise/N-wise combinatorial test generator (Timefold port of jenny.c)"
  homepage "https://github.com/chas678/jennyj"
  url "https://github.com/chas678/jennyj/releases/download/v0.1.0/jenny.jar"
  sha256 "3ef2d049681175bca17d7715088a7fa527cef03e25a9d26d5adbbbe64f76589c"
  license "MIT"

  depends_on "openjdk"

  def install
    libexec.install "jenny.jar"
    bin.write_jar_script libexec/"jenny.jar", "jenny", java_version: "26"
  end

  test do
    assert_match "jenny #{version}", shell_output("#{bin}/jenny --version")
    # Smoke test the solver: -n2 over three binary dimensions must emit test rows.
    assert_predicate shell_output("#{bin}/jenny -n2 2 2 2").lines.count, :positive?
  end
end
