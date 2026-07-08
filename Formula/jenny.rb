class Jenny < Formula
  desc "Pairwise/N-wise combinatorial test generator (Timefold port of jenny.c)"
  homepage "https://github.com/chas678/jennyj"
  url "https://github.com/chas678/jennyj/releases/download/v1.0.0/jenny.jar"
  # PLACEHOLDER: v1.0.0 has not been tagged/released yet. Once it is, compute the
  # real digest and replace this line before marking the PR ready for review:
  #   curl -sL https://github.com/chas678/jennyj/releases/download/v1.0.0/jenny.jar | shasum -a 256 | cut -d' ' -f1
  sha256 "REPLACE_WITH_SHA256_AFTER_v1.0.0_RELEASE"
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
