class Strikemq < Formula
  desc "Sub-millisecond Kafka-compatible message broker for development and testing"
  homepage "https://github.com/awneesht/Strike-mq"
  url "https://github.com/awneesht/Strike-mq/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "6f12f6a116910dce49f024c940181f3376c35bc55cbdd61536a189b1a78662a8"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DBUILD_TESTS=OFF",
           "-DBUILD_BENCHMARKS=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_predicate bin/"strikemq", :exist?
  end
end
