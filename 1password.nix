{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ _1password-gui _1password ];
}

