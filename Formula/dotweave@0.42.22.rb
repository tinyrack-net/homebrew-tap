class DotweaveAT04222 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.22"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.22/dotweave-macos-arm64"
      sha256 "5be3fb33dc40d861fb629ebb2e30e27908b8c1c1cd609b17259d957c0d72aaad"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.22/dotweave-macos-x64"
      sha256 "9c69202523039b632844d26847dff5dffa5d3869a966efe8babefeb681f7e1ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.22/dotweave-linux-x64"
      sha256 "ebd443fb25d95d3776a4fed43c2f0dfbbc7b449452e323a276f170522287b073"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.22/dotweave-linux-arm64"
      sha256 "5a964cfdd63dcc95ba3c2759569e5d91d91a5222c7627a01ccb74cc4f834f76b"
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
