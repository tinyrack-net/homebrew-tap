class ProxerAT0130 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.13.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.13.0/proxer-macos-arm64"
      sha256 "6fa5129a4c36dc172c5e38717644272c0f20890612d6b3f77af6c7a2b4a70712"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.13.0/proxer-macos-x64"
      sha256 "0b747c0f0b9c2418bf86c9ca90d5ef958f8a0b2584664792c9ac2d8314363d66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.13.0/proxer-linux-x64"
      sha256 "2b240c8f751a755fe6355fdab7782fe06e158fc6da9320b4dfca2c1958c52242"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.13.0/proxer-linux-arm64"
      sha256 "7206d4d340bc513e422f3e4b3e2a0709270f20c5c973ee7de786621db4c8bd6b"
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
