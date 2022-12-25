class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "97149f6fd449f7ca6f7ad8b0a390171ef7e208a8821698498205f936085d7ea7"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "3d5316a74b3c565b51ee1f3fcb5b042be1f13a200d368de4bfbd1fffda041296"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7e134e669b1bbc2a885b5d09f49c7688ca3eebb53e46a98e09d235e9357d4ce2"
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
