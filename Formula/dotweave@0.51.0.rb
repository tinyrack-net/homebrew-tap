class DotweaveAT0510 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.51.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.51.0/dotweave-macos-arm64"
      sha256 "c653eb2d02420ca950ccf02f125dcd687fb6ff87a0cdb9724286fb3163ca30c2"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.51.0/dotweave-macos-x64"
      sha256 "beba1137533250263013534ebd678988deec4cf92ceadcc5b6020224cb910b24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.51.0/dotweave-linux-x64"
      sha256 "e7f8987b890502f4b2c02aa8150e59d9052362ec1301592d1ff8da29d7cd2263"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.51.0/dotweave-linux-arm64"
      sha256 "4a082e2c9ac815164966eb86837795708259e9d511415186519dbc696b1a8fc4"
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
