class TinestCli < Formula
  desc "Command line that hosts and administers a Tinest daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.8.1"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.8.1/tinest-cli-macos-x64.tar.gz"
      sha256 "69f734291dd9997004107054f8491b6a953eee46eb699fbac7804a42b92653cd"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.8.1/tinest-cli-macos-arm64.tar.gz"
      sha256 "1aea72b8e2df0b05fa55e07bc48abba5f0261d493bdd034dacc5deb668d5ec37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.8.1/tinest-cli-linux-x64.tar.gz"
      sha256 "89687ca6a3d885c6485e84e9a6ec2f18ec9997dbd6acc77ee06260173694981f"
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
