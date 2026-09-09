class TinestCli < Formula
  desc "Command line that hosts and administers a Tinest daemon"
  homepage "https://github.com/tinyrack-net/tinest"
  version "0.12.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/tinest/releases/download/v0.12.0/tinest-cli-macos-x64.tar.gz"
      sha256 "486b1e766070f3fe34ed2316b0fbf22111effab07012109d8973031a8faa0b58"
    end
    on_arm do
      url "https://github.com/tinyrack-net/tinest/releases/download/v0.12.0/tinest-cli-macos-arm64.tar.gz"
      sha256 "baad1dfa1432e987ce098a7ca0847775a1b987c1219befa05341a84faed0067f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/tinest/releases/download/v0.12.0/tinest-cli-linux-x64.tar.gz"
      sha256 "9b28782e9b7e21ce5db4bb8a18728a31a31196498dd91928e83d4222e2895468"
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
