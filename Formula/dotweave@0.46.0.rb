class DotweaveAT0460 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.46.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.0/dotweave-macos-arm64"
      sha256 "a637385d91f8488294537a5bd0755a003e756c92f67fbfd54553ae39e3aad6d6"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.0/dotweave-macos-x64"
      sha256 "e2f8490fee8372e03ef85cd95bfb4fb40e94e5f2cdf1b60d8fbf4f3da3a164b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.0/dotweave-linux-x64"
      sha256 "d1b9a7c363a6ea6687af0f3aa9fd878937c23def1e5d74ba2b811743c9a903e6"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.46.0/dotweave-linux-arm64"
      sha256 "6d05c2fd239faa07e3d02c472756373094d5a2adf7f5b5fe2d58132b88308f49"
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
