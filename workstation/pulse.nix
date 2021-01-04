{ configs, pkgs, ... }:

{
  hardware.pulseaudio = {
    #keep tcp enabled its a hackjob to get music player daemon to work
    tcp.enable = true;
    tcp.anonymousClients.allowedIpRanges = [ "127.0.0.1" ];
    
    # daemon.conf
    daemon.config = {
        high-priority = "yes";
        nice-level = -15;
        realtime-scheduling = "yes";
        realtime-priority = 50;
        resample-method = "speex-float-0";
        default-fragments = 2;
        default-fragment-size-msec = 4;
    };

    # default.pa
    configFile = pkgs.runCommand "default.pa" {} ''
        sed 's/module-udev-detect$/module-udev-detect tsched=0/' \
        ${pkgs.pulseaudio}/etc/pulse/default.pa > $out
    '';
  };

  # realtime processing for group `audio'
  security.pam.loginLimits = [
    { domain = "@audio"; item = "nice"; type = "-"; value = "-20"; }
    { domain = "@audio"; item = "rtpio"; type = "-"; value = "99"; }
  ];
}