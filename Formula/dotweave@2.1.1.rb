class DotweaveAT211 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.1.1"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.1/dotweave-macos-arm64"
      sha256 "d5efaa4274cc341a05aad32af82a6f35a115272ad0d6355873f454d9481b05f2"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.1/dotweave-macos-x64"
      sha256 "0341d0ab18fe62bc29d1c1729ba6c6968ff14de32f0493736732b49bf0203b2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.1/dotweave-linux-x64"
      sha256 "f0d9e09b767c29f1612c6ad7b48ed656e489c36560bbcc0a9ef8c01372169f60"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.1/dotweave-linux-arm64"
      sha256 "bd871a6e07933e93e0ff07556b5f677b66d95c45a93ef8e92f983b21b4d29335"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dotweave-macos-arm64" => "dotweave"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "dotweave-macos-x64" => "dotweave"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "dotweave-linux-x64" => "dotweave"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "dotweave-linux-arm64" => "dotweave"
    end
  end

  test do
    system "#{bin}/dotweave", "--version"
  end
end
