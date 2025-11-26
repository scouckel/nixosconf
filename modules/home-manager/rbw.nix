{ pkgs, ... }: 

{
  programs.rbw = {
    enable = true;
    settings = {
      email = "james.krinsky@gmail.com";
      pinentry = pkgs.pinentry-qt;
      base_url = "https://vault.bitwarden.com";
      identity_url = "https://identity.bitwarden.com";
      ui_url = "https://vault.bitwarden.com";
    };
  };

  home.packages = [
    pkgs.pinentry-qt
    pkgs.rofi-rbw
  ];
}