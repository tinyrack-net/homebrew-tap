<div align="center">

# TinyRack Homebrew Tap

**Official Homebrew tap for installing Dotweave and other TinyRack CLI tools.**

[Dotweave](https://github.com/tinyrack-net/dotweave) · [Documentation](https://dotweave.tinyrack.net/en/) · [Getting Started](https://dotweave.tinyrack.net/en/getting-started/)

</div>

---

This repository provides Homebrew formulae for TinyRack projects. It is the macOS and Linux installation channel used by Dotweave releases.

## Available Formulae

- `dotweave` — latest Dotweave release
- `dotweave@<version>` — pinned historical Dotweave releases

## Installation

```bash
brew install tinyrack-net/tap/dotweave
```

To make the tap available explicitly before installing:

```bash
brew tap tinyrack-net/tap
brew install dotweave
```

## Upgrade

```bash
brew update
brew upgrade dotweave
```

## Pin a Specific Version

Versioned formulae are kept for users who need to stay on a known Dotweave release.

```bash
brew install tinyrack-net/tap/dotweave@0.42.13
```

## Verify

```bash
dotweave --version
brew test tinyrack-net/tap/dotweave
```

## Related Projects

- [Dotweave](https://github.com/tinyrack-net/dotweave) — git-backed configuration sync for your development environment
- [Dotweave documentation](https://dotweave.tinyrack.net/en/) — guides, command reference, and troubleshooting

## Development

Formulae live under `Formula/`. The unversioned `dotweave.rb` formula tracks the latest release, while versioned formulae preserve older release artifacts and checksums.

When updating a formula manually, verify the release asset URLs and SHA-256 checksums before committing.
