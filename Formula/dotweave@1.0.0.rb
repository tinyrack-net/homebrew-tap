class DotweaveAT100 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "1.0.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v1.0.0/dotweave-macos-arm64"
      sha256 "3bd3b032acfb6fd24c030e3c1d0e3748f81a3ebbcaa3f2b96ab0feb63423c5b3"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v1.0.0/dotweave-macos-x64"
      sha256 "230c0ba6e1324b57cc62fcb3337361ad049eb362648867b12a4186d0d73bddab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v1.0.0/dotweave-linux-x64"
      sha256 "e51fd298946bcb582a9e31e1acb481548689128687f10538a500a2ef7d1d69f9"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v1.0.0/dotweave-linux-arm64"
      sha256 "ff113105f6eee71ebcb4cc290ad4e8b6b9ae44b40382d0ce01b7d2c58f358a40"
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
