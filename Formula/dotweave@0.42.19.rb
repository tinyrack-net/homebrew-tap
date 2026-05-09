class DotweaveAT04219 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.19"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.19/dotweave-macos-arm64"
      sha256 "8b6a1f566a4dd3dce057ac635513c500cdf6935b86298ca9451cf4ad9e802340"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.19/dotweave-macos-x64"
      sha256 "671e371e05bbf3b983ce06f18820051f7d87b1b8968e324a48d90d96e37e5949"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.19/dotweave-linux-x64"
      sha256 "586abe2377f32294597b75644ede7775754b6b0a682dd6864207f2aa48efdca6"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.19/dotweave-linux-arm64"
      sha256 "ca68991214b2b235b11942e462099265aaa278f6e617f93bdf0903309b1801fd"
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
