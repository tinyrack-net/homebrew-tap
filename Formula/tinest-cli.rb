class TinestCli < Formula
  desc "Command line that hosts and administers a Tinest daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.11.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.11.0/tinest-cli-macos-x64.tar.gz"
      sha256 "c5c4bd353de5903ca858633eb79daa8365182301dd23e4f504247ba434c8f927"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.11.0/tinest-cli-macos-arm64.tar.gz"
      sha256 "e9fbc4bd6fa256251390792ccf81ea65e2a0d8edf7ef4d57adb8f3534c135739"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.11.0/tinest-cli-linux-x64.tar.gz"
      sha256 "e29e5ca522b1e49b0208037e8a08c855de37f1e153f46ee4f1cfb3ef64141c93"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tinest-cli"
  end

  test do
    system "#{bin}/tinest-cli", "--version"
  end
end
