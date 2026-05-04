class Dotweave < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.39.33"

  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.33/dotweave-darwin-arm64"
      sha256 "9af180a9b792f9bdd5415ac1e7f26265248b1c87df7f89fc752700eec5188979"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.33/dotweave-linux-x64"
      sha256 "a5e93b696ae0962514fa4624fef27e8968993b24f23ad4ed715154dc53d610ee"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.33/dotweave-linux-arm64"
      sha256 "352d837eb377fedd719813ff301891816888f5d4e6867db109aa8f644c971745"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dotweave-darwin-arm64" => "dotweave"
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
