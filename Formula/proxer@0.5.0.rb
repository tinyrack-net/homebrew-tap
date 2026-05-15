class ProxerAT050 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.5.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.5.0/proxer-macos-arm64"
      sha256 "3d5331aef5b7d25eba54b96b1d80debeed1880c1f3948d9aee03b67d7a0ec144"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.5.0/proxer-macos-x64"
      sha256 "97570a286782d485cac6ba6894969d3bc090d6d27a475d9d07ccdca08d52e2d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.5.0/proxer-linux-x64"
      sha256 "d6bdcd266952c3cb3d8818b8d3fd2c7cfde79bb801d7b3f0afd739efe2a6d5aa"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.5.0/proxer-linux-arm64"
      sha256 "a67176bbbb3a620fc6f64b808fd45231b6eca50a921281655184ad09a3174643"
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
