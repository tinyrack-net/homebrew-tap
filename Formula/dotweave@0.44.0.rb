class DotweaveAT0440 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.44.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.44.0/dotweave-macos-arm64"
      sha256 "ee88b619d7dd5722fcd88932d2f7fb1c63e69191d28cfe6ad3857a83e6ea71cc"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.44.0/dotweave-macos-x64"
      sha256 "d19ab50e9573e0f9a731845d71b4f765cbd78efd20b5a34ba3d269d26853d2db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.44.0/dotweave-linux-x64"
      sha256 "e9249eca86ad2509cd359e396f6bd3d0f685e0e09668f980a50b3a1bba8d3c21"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.44.0/dotweave-linux-arm64"
      sha256 "882a85e71914859315de6c58e0be8f76c11b119aa74fd186bbe0dae7f9cbd6a3"
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
