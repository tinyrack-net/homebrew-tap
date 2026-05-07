class DotweaveAT04213 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.42.13"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.13/dotweave-macos-arm64"
      sha256 "4a059364e0035d0bb70206bf22506bce7ffd9816e99bae5c1826000924d60364"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.13/dotweave-macos-x64"
      sha256 "7978a64004aaf62b1c9820b33d2efb4c7ac1fdbd2ad2bf6c74fde957865c4074"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.13/dotweave-linux-x64"
      sha256 "88bff9420aa0893c10cb4441b5be6945a63e31f826f349a58862390b132f1b82"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.42.13/dotweave-linux-arm64"
      sha256 "922aba7a80d49619765d6850b73e35990048f0ddb1a30c2f1889e94a4711461a"
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
