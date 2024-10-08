{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];
  programs.git = {
    enable = true;
    userName = "Sponge";
    userEmail = "Jackp.bcot@gmail.com";
  };
  programs.bash.shellAliases = { lz = "lazygit"; };
}
