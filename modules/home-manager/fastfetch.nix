{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = ./fastfetch-logo.txt; # ascii art by Joan G. Stark
        padding = {
          right = 2;
          left = 1;
          top = 2;
        };
        color = {
          "1" = "bright_green";
        };
      };

      display = {
        color = "bright_green";
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
        "uptime"
        {
          type = "battery";
          key = "Battery";
          format = "{capacity}, {time-formatted} [{status}]";
        }
        "separator"
        "os"
        "host"
        "kernel"
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