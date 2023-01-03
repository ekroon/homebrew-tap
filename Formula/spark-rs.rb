class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "d06d1b30d519c614125ce6564404d1481673795eb6b0366787732b9b8be60d23"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.6.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "e6b6a2f329dc5263828b7edd7f4edb66998bc3436847ccf3b6f3d056c7737eac"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5e22277a0dc8ab911f8c143e5dc8c779c90122dbb9fcc5330308ee42906347bc"
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
