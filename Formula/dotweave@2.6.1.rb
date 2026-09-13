class DotweaveAT261 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.6.1"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.1/dotweave-macos-x64"
      sha256 "b87be4fa8ea8d0e1996572d2d1ddad9b57f61f1b7abc10921a554372e8e7f5f9"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.1/dotweave-macos-arm64"
      sha256 "85d9e0f3a5131f548420789d9c7d04beb8222147dab245299f02e4287cc7d108"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.1/dotweave-linux-x64"
      sha256 "3e240428386e9ddcc74b6799ea6e0e40722b05add6a200f07c177975e58bcff9"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.1/dotweave-linux-arm64"
      sha256 "2677a833b4be0d200c9b7b3911427142da4dde26eaac2241716b7a0e48a11e15"
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
