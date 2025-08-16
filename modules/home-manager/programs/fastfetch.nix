{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = ./fastfetch-logo.txt;
        padding = {
          right = 2;
          left = 1;
          top = 2;
        };
        color = {
          "1" = "yellow";
        };
      };

      display = {

      };

      modules = [
        "title"
        "separator"
        {
          type = "datetime";
          key = "Date";
          format = "{weekday}, {year}-{month-pretty}-{day-in-month}";
        }
        {
          type = "datetime";
          key = "Time";
          format = "{hour-pretty}:{minute-pretty}:{second-pretty}, {timezone-name}, UTC{offset-from-utc}";
        }
        {
          type = "battery";
          key = "Battery";
          format = "{capacity} [{status}]";
        }
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "wm"
        "separator"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "localip"
        "break"
        "colors"
      ];
    };
  };
}