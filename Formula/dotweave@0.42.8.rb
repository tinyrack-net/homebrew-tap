class DotweaveAT0428 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.8"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.8/dotweave-macos-arm64"
      sha256 "3d5acf6f5e703c54f42e05b53f1266aef906f9a5082b04ba7aa4fe19a9c4230c"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.8/dotweave-macos-x64"
      sha256 "3c4d28ed923856f590501c937c1db501807ce9932986ad314a1ea1e2d86d3109"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.8/dotweave-linux-x64"
      sha256 "3fde9ce76d3b19131f2145b2c654872394f503efa61d9364b853b472587e32ab"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.8/dotweave-linux-arm64"
      sha256 "29a18a08e9abe52c5255d7d237ea4396af0481beeda5fa8b77306a967b1530dc"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dotweave-macos-arm64" => "dotweave"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "dotweave-macos-x64" => "dotweave"
    elsif OS.linux && Hardware::CPU.intel?
      bin.install "dotweave-linux-x64" => "dotweave"
    elsif OS.linux && Hardware::CPU.arm?
      bin.install "dotweave-linux-arm64" => "dotweave"
    end
  end
  end

  test do
    system "#{bin}/dotweave", "--version"
  end
end
