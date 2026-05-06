class DotweaveAT0426 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.6"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.6/dotweave-macos-arm64"
      sha256 "34174b758b1c884fcc257290af2fc8f0e904ebb929566d1ba3ced86f4b4183f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.6/dotweave-linux-x64"
      sha256 "2880b91a5945220ee0951aa16d2e7e84098fbe5825fa763dfd1e11e44eae7443"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.6/dotweave-linux-arm64"
      sha256 "327f13c9940021d075be6dc6cb6d02838b3b67ba32c937594a24de6f3dc6a604"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dotweave-macos-arm64" => "dotweave"
    elsif OS.linux && Hardware::CPU.intel?
      bin.install "dotweave-linux-x64" => "dotweave"
    elsif OS.linux && Hardware::CPU.arm?
      bin.install "dotweave-linux-arm64" => "dotweave"
    end
  end
  end

  test do
    system "#{bin}/dotweave", "--version"
  end
end
