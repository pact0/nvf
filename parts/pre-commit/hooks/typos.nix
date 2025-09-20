{
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    inherit (lib.lists) concatLists;
    inherit (import ../utils.nix {inherit pkgs lib;}) toTOML mkHook;

    typosConfig = toTOML "config.toml" {
      default.extend-words = {
        "ags" = "ags";
        "thumbnailers" = "thumbnailers";
        "flate" = "flate";
        "noice" = "noice";
        "Pn" = "Pn";
        "nitch" = "nitch";
        "fo" = "fo";
        "muh" = "muh";
        "HDA" = "HDA";
        "CROS" = "CROS";
        "ba" = "ba";
      };
    };
  in {
    pre-commit.settings.hooks.typos = let
      ignoredFiles = [
        "CHANGELOG.md"
        "source.json"
        "keys.nix"
        "autocmds.lua"
        "typos.nix"
      ];

      ignoredPatterns = [
        "r'.+\.zsh$'"
        "r'.+\.age$'"
      ];

      ignoredWords = [
        "templateTypeParm"
        "templateTemplateParm"
        "Parm"
        "Noice"
        "noice"
        "Annote"
        "fo"
      ];

      excludedFiles = concatLists [ignoredFiles ignoredPatterns];
    in
      mkHook "typos" {
        enable = true;
        excludes = excludedFiles;
        settings = {
          configPath = typosConfig.outPath;
          ignored-words = ignoredWords;
        };
      };
  };
}
