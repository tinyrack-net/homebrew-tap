class ProxerAT090 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.9.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.9.0/proxer-macos-arm64"
      sha256 "3a3bcf3b5da6af580c7e9a7e27f09d6d09a2f41c1b44ae3c5a6530b3fbd15e45"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.9.0/proxer-macos-x64"
      sha256 "d89f9b529e6f1bc8414c3a4975043976ce441ca20e88288068b831abcbf57208"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.9.0/proxer-linux-x64"
      sha256 "5bbebe8c66ae91b64d9116db962640ee3e87f10e0b6cf32a759cd447a73ada6e"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.9.0/proxer-linux-arm64"
      sha256 "87c6dc3eed1f626fc24323212a8d4e5d5622d375997a3116d380d01e56103a9f"
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
