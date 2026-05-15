class ProxerAT030 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.3.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.3.0/proxer-macos-arm64"
      sha256 "68173b0fca94dcc611ccd0403992f05047a0453f7046fd3f35b4d61779ae85f8"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.3.0/proxer-macos-x64"
      sha256 "e56c2789fd7a68b658862c4104d4de7e4cd45e33061135e9ed1aabe21213b9f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.3.0/proxer-linux-x64"
      sha256 "88c09dcc3d500781c63f29a89b54cafb32471a5d5e7aa551d65bf243bf56597a"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.3.0/proxer-linux-arm64"
      sha256 "268c319fdcfab30464882b38983617299b6a7abcd002ca906bbdd4e49e2766ea"
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
