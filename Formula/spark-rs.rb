class SparkRs < Formula
  desc "Spark clone"
  homepage "https://github.com/ekroon/spark-rs"
  url "https://github.com/ekroon/spark-rs/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "3c6a16239e3b513dfc4816dec92a1e02f872087b282e8fd5e82209274ad12c4d"
  license ""

  bottle do
    root_url "https://github.com/ekroon/homebrew-tap/releases/download/spark-rs-0.2.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "db9a82a638f8bfb2f057f6dee1be6a0a69732ce0f8f8f514d95911427977d42b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b4c218781a22641b792dab69369a8cc3ddd69e57b0407d8f2ce1351b2a7aefce"
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
