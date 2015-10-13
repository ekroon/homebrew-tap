class Libcbor < Formula
  url "https://github.com/ekroon/libcbor/archive/fix-big-endian-test.tar.gz"
  version "0.3.1"
  sha256 "b8f1c25b19664cc550d4173b25393f64561e189145451d025b847fea41523f63"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end
end
