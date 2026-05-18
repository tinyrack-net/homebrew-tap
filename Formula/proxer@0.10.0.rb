class ProxerAT0100 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.10.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.10.0/proxer-macos-arm64"
      sha256 "a60725ca1304cbccbc4c28a5f3ab8af02f169ab73a923a75022c9cf9a868e8ea"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.10.0/proxer-macos-x64"
      sha256 "99f8ae7e9c301778a1346a42413928dcfdc9cc7e532250e9f7b4d42e6237559a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.10.0/proxer-linux-x64"
      sha256 "4ae76f46d795041936096d005b36512cd5dcaf87dc5d2696d454ab80a00d0ab0"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.10.0/proxer-linux-arm64"
      sha256 "b29aaf55b57e90b60cb0fa7b7a25db5ecfdf12f2b1150f84a47436b270f5e60d"
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
