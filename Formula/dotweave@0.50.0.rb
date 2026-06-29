class DotweaveAT0500 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.50.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.50.0/dotweave-macos-arm64"
      sha256 "355da6b951cf65c8964007d3a26fed1366422edb4acea57f2c0467c129b52b91"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.50.0/dotweave-macos-x64"
      sha256 "98022e6771b2274fa7661d684015cdf1a4401124e62a7612cd985d52b0ba41a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.50.0/dotweave-linux-x64"
      sha256 "84f9e50669ce511a757d680d485ad1cb244f110683da72fa4040420b6e8016ab"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.50.0/dotweave-linux-arm64"
      sha256 "779cf9e251e8be39d2e1db4a1f118e998f51f90f16ac9fc595406483cf1227fb"
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
