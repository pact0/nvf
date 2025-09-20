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

        extraSpecialArgs = {
          inherit inputs system self;
        };

        modules =
          [
            ../config
          ]
          ++ modules;
      };
  in {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays;
      config.allowUnfree = true;
    };

    packages.default = (mkNeovim []).neovim;
  };

  flake.lib.mkNeovim = modules: system: let
    pkgs = import inputs.nixpkgs {inherit system;};
  in
    inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs system self;};
      modules = [../config] ++ modules;
    };
}
