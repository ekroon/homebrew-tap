class SparkRsPrebuilt < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  on_macos do
    url "https://github.com/ekroon/spark-rs/releases/download/v0.6.2/spark-v0.6.2-macos.tar.gz"
    sha256 ""
  end
  on_linux do
    url "https://github.com/ekroon/spark-rs/releases/download/v0.6.2/spark-v0.6.2-linux.tar.gz"
    sha256 ""
  end
  license ""

  def install
    libexec.install Dir["*"]
    bin.install_symlink("#{libexec}/spark" => "spark")
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
