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

  perSystem = {system, ...}: let
    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays;
      config.allowUnfree = true;
    };
    inherit (self.lib.mkNeovim {inherit system;}) neovim;
  in {
    _module.args.pkgs = pkgs;

    # Always use flake's lib
    packages.default = neovim;

    # Make `nix flake check` actually build the config
    checks.build = neovim;
  };
}
