{
  inputs,
  lib,
  self,
  ...
}: {
  imports = [
    ./pre-commit
    ./dev-shell
    ./fmt.nix
  ];

  perSystem = {
    pkgs,
    system,
    ...
  }: let
    mkNeovim = modules:
      inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs system self;};
        modules = [../config] ++ modules;
      };

    # Extend lib with your custom functions
    extendedLib = lib.extend (final: prev: {
      mkNeovim = mkNeovim;
    });
  in {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays;
      config.allowUnfree = true;
    };

    # This makes the extended lib available as _module.args.lib
    _module.args.lib = extendedLib;

    packages.default = (mkNeovim []).neovim;
  };

  # Also expose at flake level for external consumption
  flake.lib = {
    mkNeovim = system: modules: let
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = lib.attrValues self.overlays;
        config.allowUnfree = true;
      };
    in
      inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs system self;};
        modules = [../config] ++ modules;
      };
  };
}
