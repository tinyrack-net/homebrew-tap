class TinestCli < Formula
  desc "Command line that hosts and administers a Tinest daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.8.2"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.8.2/tinest-cli-macos-x64.tar.gz"
      sha256 "fbd4ca89e5ec56de3e549cf1870bd844ce224c4a91d3b6427a3db9329b9ea3b1"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.8.2/tinest-cli-macos-arm64.tar.gz"
      sha256 "4b908adde821f117afde446d892e78915667fa2bb52d9b0b0b872d912b4702a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.8.2/tinest-cli-linux-x64.tar.gz"
      sha256 "6dc5bd1c903e2d059c375a464efb03a47422777f1c9300cf6bf727cbca8e4a5d"
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
