{pkgs, ...}: {
  config.vim = {
    enableLuaLoader = true;

    extraPackages = with pkgs; [
      ueberzugpp
    ];
  };
}
