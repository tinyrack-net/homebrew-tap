class ProxerAT0142 < Formula
  desc "Self-hosted reverse tunnel for HTTP, SSE, and WebSocket services"
  homepage "https://proxer.tinyrack.net"
  version "0.14.2"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.2/proxer-macos-x64"
      sha256 "159e1469f2b09dd8f95fc5519cee6d84d3185e898d3ca479c707ed7b1c7f4efd"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.2/proxer-macos-arm64"
      sha256 "e8257cca9f035d23db986922930432b9f9c6f2c0345a5d357e1a306866324855"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.2/proxer-linux-x64"
      sha256 "7821444ede96cd60e185a04816b13dcb8fb80aa82f7f1d44f522a151a4e8bdf8"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.2/proxer-linux-arm64"
      sha256 "a8d98a55cc1e7a9854e8acd7b8618d3ce155dfc1161f097c3e0717131a93522a"
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
