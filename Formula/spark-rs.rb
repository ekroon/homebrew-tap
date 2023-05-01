class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "698643f9e6834bff90a0348d392bec31b70dd3a7619de33df228b1d0de2ee413"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.6.3"
    sha256 cellar: :any_skip_relocation, monterey:     "7b97b6e322e4410242dd04b5bee480ccfd78bccdae184de08f17b76624ade318"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ae7c26d5e2f77244c5e71ae96ac07cf759b4bade7cc5019f6a3143f66f1cc977"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test spark-rs`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_equal "abc", shell_output("#{bin}/spark --ticks abc 1 2 3").strip
  end
end
