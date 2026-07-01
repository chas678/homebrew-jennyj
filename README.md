# homebrew-jennyj

Homebrew tap for [`jenny`](https://github.com/chas678/jennyj) — a high-performance
pairwise (and N-wise) combinatorial test-suite generator, a Timefold Solver port
of Bob Jenkins' classic `jenny.c`.

## Install

```bash
brew install chas678/jennyj/jenny
jenny --version
```

That's shorthand for `brew tap chas678/jennyj && brew install jenny`. Works on
macOS and Linux; a JDK is installed automatically as a dependency.

## Usage

```bash
jenny -n2 4 2 5 2 5 2        # pairwise suite over six dimensions
jenny -h                     # all flags
```

See the [main project README](https://github.com/chas678/jennyj) for the full
flag reference and background.

## Updating the formula

`Formula/jenny.rb` is bumped automatically by the release workflow in the main
repo when a `vX.Y.Z` tag is pushed (see `docs/RELEASING.md` there). To bump by
hand, update `url`, `version`, and `sha256` to the new release asset.
