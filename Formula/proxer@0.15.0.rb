class ProxerAT0150 < Formula
  desc "Self-hosted reverse tunnel for HTTP, SSE, and WebSocket services"
  homepage "https://proxer.tinyrack.net"
  version "0.15.0"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.15.0/proxer-macos-x64"
      sha256 "613dfa47c9b821ee0ee6d7a88b6b1e742cddbfbe8fca492622131ce9fd369431"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.15.0/proxer-macos-arm64"
      sha256 "afbfbd3126056bed203fba1db399fc8d572f29ed27f8b04c1ff517a783b75845"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.15.0/proxer-linux-x64"
      sha256 "1425b1718512f45b02a5a27ca80a6aa2d272851166ac52c6f06f59190e12d1d0"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.15.0/proxer-linux-arm64"
      sha256 "021169dffe291ca9c61d4bda8ac20c7acfdc082b3abff6efcc202eb3318d3d86"
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
