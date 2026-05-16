class ProxerAT060 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.6.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.6.0/proxer-macos-arm64"
      sha256 "a34daf5b5daf19a1b8efd0d53d367ea8d956f7d5e0239cfeb9f0090952fa3acc"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.6.0/proxer-macos-x64"
      sha256 "eaa9d501c74d270675f0bb260f4cddd784a6b253f7f517320853816382945214"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.6.0/proxer-linux-x64"
      sha256 "19005b7dab860b07beeec40791d5d7b9e4107ecc75b58b372cc01b20208251ba"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.6.0/proxer-linux-arm64"
      sha256 "94cb024cf4db1947c21b9b316be0cf0f692327550b737831ffdcdf242b362fea"
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
