class DotweaveAT0530 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.53.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.53.0/dotweave-macos-arm64"
      sha256 "6b4a3f6717ead0f6390d1863536bcf336da023da94448010c491aedc8ee5879d"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.53.0/dotweave-macos-x64"
      sha256 "44ee2d5064173c419b390923fa00c47ce491079e0563c51de0cb08dbb826c9b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.53.0/dotweave-linux-x64"
      sha256 "0d62ea36935a061cac4ef320db6c02cc397f26a627356a8479df8a4c654ad52a"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.53.0/dotweave-linux-arm64"
      sha256 "d8e69ac90c444a9297f2c7f7d2a9d2e56b3e4f8556057cc6e01722233c49f53b"
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
