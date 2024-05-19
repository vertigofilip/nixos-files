# users.nix
{ config, pkgs, ... }:

{
  users.users.filips = {
    isNormalUser = true;
    description = "Filip Sikora";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      # thunderbird
    ];
  };
}
