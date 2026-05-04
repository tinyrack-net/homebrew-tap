class DotweaveAT03937 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.39.37"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.37/dotweave-darwin-arm64"
      sha256 "ff6283e77717ce5137b0b7d3382ffc4bd3920eae28c28bb65433e12c74f7672c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.37/dotweave-linux-x64"
      sha256 "d7930a656a0d485a2cf03c093e88aad5e04fc455fa16d4b3454411271f39db55"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.39.37/dotweave-linux-arm64"
      sha256 "1cd56ce74dd7d4d32303adf537db74d1b8d6d7ed8bf402c8a99191925a8396de"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dotweave-darwin-arm64" => "dotweave"
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
