# Mac用Nix環境構築

## 1. Nixインストール

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

このリポジトリを`~/.config/nix-darwin`にコピーする(gitは後でインストールする)

## 2. Nix-Darwinインストール

```bash
export DARWIN_USER=$(whoami)
export DARWIN_HOST=$(hostname -s)
nix run nix-darwin -- switch --flake ~/.config/nix-darwin --impure
```

```bash
export DARWIN_USER=$(whoami)
export DARWIN_HOST=$(hostname -s)
darwin-rebuild switch --flake ~/.config/nix-darwin --impure
```

nix command, flakeが無効化されるので、`experimental-features = nix-command flakes`を`/etc/nix/nix.conf`に追加する


https://search.nixos.org/packages
