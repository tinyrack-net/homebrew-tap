class DotweaveAT0411 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.41.1"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.41.1/dotweave-darwin-arm64"
      sha256 "3949b19f00ac72f3f5c7d43e2cafa239d60d38b71ab83c9eaa11f9a85ac3de8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.41.1/dotweave-linux-x64"
      sha256 "d46160e7c9ce22b2782bbab90c6b7967a99b29a4824cb650a03861e63ce5eac6"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.41.1/dotweave-linux-arm64"
      sha256 "d3b1e72d6222097e8b15fac62baba068bff128fb51dcd6389dcf5a95326e04f1"
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
