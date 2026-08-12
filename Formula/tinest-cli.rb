class TinestCli < Formula
  desc "Command line that hosts and administers a Tinest daemon"
  homepage "https://github.com/tinyrack-net/tinest"
  version "0.7.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/tinest/releases/download/v0.7.0/tinest-cli-macos-x64.tar.gz"
      sha256 "052aa0d8df7bf9580cfb90c28d16998fbc41192996f2ac2dd57bee09517fa5ad"
    end
    on_arm do
      url "https://github.com/tinyrack-net/tinest/releases/download/v0.7.0/tinest-cli-macos-arm64.tar.gz"
      sha256 "357362b077b21d269c06d69503403e4fc624fc070d6ee8c52be042121e2edb2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/tinest/releases/download/v0.7.0/tinest-cli-linux-x64.tar.gz"
      sha256 "e745e77afea091e8127061aa27cd9319b2a2840cabed9807b61505fdef45fdf8"
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
