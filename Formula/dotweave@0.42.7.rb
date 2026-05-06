class DotweaveAT0427 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.7"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.7/dotweave-macos-arm64"
      sha256 "038230e8a83639a1d8c2af4fffc9a0072f184f74622816116d40efedfb87b82e"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.7/dotweave-macos-x64"
      sha256 "8edaa4dbea4cdd0ef676d6da1b623e3a5f281d2e959c32c16d5e034103f37282"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.7/dotweave-linux-x64"
      sha256 "3710796cf76d400997c20f72f4105a84574e1ef3c226a117d434b10aef7faccb"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.7/dotweave-linux-arm64"
      sha256 "18a82c73a84ef120975853c566a09a01f2e8f8f4c0e85a5f48caa816e5a50712"
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
