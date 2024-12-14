# home manager configuration
{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    hadolint
    go-task
    google-cloud-sdk
    terraform
  ];
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "chengyaye31@gmail.com";
    userName = "Mkamono";
  };
}
