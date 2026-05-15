class ProxerAT010 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.1.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.1.0/proxer-macos-arm64"
      sha256 "caa62deee13a825fde9d2095d44d3b4a9fb61d2f19cbaa6fcda3dcb8f0b05d78"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.1.0/proxer-macos-x64"
      sha256 "0e9cab38f1a1e56d3e11e14163f57f26a8679d108076ba6576f58c8926d30c74"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.1.0/proxer-linux-x64"
      sha256 "5dcda9975ea145fbefcb00aad1b3d9402553d28cda2ee10a4050d932bbf0b3fb"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.1.0/proxer-linux-arm64"
      sha256 "56777bfb887558ebf62db3b95027e565a8dbc8b3c6a5f70c8d09fe76bb546b0d"
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
