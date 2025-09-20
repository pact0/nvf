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
    # Function to create a Neovim configuration
    mkNeovim = modules:
      inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs system self;};
        modules = [../config] ++ modules;
      };

    # Extend lib with mkNeovim for per-system usage
    extendedLib = lib.extend (final: prev: {
      mkNeovim = mkNeovim;
    });

    # Re-import pkgs so it is available in _module.args
    systemPkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays or [];
      config.allowUnfree = true;
    };
  in {
    _module.args.pkgs = systemPkgs;
    _module.args.lib = extendedLib;

    packages.default = (mkNeovim []).neovim;
  };

  # Expose mkNeovim at the flake level for external consumption
  flake.lib = {
    mkNeovim = system: modules: let
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = lib.attrValues self.overlays or [];
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
