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
    system,
    lib,
    ...
  }: let
    # Import pkgs for this system
    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays or [];
      config.allowUnfree = true;
    };

    # Function to create a Neovim configuration
    mkNeovim = modules:
      inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs system self;};
        modules = [../config] ++ modules;
      };

    # Extend lib with mkNeovim
    extendedLib = lib.extend (final: prev: {
      mkNeovim = mkNeovim;
    });
  in {
    _module.args.pkgs = pkgs;
    _module.args.lib = extendedLib;

    # Default Neovim package
    packages.default = (mkNeovim []).neovim;
  };

  # Flake-level mkNeovim for external consumption
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
