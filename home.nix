# home manager configuration
{ config, lib, pkgs, ... }:
let taskDir = "~/.config/nix-darwin";
in {
  home.packages = with pkgs; [
    bottom
    hadolint
    go-task
    google-cloud-sdk
    terraform
    gh
  ];
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "chengyaye31@gmail.com";
    userName = "Mkamono";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      dc = "docker compose";
      tf = "terraform";
      gd =
        "export WORKING_DIR=$(pwd); cd ${taskDir}; task gd; cd - > /dev/null";
      pgr =
        "export WORKING_DIR=$(pwd); cd ${taskDir}; task pgr; cd - > /dev/null";
      rebuild-darwin =
        "export WORKING_DIR=$(pwd); cd ${taskDir}; task rebuild-darwin; cd - > /dev/null";
      brew-init = ''
        brew install --cask \
                battery \
                jordanbaird-ice \
                raycast \
                warp \
                docker \
                google-chrome \
                meetingbar \
                scroll-reverser
      '';
    };
  };
}
