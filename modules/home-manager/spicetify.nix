{ pkgs, inputs, ... }:

{
  imports = [
    inputs.spicetify.homeManagerModules.default
  ];

  programs.spicetify =
  let 
    spicepkgs = inputs.spicetify.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    # theme = spicepkgs.themes.sleek;
    # colorScheme = "Deep";

    enabledExtensions = with spicepkgs.extensions; [
      shuffle
    ];
    enabledCustomApps = with spicepkgs.apps; [

    ];
    enabledSnippets = with spicepkgs.snippets; [

    ];
  };
}
