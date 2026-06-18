class DotweaveAT0490 < Formula
  desc "Git-backed configuration synchronization tool for dotfiles"
  homepage "https://dotweave.tinyrack.net"
  version "0.49.0"
  keg_only :versioned_formula


  on_macos do
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.49.0/dotweave-macos-arm64"
      sha256 "46d715073d17bfb85cc16d56274019ea327337e175836c6dc09320528a2cdb4c"
    end
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.49.0/dotweave-macos-x64"
      sha256 "aa84c17ed89f2bf8d0e9fb3115933f3da7b2f1e72ea561f0fdcf046f6a971ae1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.49.0/dotweave-linux-x64"
      sha256 "3df255102fe5138cfdafb375014fa263af09dc086a2e2e0ed358cfc150de26a3"
    end
    on_arm do
      url "https://github.com/tinyrack-net/dotweave/releases/download/v0.49.0/dotweave-linux-arm64"
      sha256 "747919e022dacbd71c9d52aa24d9e480b159ef5c595d2291588025677519b9fa"
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
