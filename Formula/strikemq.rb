class Strikemq < Formula
  desc "Sub-millisecond Kafka-compatible message broker for development and testing"
  homepage "https://github.com/awneesht/Strike-mq"
  url "https://github.com/awneesht/Strike-mq/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "dde3857e900c279da7cfe2ef4766c3384eeb86e56ecba02de0803bbf823c3872"
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
