{ config, lib, pkgs, ... }:

let
  bailey-nvim = import ./bailey/neovim;
in
{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  users.users.nixos.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    git
    gh
    screenfetch
    docker
  ];

  virtualisation.docker.enable = true;

  # Configuration for neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    configure = {
      customRC = builtins.readFile ./init.nvim;

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [  ];
      };
    };
  };

  system.stateVersion = "24.05"; # do not touch!
}
