class DotweaveAT0470 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.47.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.47.0/dotweave-macos-arm64"
      sha256 "23ad4b21a7be62c2051a7c0bff54c464ffcb3703774cd885386ce36211adea88"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.47.0/dotweave-macos-x64"
      sha256 "7cc61ee5455d6f60099d507a67581293a2659c6e702a18ad8cbd71bc742b4703"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.47.0/dotweave-linux-x64"
      sha256 "eed8455cb1a2cfe09fc3399da5e85ee51d2240d89ec81d0d2d94eaefac5017e3"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.47.0/dotweave-linux-arm64"
      sha256 "2e95a3bc3b3edc5b2f9410ac7318417b9761f5ad6cf42d7f99e51d286b04982b"
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
