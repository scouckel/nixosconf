{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 30;
          on-timeout = "hyprlock";
        }
      ];
    };
  };
}