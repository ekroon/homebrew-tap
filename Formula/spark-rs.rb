class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3ab0b35f51d80c346ab106cbcff98995276a03c0446012ca781081bd3c56c57f"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.2.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "883bbec0caa542ae64e0918bc3e233331ed2982bab3551cd3e41dd3cd53e5279"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f9d87b39f680b5c6c2a5edf5e04fdd082359ef69d703780e0b805afae778505a"
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
