# users.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qFlipper # flopper home app
    arduino # code editor for electronics
    rustc # programming language
    python3 # programming language
    python311Packages.huggingface-hub
    python311Packages.tkinter
    python311Packages.optimum
    python311Packages.pygit2
    qemu_full # xirtual machine engine
    vscode # code editor
    mono5
    zig_0_11
  ];
}
