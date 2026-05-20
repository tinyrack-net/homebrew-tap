class ProxerAT0120 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.12.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.12.0/proxer-macos-arm64"
      sha256 "2c7a7d21600f388c69e0093a92dfd5b4c489ee443affd5300f8cfbdcaf400eea"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.12.0/proxer-macos-x64"
      sha256 "cb4baa3b6a1ae56de46a9163c942509c042763b6e378822bdf260b96119005fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.12.0/proxer-linux-x64"
      sha256 "a0f54fc95a698ead79a9fa88f09434424ce62bacb013d9996018337fcde5974c"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.12.0/proxer-linux-arm64"
      sha256 "5751c396cfedd09531ddf43901fd82551c88314d1d3c418ffd6f0799fa777f26"
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
