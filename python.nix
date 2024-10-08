{ config, pkgs, ... }:

let unstablePkgs = import <nixos-unstable> { };
in { home.packages = with pkgs; [ python312 unstablePkgs.uv ]; }
