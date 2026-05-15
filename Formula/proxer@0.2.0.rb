class ProxerAT020 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.2.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.2.0/proxer-macos-arm64"
      sha256 "8db63758aef0f8df786c70d3f901d25e324ca816f010c63e853caddf15a9db4d"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.2.0/proxer-macos-x64"
      sha256 "10e103d3019c7c01ebe120c90948b240d62b63381ad28b4746cc8e28278c72f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.2.0/proxer-linux-x64"
      sha256 "5242226f6b1fbba2af77c185c5ffdcfe464f0a88a28d840dd34a1e4c2c4e4c9f"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.2.0/proxer-linux-arm64"
      sha256 "451d560dd5037b6b86c8186c410db2e4989bd39a3ca9c3376b88a41825d07b87"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "proxer-macos-arm64" => "proxer"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "proxer-macos-x64" => "proxer"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "proxer-linux-x64" => "proxer"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "proxer-linux-arm64" => "proxer"
    end
  end

  test do
    system "#{bin}/proxer", "--version"
  end
end
