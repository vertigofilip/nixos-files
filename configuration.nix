{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./users.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-05754d16-6371-43e2-9b42-31da34f81691".device = "/dev/disk/by-uuid/05754d16-6371-43e2-9b42-31da34f81691";
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.mate.enable = true;
  services.xserver = {
    layout = "pl";
    xkbVariant = "";
  };
  console.keyMap = "pl2";
  services.printing.enable = true;

  # Configure Pipewire for audio handling
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
  };

  security.rtkit.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim # text editor
    wget # downloading files from internet
    #ungoogled-chromium
    i2p # secret internet
    i2pd
    xd # torrent i2p
    qFlipper # flopper home app
    clamtk # antivirus
    arduino # code editor for electronics
    aichat # gpt 3.5 in terminal
    #tor
    gimp # image editor
    rustc # programming language
    python3 # programming language
    rustdesk # remote desktop
    brave # private browser
    opera
    vscode # code editor
    python311Packages.pygit2
    discord # social app
    git
    gnugrep # text search
    lemmy-ui # social app
    #jackmix # Only include one JACK implementation
    minecraft
    steam
    qemu_full
    virt-manager
    zip
    python311Packages.huggingface-hub
    python311Packages.tkinter
    python311Packages.optimum
    #soundux
    onnxruntime
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;

  };

  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

