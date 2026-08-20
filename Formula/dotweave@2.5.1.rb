class DotweaveAT251 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.5.1"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.1/dotweave-macos-x64"
      sha256 "1f8021195272721af5e1863e08b1dd9279f1f3b5ae90a52aa98e1e9506804cf2"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.1/dotweave-macos-arm64"
      sha256 "6956ce45f94da5f239ec4bf676d8dbee08de935c8f3b48146bcf29b647abe229"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.1/dotweave-linux-x64"
      sha256 "91ecc61b7671f94bb83275a8861189f23cefbac678caec15e0875918630bc7fc"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.1/dotweave-linux-arm64"
      sha256 "b40cfc3c8dbf035c645d2399648ee5a088a636963fd577b0f71da9e04b488848"
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
