class DotweaveAT0450 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.45.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.45.0/dotweave-macos-arm64"
      sha256 "1f4816ec5237520b5fe4b7139220153c43dd051d36ce6455838afb0206843014"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.45.0/dotweave-macos-x64"
      sha256 "317c0a561a5824770743ba5e0ef2ab5f7f4575fa310b0743ee250eb7376b745b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.45.0/dotweave-linux-x64"
      sha256 "e37568dae4cf772878021dbebf3167a29e27dfd933033868f4999563dfdc6df8"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.45.0/dotweave-linux-arm64"
      sha256 "c7521479436e1c61e1f4389b855c817025d88637caae8907d22d3796ddb7987b"
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
