{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ ungit ];
  programs.git = {
    enable = true;
    userName = "Sponge";
    userEmail = "Jackp.bcot@gmail.com";
  };
}
