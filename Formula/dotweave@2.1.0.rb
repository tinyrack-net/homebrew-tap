class DotweaveAT210 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.1.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.0/dotweave-macos-arm64"
      sha256 "34de29384a8bd953cbd188bf7f057124f9f996ceee731347c5897e5585799fa7"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.0/dotweave-macos-x64"
      sha256 "2faf5999d12875a04cd1841415475717400b238b0c9329b380730c1fae0cbd99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.0/dotweave-linux-x64"
      sha256 "e4234dff8339392b5c10cdb30b7172310a0790d84937fd94fd677fbe6f575f64"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.1.0/dotweave-linux-arm64"
      sha256 "a90fad0f26ee7b70ddd7b8858be235f718a8d4c2f00f714fd3cd9184e8fb2cd6"
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
