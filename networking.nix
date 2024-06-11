# users.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.i2p # secret internet
    pkgs.tor # secret internet
    pkgs.i2pd
    pkgs.xd # torrent i2p
    pkgs.discord # social app
    pkgs.lemmy-ui # social app
    pkgs.libreddit
    pkgs.lemmy-ui
    pkgs.youtube-tui
  ];
}
