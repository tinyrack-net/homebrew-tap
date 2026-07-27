class DotweaveAT201 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.0.1"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.1/dotweave-macos-arm64"
      sha256 "3a20639a303933d52750900759423a21192a8b293bdc8520cc6581f5aee1c6cf"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.1/dotweave-macos-x64"
      sha256 "8af7c4498fc4b79559c6ad73ce0ebec5b4d4f8b9b67161d5fbffb3cb19835456"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.1/dotweave-linux-x64"
      sha256 "9d8b0f31c9417d92c0db276f8648a58080cf6f2b117991b427dbbe77e9de3655"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.0.1/dotweave-linux-arm64"
      sha256 "4032ec9abe68a59df048c176c20aa59aff703cdb6979e82e83668d7d08a27d04"
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
