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
  }: let
    # Base Neovim config
    baseNvimConfig = inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit inputs system self;
      };

      modules = [
        ../config
      ];
    };
  in {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues self.overlays;
      config.allowUnfree = true;
    };

    packages = {
      default = baseNvimConfig.neovim;

      # Expose a function to extend the base config
      extend = attrs:
        inputs.nvf.lib.neovimConfiguration
        (lib.recursiveUpdate baseNvimConfig {
          modules = baseNvimConfig.modules ++ (attrs.modules or []);
          extraSpecialArgs = lib.recursiveUpdate baseNvimConfig.extraSpecialArgs (attrs.extraSpecialArgs or {});
        }).neovim;
    };
  };
}
