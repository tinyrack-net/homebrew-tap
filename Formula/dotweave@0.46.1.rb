class DotweaveAT0461 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.46.1"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.1/dotweave-macos-arm64"
      sha256 "292e4dca57066d35ef14310e9afc049294051db655546f3a640783d3903fb361"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.1/dotweave-macos-x64"
      sha256 "f150d62e1f095525d24d24e87c5bb7419d21009b9306d3568c46a5f517ed78d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.1/dotweave-linux-x64"
      sha256 "ad9fd27702f12246ddc178adc7ce423ffeb0998376e3601d2bc9ac8a79eb7d70"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.1/dotweave-linux-arm64"
      sha256 "4f5bb912d789389d77ffbdf72cdff617d05a008a8e0a0270e0af046c93336228"
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
