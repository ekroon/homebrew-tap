class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "990921776c85668e106b5cec02a635d47a199470aa51871f3fbb98f041a36406"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.1.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "5fb53feca04c3c41c4464d2451c95c58de1a298f947eff6ad3c03e7ded5a67b6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d5c9b050648290f99cda4d6981b7d70d32d0fb52d4ebdb12fe2dc56330e6d631"
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
