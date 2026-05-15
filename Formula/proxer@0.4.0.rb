class ProxerAT040 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.4.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.4.0/proxer-macos-arm64"
      sha256 "4f6fdf1fcb70f54601943e2f3ebcf61c90ac74a854afed1b61498b361d9f79e1"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.4.0/proxer-macos-x64"
      sha256 "327193c8db305d867c51271ef37e92af83ca1343344c5d88e5a390745fa653f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.4.0/proxer-linux-x64"
      sha256 "0ca547c8fe286bcbceed2df5d35aafd6123f0e1d834697fc653efe0eb30568fd"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.4.0/proxer-linux-arm64"
      sha256 "c2ead83cd5fefd7460d66bed06d86135ab733ded9def25e110b31a34cbe7be24"
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
