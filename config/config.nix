{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    clipboard.enable = true;
    clipboard.registers = "unnamedplus";
    hideSearchHighlight = true;
    syntaxHighlighting = true;

    theme.enable = true;
    statusline.lualine.enable = true;

    treesitter = {
      enable = true;
      autotagHtml = true;
      context.enable = true;
      fold = true;
    };

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

    diagnostics = {
      enable = true;
      config.signs = lib.generators.mkLuaInline ''
        {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
        }
      '';
      config.virtual_text = true;
      nvim-lint.enable = true;
    };

    filetree.neo-tree.enable = true;
    formatter.conform-nvim.enable = true;
    formatter.conform-nvim.setupOpts.formatters_by_ft = {
      cmake = ["cmake_format"];
    };

    git.enable = true;
    git.neogit.enable = true;
    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lspSignature.enable = true;
      lspconfig.enable = true;
      lspkind.enable = true;
      lspsaga.enable = false;
      nvim-docs-view.enable = true;
      trouble.enable = true;
    };

    mini = {
      ai.enable = true;
      align.enable = true;
      basics.enable = true;
      bracketed.enable = true;
      cursorword.enable = true;
      trailspace.enable = true;
    };

    navigation.harpoon.enable = true;

    # notes.obsidian.enable = true;
    notes.todo-comments.enable = true;

    notify.nvim-notify.enable = true;

    projects.project-nvim.enable = true;

    session = {
      nvim-session-manager.enable = true;
      nvim-session-manager.setupOpts.autoload_mode = "GitSession";
      nvim-session-manager.setupOpts.autosave_last_session = true;
    };

    snippets.luasnip.enable = true;

    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      nix.enable = true;

      assembly.enable = true;
      astro.enable = true;
      lua.enable = true;

      clang = {
        enable = true;
        dap.enable = true;
      };

      python.enable = true;
      python.dap.enable = true;

      bash.enable = true;
      css.enable = true;
      tailwind.enable = true;
      html.enable = true;

      ts = {
        enable = true;
        treesitter.enable = true;
        extraDiagnostics.enable = true;
        extensions.ts-error-translator.enable = true;
        format.type = ["biome" "prettier"];
      };

      sql.enable = true;
      yaml.enable = true;

      markdown = {
        enable = true;
        # languages.markdown.extensions.markview-nvim.enable = true;
        extensions.render-markdown-nvim.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      rust.enable = true;
      rust.extensions.crates-nvim.enable = true;
    };

    telescope.enable = true;
    telescope.extensions = [
      {
        name = "fzf";
        packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
        setup = {
          fzf = {
            fuzzy = true;
          };
        };
      }
    ];

    lsp.lspconfig.sources.cmake = ''
      require('lspconfig').cmake.setup({
        capabilities = capabilities,
        on_attach = default_on_attach,
        cmd = {"${pkgs.cmake-language-server}/bin/cmake-language-server"}
      })
    '';

    terminal = {
      toggleterm.enable = true;
      toggleterm.lazygit.enable = true;
    };

    ui = {
      borders.enable = true;
      breadcrumbs.enable = true;
      breadcrumbs.navbuddy.enable = true;
      colorful-menu-nvim.enable = true;
      colorizer.enable = true;
      fastaction.enable = true;
      noice.enable = true;
      nvim-ufo.enable = true;
      smartcolumn.enable = true;
    };

    utility = {
      # undoFile.enable = true;

      diffview-nvim.enable = true;
      direnv.enable = true;

      images.image-nvim.enable = true;
      images.img-clip.enable = true;

      leetcode-nvim = {
        enable = true;
        setupOpts.image_support = true;
        setupOpts.lang = "cpp";
      };

      mkdir.enable = true;

      motion.flash-nvim.enable = true;

      multicursors.enable = true;

      oil-nvim.enable = true;

      snacks-nvim.enable = true;
      surround.enable = true;
      smart-splits.enable = true;

      undotree.enable = true;

      yazi-nvim.enable = true;
    };

    visuals = {
      fidget-nvim.enable = true;
      indent-blankline = {
        enable = true;
        setupOpts = {
          scope = {
            show_end = true;
            show_exact_scope = true;
            show_start = true;
          };
        };
      };
      nvim-web-devicons.enable = true;
      rainbow-delimiters.enable = true;
    };
  };
}
