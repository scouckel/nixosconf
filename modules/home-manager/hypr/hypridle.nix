{
  programs.hypridle = {
    enable = true;

    general = {
      lock_cmd = "pidof hyprlock || hyprlock";
    };

    listener = [
      {
        timeout = 240;
        on-timeout = "hyprlock";
      }
    ];
  };
}