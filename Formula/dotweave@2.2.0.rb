class DotweaveAT220 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.2.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.2.0/dotweave-macos-arm64"
      sha256 "66fee01814eec10e086f0480e1108947f59ae1d67a9682543636490b57098253"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.2.0/dotweave-macos-x64"
      sha256 "2c2b60248cbff8a915f793b833d1bad0ae5444ac30069d7fa00285389f81512d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.2.0/dotweave-linux-x64"
      sha256 "b9bfdb37104350f93234bbe90f9af06c5a39447ae9645368c282ee46dfda6bbe"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.2.0/dotweave-linux-arm64"
      sha256 "f7e9a2db1a55ac9356dedf9de29370c0449572dd91782d992fb6a7d73b998d06"
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
