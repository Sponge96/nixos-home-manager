{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passthrough = false;
      height = 30;
      modules-left = [ "cpu" "temperature" "tray" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "custom/resources" "network" ];
      clock = { format = "  {:%I:%M %p   %a %d}"; };
      cpu = {
        interval = 10;
        format = "  {usage}%";
      };
      temperature = { format = "  {temperatureC}°C"; };
      tray = {
        icon-size = 20;
        spacing = 9;
      };
      network = {
        tooltip = true;
        format-wifi = "  {bandwidthDownBytes}   {bandwidthUpBytes}";
        format-ethernet = "  {bandwidthDownBytes}   {bandwidthUpBytes}";
        tooltip-format = ''
          Network: <big><b>{essid}</b></big>
          Signal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>
          Frequency: <b>{frequency}MHz</b>
          Interface: <b>{ifname}</b>
          IP: <b>{ipaddr}/{cidr}</b>
          Gateway: <b>{gwaddr}</b>
          Netmask: <b>{netmask}</b>'';
        format-linked = " {ifname} (No IP)";
        format-disconnected = "  ";
        tooltip-format-disconnected = "Disconnected";
        interval = 2;
      };
      pulseaudio = {
        format = " ";
        on-click = "pavucontrol";
      };
      "custom/resources" = {
        format = " ";
        on-click = "resources";
      };
    }];
    style = ''
      @define-color background-darker rgba(30, 31, 41, 230);
      @define-color background #282a36;
      @define-color selection #44475a;
      @define-color foreground #f8f8f2;
      @define-color comment #6272a4;
      @define-color cyan #8be9fd;
      @define-color green #50fa7b;
      @define-color orange #ffb86c;
      @define-color pink #ff79c6;
      @define-color purple #bd93f9;
      @define-color red #ff5555;
      @define-color yellow #f1fa8c;

      * {
          border: none;
          border-radius: 0px;
          font-family: IosevkaTerm NF Heavy;
          font-weight: bold;
          font-size: 18px;
          min-height: 0px;
        }
                
        window#waybar {
            color: @selection;
            background: @background-darker;
            border-bottom: 2px solid @background;
        }

        #cpu {
           background: @green;
           border-radius: 10px;
           border: 3px solid #000000;
           margin: 4px 2px;
           padding: 4px 4px;
        }

        #temperature {
           background: @yellow;
           border-radius: 10px;
           border: 3px solid #000000;
           margin: 4px 2px;
           padding: 4px 4px;
        }

        #tray {
           background: @cyan;
           border-radius: 10px;
           border: 3px solid #000000;
           margin: 4px 2px;
           padding: 4px 4px;
        }

        #network {
            background: @green;
            border-radius: 10px;
            border: 3px solid #000000;
            margin: 4px 2px;
            padding: 4px 4px;
        }

        #clock {
            background: @purple;
            border-radius: 10px;
            border: 3px solid #000000;
            margin: 4px 2px;
            padding: 4px 4px;
        }

        #pulseaudio {
            background: @cyan;
            border-radius: 10px;
            border: 3px solid #000000;
            margin: 4px 2px;
            padding: 4px 4px;
        }        

        #custom-resources {
          background: @yellow;
          border-radius: 10px;
          border: 3px solid #000000;
          margin: 4px 2px;
          padding: 4px 4px;
        }
    '';
  };
}
