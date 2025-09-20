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

  # Top-level flake lib - this is how you expose lib functions in flake-parts
  flake = {
    lib.mkNeovim = system: modules: let
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
  in {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays;
      config.allowUnfree = true;
    };

    packages.default = (mkNeovim []).neovim;
  };
}
