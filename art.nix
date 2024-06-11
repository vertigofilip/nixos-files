# users.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.gimp # image editor
    pkgs.blender # 3d model editor
  ];
}
