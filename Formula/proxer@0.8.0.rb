class ProxerAT080 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.8.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.8.0/proxer-macos-arm64"
      sha256 "b77dc711bdadb873f54fe725efad440e6b1e6cd863416ea57825289983d6ecaf"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.8.0/proxer-macos-x64"
      sha256 "1f3659d78ed8c0df99e122d75d5970710a6b78bdf7ffbacff3d8c1fa9e17dba9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.8.0/proxer-linux-x64"
      sha256 "b19c461d47bc760ef4539b9294505652d3aa751a7586f60d8a31b963ef66ed27"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.8.0/proxer-linux-arm64"
      sha256 "865d7e419a2e816f67c9bf9bc2145486f6364d4f3e3cb62d2634d9467dc84f66"
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
