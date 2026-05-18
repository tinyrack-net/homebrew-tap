class ProxerAT0110 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.11.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.11.0/proxer-macos-arm64"
      sha256 "92e7198ce7a92f81bb62e636aaab3964b35051db919d39c12ec0a3318883c4cb"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.11.0/proxer-macos-x64"
      sha256 "352c2a6196a22f5efd259b88c6c829b54d0f5f467ca8b5b7dd2cb638af9e19c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.11.0/proxer-linux-x64"
      sha256 "6edfd06385ebbc7ba30efcd1622870aded31082912a1f1159df733a0089ef0c9"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.11.0/proxer-linux-arm64"
      sha256 "9ead6f797d9b141d61268d7d971411bce28e023c90eb2789f62b84b4b755727f"
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
