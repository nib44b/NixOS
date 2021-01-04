{ config, lib, pkgs, ... }:
{
services = {
    # Compositor for X
    picom = {
        enable = true;
        shadow = false;
    };

    # configuration of transmission
    transmission = {
      enable = true;
      user = "cirno";
      settings = {
        download-dir = "/home/cirno/4TBVOL/torrents/";
        incomplete-dir = "/home/cirno/4TBVOL/torrents/.incomplete/";
        incomplete-dir-enabled = true;
        peer-port-random-high = 65535;
        peer-port-random-low = 49152;
        peer-port-random-on-start = true;
      };
    };
    #configuration of music player daemon, to not have to deal with quite frankly(and sadly) inferior options
    mpd = {
        enable = true;
        startWhenNeeded = true;
        user = "cirno";
        musicDirectory = "/home/cirno/4TBVOL/Music";
        dataDir = "/home/cirno/4TBVOL/Music/mpd/";
        extraConfig = ''
          audio_output {
            type "pulse"
            name "pulseaudio tcp on 127.0.0.1"
            server "127.0.0.1"
          }
          audio_output {
            type "fifo"
            name "my_fifo"
            path "/tmp/mpd.fifo"
            format "44100:16:2"
          }
        '';
    };
    # one liner services
    gnome3.gnome-keyring.enable = true;
  };
}