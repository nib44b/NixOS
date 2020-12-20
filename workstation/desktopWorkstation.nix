{ config, lib, pkgs, ... }:
{
  services = {
    picom.enable = true;
    picom.shadow = false;
    gnome3.gnome-keyring.enable = true;
    # configuration of transmission
    transmission = {
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
  };

  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.i3lock-fancy}/bin/i3lock-fancy";
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    layout = "fi,rs,ru";
    xkbOptions = "eurosign:e,grp:alt_space_toggle";
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
          *.foreground:   #787c99
          *.background:   #16161e
          *.cursorColor:  #787c99
          *.color0:       #363b54
          *.color8:       #363b54
          *.color1:       #f7768e
          *.color9:       #f7768e
          *.color2:       #41a6b5
          *.color10:      #41a6b5
          *.color3:       #e0af68
          *.color11:      #e0af68
          *.color4:       #7aa2f7
          *.color12:      #7aa2f7
          *.color5:       #bb9af7
          *.color13:      #bb9af7
          *.color6:       #7dcfff
          *.color14:      #7dcfff
          *.color7:       #787c99
          *.color15:      #acb0d0
        ''}
      '';
    };
  };
}
