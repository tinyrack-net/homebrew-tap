class CoderCli < Formula
  desc "Command line that hosts and administers a Tinyrack Coder daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.5.0"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.5.0/coder-cli-macos-x64.tar.gz"
      sha256 "fb316d37f407bd7add594f9871f235147b65ce2f823cb07c1e0cabb7dee89eb4"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.5.0/coder-cli-macos-arm64.tar.gz"
      sha256 "48dcc43f9afdb4f54d075c7a1ab3eb2b89876ca3c71f2e11b3f3c58b1740c2ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.5.0/coder-cli-linux-x64.tar.gz"
      sha256 "bfc840f92edae0afe9ed8d5fed1fa683b41aeae618f20662099870e22c56f98f"
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
