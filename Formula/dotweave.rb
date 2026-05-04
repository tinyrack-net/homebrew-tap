class Dotweave < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.39.32"

  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.32/dotweave-darwin-arm64"
      sha256 "675560a0cc962ebd7c60a29a83b773d8efa676273d233654ef78a2aecbeda047"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.32/dotweave-linux-x64"
      sha256 "44cde265fe2d694370caaec01e622eb9aa0f0dfc15fca6855caa72122c006590"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.32/dotweave-linux-arm64"
      sha256 "f92aba5ce1c5a2174cc9c2253ec37665e98853cd65f0b29f2c2992472add3926"
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
