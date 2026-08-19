class TinestCli < Formula
  desc "Command line that hosts and administers a Tinest daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.10.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.10.0/tinest-cli-macos-x64.tar.gz"
      sha256 "46c04cebc2c04e00d2cb4c86546059baadf9af6efa984561516b6922e3c0c400"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.10.0/tinest-cli-macos-arm64.tar.gz"
      sha256 "ae6b75dd7948277b7e2153b4c892bcd9024ca1e3d419ac7a537067d033ee7092"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.10.0/tinest-cli-linux-x64.tar.gz"
      sha256 "ae690aabce345a2405fed3067683fe2b13606e270afaee8a680ad3568cc06b83"
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
