{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    ncpamixer
    wget
    steam
    neovim
    emacs
    mpd
    mpv
    ncmpcpp
    firefox
    virtmanager
    scream-receivers
    barrier
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
    discord
    unzip
    unrar
    curl
    arandr
    zathura
    ranger
    i3lock
    xorg.xrandr
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
];}
