{ config, lib, pkgs, ... }:
{
  services = {
    picom.enable = true;
    picom.shadow = false;
  };

  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.i3lock-fancy}/bin/i3lock-fancy";
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    layout = "fi";
    xkbOptions = "eurosign:e";
    dpi = 162;

    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
    };

    windowManager.bspwm.enable = true;

    displayManager = {
      lightdm.enable = true;
      sessionCommands = ''
        ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
          Xft.dpi: 162
          Xft.autohint: 0
          Xft.lcdfilter: lcddefault
          Xft.hintstyle: hintslight
          Xft.hinting: 1
          Xft.antialias: 1
          Xft.rgba: rgb
          URxvt*font: -uw-ttyp0-medium-r-normal--18-170-75-75-c-90-iso10646-1
          URxvt*boldFont: -uw-ttyp0-bold-r-normal--18-170-75-75-c-90-iso10646-1
          !URxvt.font:xft:Terminus (TTF):size=10
          URxvt.letterSpace: 0
          URxvt.lineSpace: 0
          URxvt.internalBorder: 7
          URxvt.cursorBlink: true
          URxvt.cursorUnderline: false
          URxvt.saveline: 2048
          URxvt.scrollBar: false
          URxvt.scrollBar_right: false
          *background: #fbf1c7
          *foreground: #3c3836
          *color0:  #fdf4c1
          *color8:  #928374
          *color1:  #cc241d
          *color9:  #9d0006
          *color2:  #98971a
          *color10: #79740e
          *color3:  #d79921
          *color11: #b57614
          *color4:  #458588
          *color12: #076678
          *color5:  #b16286
          *color13: #8f3f71
          *color6:  #689d6a
          *color14: #427b58
          *color7:  #7c6f64
          *color15: #3c3836
        ''}
      '';
    };
  };

  # configuration of transmission
  services.transmission = {
    enable = true;
    settings = {
      download-dir = "/home/cirno/4TBVOL/torrents/";
      incomplete-dir = "/home/cirno/4TBVOL/torrents/.incomplete/";
      incomplete-dir-enabled = true;
      peer-port-random-high = 65535;
      peer-port-random-low = 49152;
      peer-port-random-on-start = true;
    };
  };

}
