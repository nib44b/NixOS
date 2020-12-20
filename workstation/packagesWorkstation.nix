{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    neovim
    vscode
    mpv
    musikcube
    ghc
    pulseaudio-ctl
    ncmpcpp
    firefox
    ncpamixer
    #virtmanager
    #scream-receivers
    #barrier
    bspwm
    sxhkd
    dmenu
    rxvt-unicode
    pywal
    feh
    polybarFull
    git
    neofetch
    transmission
    picom
    unzip
    unrar
    curl
    arandr
    zathura
    ranger
    i3lock-fancy
    xorg.xrandr
    p7zip
    xorg.xev
    xorg.xprop
    ueberzug
    scrot
    gimp
    cava
    sxiv
    autocutsel
    tremc
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    terminus_font_ttf
    terminus_font
    font-awesome-ttf
    fira-code
    uw-ttyp0
    siji
  ];
}
