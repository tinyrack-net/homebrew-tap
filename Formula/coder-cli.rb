class CoderCli < Formula
  desc "Command line that hosts and administers a Tinyrack Coder daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.2.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.2.0/coder-cli-macos-x64.tar.gz"
      sha256 "db65f5e8c5d0b0ccb26cf17dbd56dfecb43d14231ed2630ecdfc5719ba4b70eb"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.2.0/coder-cli-macos-arm64.tar.gz"
      sha256 "65fa8122f5bd2773cf4887da0dbdd401b74b27547cad82b3446e3f08614638ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.2.0/coder-cli-linux-x64.tar.gz"
      sha256 "5f3c796276a6ed0b51b81fad0248fb800da2c7e445aa8e5a39999892dd264d24"
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
