class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "0ed8613deeebffd00977a0fe2ac42b43915241a971fcad7fd094dae1c5308408"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "2a4d368ad1793237f7d48f239cd9374c472ce966689004a434a5b79a1e722236"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2253140345cc7bca10532c305dec5b8ffc36a177a57709956795287bb2c6de37"
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
