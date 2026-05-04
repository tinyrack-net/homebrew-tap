class DotweaveAT03934 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.39.34"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.34/dotweave-darwin-arm64"
      sha256 "9bb2bea43aa38c047079e0a5a0f2d5a6f2e4d19f80593b65a59bdb776ce83a79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.34/dotweave-linux-x64"
      sha256 "15e4a68ddc9a05130ae6883a1fec9f8cdf7e4cd8f4a6a223191e04f6dd01db88"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.34/dotweave-linux-arm64"
      sha256 "d2b18c998de049b002ecd290abdde32e676a63b8e80b06f1396a8e7242f641c7"
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
