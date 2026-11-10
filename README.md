# sam-bretz/homebrew-tap

Homebrew formulae for [envctl](https://github.com/sam-bretz/envctl).

```bash
brew install sam-bretz/tap/envctl
```

`Formula/envctl.rb` is rendered from each envctl release's `checksums.txt` by `render-formula.sh`. The `bump` workflow checks for a new envctl release every three hours and can also be run by hand from the Actions tab.

Install [Braindex](https://github.com/sam-bretz/braindex) on Apple Silicon or Intel Macs:

```sh
brew install sam-bretz/tap/braindex
braindex demo
```

The formula downloads a verified archive from this tap's
[Braindex RC4 release](https://github.com/sam-bretz/homebrew-tap/releases/tag/braindex-v0.1.0-rc.4).
