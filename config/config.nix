{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers = {
        xclip.enable = true;
        wl-copy.enable = true;
      };
    };
    options = {
      foldenable = false;
      foldmethod = "manual";
    };

    globals.vim_markdown_folding_disable = 1;

    viAlias = true;
    vimAlias = true;

    hideSearchHighlight = true;
    syntaxHighlighting = true;
    undoFile.enable = true;

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      # transparent = true;
    };

    statusline.lualine.enable = true;

    treesitter = {
      enable = true;
      autotagHtml = true;
      context.enable = true;
      fold = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;

      textobjects = {
        enable = true;
        setupOpts = {
          # select = {
          #   enable = true;
          #   keymaps = {
          #     af = "@function.outer";
          #   };
          #   lookahead = true;
          # };
        };
      };
    };

    autocomplete.enableSharedCmpSources = true;
    # autocomplete.blink-cmp.enable = true;
    # autocomplete.blink-cmp.friendly-snippets.enable = true;

    autocomplete.nvim-cmp.enable = true;

    spellcheck = {
      enable = true;
      languages = [
        "en"
        "pl"
      ];
      # programmingWordlist.enable = true;
      # vim-dirtytalk.enable = true;
    };

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

    # filetree.neo-tree.enable = true;
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
      presets = {
        tailwindcss-language-server.enable = true;
        bash-language-server.enable = true;
        clangd.enable = true;
      };

      otter-nvim.enable = true;
    };

    mini = {
      ai = {
        enable = true;

        # setupOpts = {
        #   mappings = {
        #     "around" = "a";
        #     "inside" = "i";
        #
        #     around_next = "an";
        #     inside_next = "in";
        #     around_last = "al";
        #     inside_last = "il";
        #
        #     goto_left = "g[";
        #     goto_right = "g]";
        #   };
        #
        #   custom_textobjects = {
        #     "f" = "require('mini.ai').gen_spec.function_call({ name_pattern = '[%w_]' })";
        #     "F" = "require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' })";
        #     # f = [
        #     #   ''
        #     #     MiniAi.gen_spec.treesitter({
        #     #       a = '@function.outer',
        #     #       i = '@function.inner',
        #     #     })
        #     #   ''
        #     #   "cpp"
        #     # ];
        #   };
        # };
      };
    };
    mini = {
      # ai.enable = true;
      align.enable = true;
      basics.enable = true;
      bracketed.enable = true;
      cursorword.enable = true;
      trailspace.enable = true;
      pick = {
        enable = true;
        setupOpts = {
          mappings = {
            "refine" = "<C-f>";
            "refine_marked" = "<M-f>";
          };
        };
      };
      extra.enable = true;
    };

    navigation.harpoon.enable = true;

    notes.obsidian = {
      enable = true;
      setupOpts = {
        "workspaces" = [
          {
            name = "personal";
            path = "~/Vaults/Vault";
          }
        ];
      };
    };

    notes.todo-comments.enable = true;

    notify.nvim-notify.enable = true;

    projects.project-nvim.enable = true;

    session = {
      nvim-session-manager = {
        enable = true;
        setupOpts.autoload_mode = "GitSession";
        setupOpts.autosave_last_session = true;
      };
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
      make.enable = true;
      cmake.enable = true;

      python.enable = true;
      python.dap.enable = true;

      bash.enable = true;
      css.enable = true;
      html.enable = true;

      typescript = {
        enable = true;
        treesitter.enable = true;
        extraDiagnostics.enable = true;
        extensions.ts-error-translator.enable = true;

        extraDiagnostics.types = [
          "biomejs"
          "eslint_d"
        ];
        format.type = ["biome" "prettier"];
      };

      sql.enable = true;
      yaml.enable = true;
      json.enable = true;
      xml.enable = true;

      markdown = {
        enable = true;
        # languages.markdown.extensions.markview-nvim.enable = true;
        extensions.render-markdown-nvim.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      tex.enable = true;
      toml.enable = true;

      rust = {
        enable = true;
        dap.enable = true;
        extensions.crates-nvim.enable = true;
      };
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

    terminal = {
      toggleterm.enable = true;
      toggleterm.lazygit.enable = true;
    };

    ui = {
      # ui2.enable = true;
      borders.enable = true;
      breadcrumbs.enable = true;
      breadcrumbs.navbuddy.enable = true;
      colorful-menu-nvim.enable = true;
      colorizer.enable = true;
      fastaction.enable = true;
      noice.enable = true;
      nvim-ufo.enable = true;
      smartcolumn.enable = true;
      nvim-highlight-colors.enable = true;
      nvim-highlight-colors.setupOpts.render = "virtual";
    };

    utility = {
      diffview-nvim.enable = true;
      direnv.enable = true;
      outline.aerial-nvim.enable = true;

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

      grug-far-nvim.enable = true;
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

    luaConfigPost = ''
      local gen_spec = require('mini.ai').gen_spec
      require('mini.ai').setup({
        custom_textobjects = {
          -- Tweak argument to be recognized only inside `()` between `;`
          a = gen_spec.argument({ brackets = { '%b()' }, separator = ';' }),

          -- Tweak function call to not detect dot in function name
          f = gen_spec.function_call({ name_pattern = '[%w_]' }),

          -- Function definition (needs treesitter queries with these captures)
          F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),

          -- Make `|` select both edges in non-balanced way
          ['|'] = gen_spec.pair('|', '|', { type = 'non-balanced' }),
        }
      })
    '';
  };
}
