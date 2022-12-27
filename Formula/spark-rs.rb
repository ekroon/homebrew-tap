class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "97149f6fd449f7ca6f7ad8b0a390171ef7e208a8821698498205f936085d7ea7"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.4.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "42b2f74fb582281ca092d9ef436ec1176c0b1e4fe46974890c4518ecadd79cfa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "314ba281d46539f15279c6eccc5f86e04c81893937689a6e009080a22e472f9d"
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
    assert_equal "▁▄█", shell_output("#{bin}/spark 1 2 3").strip
  end
end
