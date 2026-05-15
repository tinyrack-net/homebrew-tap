class ProxerAT005 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.0.5"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.5/proxer-macos-arm64"
      sha256 "b51f6e7ba29d3c3da505f7df5b8524469d9db3757020af0298e1f9bcf8d10d02"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.5/proxer-macos-x64"
      sha256 "330ecc1db9f4e409874d81cfb2eb233bc4992df786d146b306e32c7b2b5af6e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.5/proxer-linux-x64"
      sha256 "8ab42579ea6f9f532f56fea2e7583f6b6ce7f112e7bb5a689ed5bec9827ee9a2"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.0.5/proxer-linux-arm64"
      sha256 "b88319cf93b3a833eb097087fcfdd8938baf6ba3952ed265149f9d471d260a4a"
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
