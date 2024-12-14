# home manager configuration
{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ fzf bottom hadolint go-task ];
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "chengyaye31@gmail.com";
    userName = "Mkamono";
  };
}
