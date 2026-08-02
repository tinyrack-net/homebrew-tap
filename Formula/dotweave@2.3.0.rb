class DotweaveAT230 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.3.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.3.0/dotweave-macos-arm64"
      sha256 "6d0297f7cbf57156d2d73808e26cd9755c4e73da9eba4080a39f4e9a07a18a52"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.3.0/dotweave-macos-x64"
      sha256 "2ecc8bd424f5cdc7bc4e1998779f89b2ebf5a39b149bf7f4759ce93ed81e98a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.3.0/dotweave-linux-x64"
      sha256 "88301ed4510de14f77b0332ca34b61564713eb00809265258a0c3b97b20d3377"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.3.0/dotweave-linux-arm64"
      sha256 "78b666e0421a2be6ad8b6b4e63b10e24e9f17359c0b8f2d271b2e8a8448ced15"
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
