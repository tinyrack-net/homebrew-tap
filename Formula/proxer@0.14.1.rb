class ProxerAT0141 < Formula
  desc "Self-hosted reverse tunnel for HTTP, SSE, and WebSocket services"
  homepage "https://proxer.tinyrack.net"
  version "0.14.1"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.1/proxer-macos-arm64"
      sha256 "fe0a89aa392674d58d51f19fca93e6cc6d8ea708d949f9987c2fff695eccd726"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.1/proxer-macos-x64"
      sha256 "4a63cc0506ce77978b3c8f7ec5184e1ac36b3ef56301dd6ee22e4bf8d5558857"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.1/proxer-linux-x64"
      sha256 "25859f85d70acb99bc68151f1b27be5a4c61288f88baa8031ba1372b9e40b721"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.14.1/proxer-linux-arm64"
      sha256 "d07783ce7c0a92d66bc84edd36aa7bdb405979c9f618a8e3e3030232df2d49c2"
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
