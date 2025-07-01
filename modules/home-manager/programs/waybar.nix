{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 15;
        
        modules-right = [ "clock" ];
      };
    };
  };
}
