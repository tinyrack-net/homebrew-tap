class CoderCli < Formula
  desc "Command line that hosts and administers a Tinyrack Coder daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.6.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.6.0/coder-cli-macos-x64.tar.gz"
      sha256 "a908db7f13d43ca8f4058562f9e313188ed3e9c85d066943ded201dd27b5e5f9"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.6.0/coder-cli-macos-arm64.tar.gz"
      sha256 "df33cac4d00edf4d9c2dfb050cec47546f4c8d894e003edc42c402ddaedb19e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.6.0/coder-cli-linux-x64.tar.gz"
      sha256 "bd2d9afde1a8fbc5cb51a07ede2e79e3acc6ab4c46da46d946d70e6593d8be03"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/coder-cli"
  end

  test do
    system "#{bin}/coder-cli", "--version"
  end
end
