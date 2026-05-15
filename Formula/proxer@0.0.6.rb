class ProxerAT006 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.0.6"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.6/proxer-macos-arm64"
      sha256 "39e71aa5b33954f2703c267c576a8657338386270c72830ae96e69ba8c8fc6f6"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.6/proxer-macos-x64"
      sha256 "d556c280d58d19cb09b55bf2881fb3ce0c5ff2a042576f0594f727a98a9ae00b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.6/proxer-linux-x64"
      sha256 "735ffd8c91f0d828dbc6918525b634a3ba31f5218456f951a79876f6ff55593c"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.6/proxer-linux-arm64"
      sha256 "2aee28babb48192c6ba639c1267342e817ac717dbf8a8ca004168d1d41032949"
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
