{ pkgs, lib, ... }:
{
  config.vim = {
    clipboard.enable = true;
    clipboard.registers = "unnamedplus";
    hideSearchHighlight = true;
    syntaxHighlighting = true;

    theme.enable = true;
    statusline.lualine.enable = true;
    treesitter.enable = true;
    treesitter.autotagHtml = true;
    treesitter.context.enable = true;
    treesitter.fold = true;

    autocomplete.enableSharedCmpSources = true;
    # autocomplete.blink-cmp.enable = true;
    # autocomplete.blink-cmp.friendly-snippets.enable = true;

    autocomplete.nvim-cmp.enable = true;

    spellcheck.enable = true;
    spellcheck.languages = [
      "en"
      "pl"
    ];

    autopairs.nvim-autopairs.enable = true;
    binds.whichKey.enable = true;

    comments.comment-nvim.enable = true;

    debugger.nvim-dap.enable = true;
    debugger.nvim-dap.ui.enable = true;

    diagnostics.enable = true;
    diagnostics.config.signs = lib.generators.mkLuaInline ''
      {
        [vim.diagnostic.severity.ERROR] = "󰅚 ",
        [vim.diagnostic.severity.WARN] = "󰀪 ",
      }
    '';
    diagnostics.config.virtual_text = true;
    diagnostics.nvim-lint.enable = true;

    filetree.neo-tree.enable = true;
    formatter.conform-nvim.enable = true;
    git.enable = true;
    git.neogit.enable = true;

    lsp.enable = true;
    lsp.formatOnSave = true;
    lsp.inlayHints.enable = true;
    lsp.lspSignature.enable = true;
    lsp.lspconfig.enable = true;
    lsp.lspkind.enable = true;
    lsp.lspsaga.enable = true;
    lsp.nvim-docs-view.enable = true;
    lsp.trouble.enable = true;

    mini.ai.enable = true;
    mini.align.enable = true;
    mini.basics.enable = true;
    mini.bracketed.enable = true;
    mini.cursorword.enable = true;
    mini.trailspace.enable = true;

    navigation.harpoon.enable = true;

    # notes.obsidian.enable = true;
    notes.todo-comments.enable = true;

    notify.nvim-notify.enable = true;

    projects.project-nvim.enable = true;
    session.nvim-session-manager.enable = true;

    snippets.luasnip.enable = true;

    languages.enableDAP = true;
    languages.enableExtraDiagnostics = true;
    languages.enableFormat = true;
    languages.enableTreesitter = true;

    languages.nix.enable = true;

    languages.assembly.enable = true;
    languages.astro.enable = true;
    languages.lua.enable = true;

    languages.clang.enable = true;
    languages.clang.dap.enable = true;

    languages.python.enable = true;
    languages.python.dap.enable = true;

    languages.bash.enable = true;
    languages.css.enable = true;
    languages.tailwind.enable = true;
    languages.html.enable = true;
    languages.ts.enable = true;
    languages.ts.extensions.ts-error-translator.enable = true;
    languages.sql.enable = true;
    languages.yaml.enable = true;

    languages.markdown.enable = true;
    # languages.markdown.extensions.markview-nvim.enable = true;
    languages.markdown.extensions.render-markdown-nvim.enable = true;
    languages.markdown.lsp.enable = true;
    languages.markdown.treesitter.enable = true;

    languages.rust.enable = true;
    languages.rust.crates.enable = true;

    telescope.enable = true;
    telescope.extensions = [
      {
        name = "fzf";
        packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
        setup = {
          fzf = {
            fuzzy = true;
          };
        };
      }
    ];

    terminal.toggleterm.enable = true;
    terminal.toggleterm.lazygit.enable = true;

    ui.borders.enable = true;
    ui.breadcrumbs.enable = true;
    ui.breadcrumbs.navbuddy.enable = true;
    ui.colorful-menu-nvim.enable = true;
    ui.colorizer.enable = true;
    ui.fastaction.enable = true;
    ui.noice.enable = true;
    ui.nvim-ufo.enable = true;
    ui.smartcolumn.enable = true;

    # undoFile.enable = true;

    utility.diffview-nvim.enable = true;
    utility.direnv.enable = true;
    utility.images.image-nvim.enable = true;
    utility.images.img-clip.enable = true;

    utility.leetcode-nvim.enable = true;
    utility.leetcode-nvim.setupOpts.image_support = true;
    utility.leetcode-nvim.setupOpts.lang = "cpp";

    utility.mkdir.enable = true;

    utility.motion.flash-nvim.enable = true;

    utility.multicursors.enable = true;

    utility.oil-nvim.enable = true;

    utility.snacks-nvim.enable = true;
    utility.surround.enable = true;

    utility.undotree.enable = true;

    utility.yazi-nvim.enable = true;

    visuals.fidget-nvim.enable = true;
    visuals.indent-blankline.enable = true;
    visuals.indent-blankline.setupOpts.scope.show_end = true;
    visuals.indent-blankline.setupOpts.scope.show_exact_scope = true;
    visuals.indent-blankline.setupOpts.scope.show_start = true;
    visuals.nvim-web-devicons.enable = true;
    visuals.rainbow-delimiters.enable = true;
  };
}
