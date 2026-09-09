class DotweaveAT260 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.6.0"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.0/dotweave-macos-x64"
      sha256 "ff4745ee1c1af448455bf3f5de01dbf565d275cedd4e35462c86d5ac2d004b23"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.0/dotweave-macos-arm64"
      sha256 "9234525bfa3c63655fe880968f442a8bd8229d555a23b7afc6d014b84dba51a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.0/dotweave-linux-x64"
      sha256 "59967831b450a788c6f93abb80426c47da3e0647605e518a8a401a9717b10853"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.0/dotweave-linux-arm64"
      sha256 "e295186e84997e045f188be9f1750139e044f796b78ee392c1bc6744a60c4de7"
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
