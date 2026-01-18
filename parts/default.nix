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

  flake.lib.mkNeovim = {
    system,
    modules ? [],
  }: let
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

  perSystem = {
    pkgs,
    system,
    ...
  }: let
    pkgsPerSystem = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays;
      config.allowUnfree = true;
    };
  in {
    _module.args.pkgs = pkgsPerSystem;

    # Always use flake's lib
    packages.default = (self.lib.mkNeovim {inherit system;}).neovim;
  };
}
