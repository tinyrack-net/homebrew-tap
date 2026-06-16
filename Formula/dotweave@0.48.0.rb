class DotweaveAT0480 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.48.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.48.0/dotweave-macos-arm64"
      sha256 "14ea4e1567d5f89e5c0719cbc14ef41e472cdbb35d600ad963536bfc9431f273"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.48.0/dotweave-macos-x64"
      sha256 "87a006c4a4bf8f55a26b5cee9679a7a5433e5404fa7599ffe01e471a608feab7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.48.0/dotweave-linux-x64"
      sha256 "92a4c779283fed046e9397c845140a60315d3ba4d8a8d8a3fd16adb6027d8223"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.48.0/dotweave-linux-arm64"
      sha256 "ede8e347368c3454283191a97083c757bdc449dad1160d30aec3cad419416381"
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
