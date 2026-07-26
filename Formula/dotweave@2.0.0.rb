class DotweaveAT200 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.0.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.0/dotweave-macos-arm64"
      sha256 "7b0554843242a8c1552ff93735c8efc3cf08ae4abadaed7527f9b2e303a66eef"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.0/dotweave-macos-x64"
      sha256 "8885f324bbb1573411e357b7b213e30985f669cdce06053aecf80daf56cb8755"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.0/dotweave-linux-x64"
      sha256 "a38020a6e406694b02431e32b24dcb97d478fd011fcde3a2ae00bbf6c91174c5"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.0/dotweave-linux-arm64"
      sha256 "f69b4957f6e282a42abbd0d496c3bece227a39e727be837519251c0f7b5bbc71"
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
