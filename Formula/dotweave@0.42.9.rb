class DotweaveAT0429 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.9"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.9/dotweave-macos-arm64"
      sha256 "2ef5907530476404f18fbae6b06b1a014a4bad826f167873e32db30b5e9276ab"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.9/dotweave-macos-x64"
      sha256 "9faacc4f6122bee9c861a9c4297706182c4abc423c200fa31b681c7e87bdecb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.9/dotweave-linux-x64"
      sha256 "c2d6e040ca2725d8790ec679bb36ed72f91850dbc36910959d7fe6cafa0359ec"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.9/dotweave-linux-arm64"
      sha256 "e07ac2dc8e5f0a73f602033aaab0e20d8da006f7be6e890ccaebeaaec1a795f7"
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
