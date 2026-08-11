class CoderCli < Formula
  desc "Command line that hosts and administers a Tinyrack Coder daemon"
  homepage "https://github.com/tinyrack-net/coder"
  version "0.4.1"

  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.4.1/coder-cli-macos-x64.tar.gz"
      sha256 "0bbfd69e845ec9eb7415dccfd6b792572f5a2a782b7cceeb6a268deb5d6337a7"
    end
    on_arm do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.4.1/coder-cli-macos-arm64.tar.gz"
      sha256 "4d1bee1592c9f859d8b9218564e8176423ef946cb1ea1a4a5a0c897bfe4decd0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/coder/releases/download/v0.4.1/coder-cli-linux-x64.tar.gz"
      sha256 "1f5547fe1e6881357c3fcb093799e01775ee828dd6ca42fbd9c78d7eff715d38"
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
