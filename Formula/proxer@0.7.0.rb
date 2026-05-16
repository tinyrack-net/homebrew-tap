class ProxerAT070 < Formula
  desc "Reverse tunnel CLI for HTTP, SSE, and WebSocket traffic"
  homepage "https://github.com/tinyrack-net/proxer"
  version "0.7.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.7.0/proxer-macos-arm64"
      sha256 "4013c86d139b28aa1687d9d704676837917e6f95a6ac4ea6609d13949d734695"
    end
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.7.0/proxer-macos-x64"
      sha256 "c11f806dc75df06c3efaf241f26840aac3a22d2b753ffd838d935e91f1ab6e54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.7.0/proxer-linux-x64"
      sha256 "162fa67c4f52672ed3122f560719b07a2a5f5f5a5f050fb9dd1839fb7d9effde"
    end
    on_arm do
      url "https://github.com/tinyrack-net/proxer/releases/download/v0.7.0/proxer-linux-arm64"
      sha256 "e3577a10e22bf0f1cff19a90b5bc71ccddfd90938dfc3a38d15a7fcb3f269cf8"
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
