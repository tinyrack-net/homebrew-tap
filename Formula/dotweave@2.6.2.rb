class DotweaveAT262 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "2.6.2"
  keg_only :versioned_formula


  on_macos do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.2/dotweave-macos-x64"
      sha256 "1ede0f5f6369623b26e93fb7279cbd74b8de9f97ec3f317e4810defdf008fc52"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.2/dotweave-macos-arm64"
      sha256 "40eda92fa081400c75dbff59b68a00eb0a0c18b32ea89151656957f1b96dfedf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.2/dotweave-linux-x64"
      sha256 "9abee92d995e29b7a9eba75ba4df2c55c0468c600724d9d2ed407e938814b464"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v2.6.2/dotweave-linux-arm64"
      sha256 "8f4f2b56dfb1629be9b940067dcbaf9a289384ae3ee4b726f6c92cd700b35d79"
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
