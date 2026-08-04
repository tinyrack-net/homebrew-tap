class DotweaveAT240 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.4.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.4.0/dotweave-macos-arm64"
      sha256 "0b7701647105325085c7fa0c9b03ddfbc6718c8dffa5c8556b77d04f4ba37cf3"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.4.0/dotweave-macos-x64"
      sha256 "2cc93fa49a604893506ff380f92f156452e36fcada0ad7d976bf907498b83a4d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.4.0/dotweave-linux-x64"
      sha256 "00aa12bb98b53326b82c887483e4036e91eee5f711f9fe9636c90f17f4c5791e"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.4.0/dotweave-linux-arm64"
      sha256 "926051eb03eec154677d3baffd32d33eadfab8ad3f83c1bacc575b1fa9b0162b"
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
