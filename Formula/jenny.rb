class Jenny < Formula
  desc "Pairwise/N-wise combinatorial test generator (Timefold port of jenny.c)"
  homepage "https://github.com/chas678/jennyj"
  url "https://github.com/chas678/jennyj/releases/download/v1.0.0/jenny.jar"
  sha256 "0efbb8f99ff0e0b508f1d349f81bec1e19dae3148cc885b9fe0f51489ee0ad1e"
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
