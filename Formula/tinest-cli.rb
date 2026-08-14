class TinestCli < Formula
  desc "Command line that hosts and administers a Tinest daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.9.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.9.0/tinest-cli-macos-x64.tar.gz"
      sha256 "7e2a1be747685bf753423dc65ea4a4c2098285678cb688081ea7f1169bfb8b62"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.9.0/tinest-cli-macos-arm64.tar.gz"
      sha256 "69cff36e20d4637e000537fcb319bdf4b7b64b07e079f04dadc3aed81f7faadb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.9.0/tinest-cli-linux-x64.tar.gz"
      sha256 "fcdd26b93d723231422f65529d3aebbabd2be24896945f904c75d19d346c84ea"
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
