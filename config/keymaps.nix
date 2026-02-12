{
  vim.keymaps = [
    {
      key = "n";
      mode = "n";
      silent = true;
      action = "nzzzv";
    }

    {
      key = "N";
      mode = "n";
      silent = true;
      action = "Nzzzv";
    }

    {
      key = "<C-u>";
      mode = ["n" "x"];
      silent = true;
      action = "<C-u>zz";
    }

    {
      key = "<C-d>";
      mode = ["n" "x"];
      silent = true;
      action = "<C-d>zz";
    }
  ];
}
