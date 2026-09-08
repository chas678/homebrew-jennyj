class Jenny < Formula
  desc "Pairwise/N-wise combinatorial test generator (Timefold port of jenny.c)"
  homepage "https://github.com/chas678/jennyj"
  url "https://github.com/chas678/jennyj/releases/download/v1.0.2/jenny.jar"
  sha256 "301dc821edb831ff48d6f439b1f49ee86b6f49eb04cc89bdf8d353486bbf8df7"
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
