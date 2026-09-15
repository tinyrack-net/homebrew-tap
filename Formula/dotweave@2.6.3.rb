class DotweaveAT263 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.6.3"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.3/dotweave-macos-x64"
      sha256 "1b18783c79deaa646770900d78d56ea15c91f57f0a06c8c1a5083ab39fcd1c32"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.3/dotweave-macos-arm64"
      sha256 "e3ba311dfb3df6d79789df609daceb794dd22cb950977a74ffe4af2a97a56a4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.3/dotweave-linux-x64"
      sha256 "6e22ba374f16833846769f8c8ee7be5bbfc0d6d832113e80f856df35be7f0b74"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.3/dotweave-linux-arm64"
      sha256 "f0fb8de3da3070a2f5318b6c8081bb2a97711e7b6ae776b079d96a36f43b66f3"
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
