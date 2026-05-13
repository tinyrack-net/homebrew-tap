class DotweaveAT04221 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.21"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.21/dotweave-macos-arm64"
      sha256 "3ae59d8b4498098e8f7c038855dd4a7e771a9be7c81e33836a5854119bc90511"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.21/dotweave-macos-x64"
      sha256 "05f720f330ce8bb504ade192542332706d19d016a16a5f020d5aad2569045190"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.21/dotweave-linux-x64"
      sha256 "162a99e2a4934f097117451bb6a3a4b04586e4722bd2250bda7d90c3e34cfbec"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.21/dotweave-linux-arm64"
      sha256 "10de88fa01f7d79d45f80510c3f4c4c52c4ae5421d35e81e1b6931a67aa24302"
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
