{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 15;
        
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "network" "clock" ];
      };
    };

    style = "
      *{
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
    ";
  };
}
