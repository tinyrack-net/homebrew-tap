class DotweaveAT0520 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.52.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.52.0/dotweave-macos-arm64"
      sha256 "57bbf7ed74660a8a209a41d0fdb7fbd95a8b092760f8f85382dbc373fbb21963"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.52.0/dotweave-macos-x64"
      sha256 "1b22ff8abb16f38bb1326816701189ea1248046c2ffbfa20dfc7c7c6fee747b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.52.0/dotweave-linux-x64"
      sha256 "747fd6d13821a072e3c696efb846c6043446061aa00eb431abd258cccd25baf6"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.52.0/dotweave-linux-arm64"
      sha256 "07543f842de9d9035123682908f643435d7a5c84c2544f9bebea3ec477736849"
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
