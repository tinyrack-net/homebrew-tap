class DotweaveAT0462 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.46.2"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.2/dotweave-macos-arm64"
      sha256 "6d7d0aeeeea9c8dc674153132e4d19818d319c87058600b343eaa8a115ad521a"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.2/dotweave-macos-x64"
      sha256 "a2d41aa0eabe57b7f9d7355b2415ddb25d1ec025cf41d4f4bd5f4c827dc5789f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.2/dotweave-linux-x64"
      sha256 "5adabfb448e15f3992b2a169248d9070a7d0e51c5533d8a8d3bb80fc870d301e"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.2/dotweave-linux-arm64"
      sha256 "c2fb888d4ccf12a5f54e81446fb7cf1ea3c77573f210340eab3e1cc53077df5b"
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
