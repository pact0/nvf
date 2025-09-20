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
    config,
    pkgs,
    system,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays;
      config.allowUnfree = true;
    };

    packages.default =
      (inputs.nvf.lib.neovimConfiguration {
        # inherit system;
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs system self;
        };

        modules = [
          ../config
        ];
      }).neovim;
  };
}
