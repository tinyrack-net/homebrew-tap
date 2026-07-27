class ProxerAT0140 < Formula
  desc "Self-hosted reverse tunnel for HTTP, SSE, and WebSocket services"
  homepage "https://proxer.tinyrack.net"
  version "0.14.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.0/proxer-macos-arm64"
      sha256 "0d66e11c22d532231ba75011af9d77c0723def5453a6015352d561116383dd66"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.0/proxer-macos-x64"
      sha256 "dd440156eb122fe51843219a862aabc394be49e7d378662bc580bc1872a88f6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.0/proxer-linux-x64"
      sha256 "873539cc20d715e89f3b563b7c3b241cdd49038add9cf3eeeffff070cc9e3a38"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.0/proxer-linux-arm64"
      sha256 "2dcbf8f0a09389199e9d780de2a9ae3c491e6397fe01941e9039967539af02a4"
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
