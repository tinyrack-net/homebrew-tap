class DotweaveAT04211 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.11"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.11/dotweave-macos-arm64"
      sha256 "c2b260fc487e93ae439218ffb759bb098981faaaa5918002e277fc570536248b"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.11/dotweave-macos-x64"
      sha256 "3d5ded56623f6cb550e7bd60b42f9a64efdaaf517f198cfc4cb1e19f3726a106"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.11/dotweave-linux-x64"
      sha256 "7bc71f3c2138e8ca2d7d168a4e4be664672439e7884bf7742f99e5a1fb203d29"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.11/dotweave-linux-arm64"
      sha256 "9cb0c41895d0e7e732a6a74534282ca3dd10a65740ec76ab8d62c2f041cca390"
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
