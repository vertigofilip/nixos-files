# users.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    minecraft
    steam # gaming platforn
    itch # gaming platforn

  ];
}
