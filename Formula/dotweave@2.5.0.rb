class DotweaveAT250 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.5.0"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.0/dotweave-macos-x64"
      sha256 "87c5759a7e0f9b619831bb72e0c8cde4dde944461f6dd4e92e2ad5be3f5a602b"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.0/dotweave-macos-arm64"
      sha256 "f6d54b64a6710c8cc81b7e6fd37cd965767c579baa6dbb58ba250b0de44eaed6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.0/dotweave-linux-x64"
      sha256 "322bb62285deed96dd1dbd743854d57fb7e4726214b782fbc2b7de92d6f8226b"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.5.0/dotweave-linux-arm64"
      sha256 "457e71add21d94b328e012a1f848e2c1c9e3b5adf100621fce9ce8db7a1048e6"
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
