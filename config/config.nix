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

    searchCase = "smart";

    hideSearchHighlight = true;
    syntaxHighlighting = true;
    undoFile.enable = true;

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      # transparent = true;
    };

    statusline = {
      lualine = {
        enable = true;
        integrations = {
          breadcrumbs.nvim-navic.enable = true;
          breadcrumbs.navbuddy.enable = true;
        };
      };
    };

    filetree.neo-tree.enable = true;

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

    binds.whichKey = {
      enable = true;
      register = {
        "<leader>t" = "Test";
        "<leader>td" = "Debug";
      };
    };

    comments.comment-nvim.enable = true;
    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
        ui.autoStart = true;

        presets = {
          codelldb.enable = true;
          lldb.enable = true;
        };
      };
    };

    diagnostics = {
      enable = true;
      config = {
        signs = lib.generators.mkLuaInline ''
          {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
          }
        '';
        virtual_text = true;
        underline = true;
      };

      presets = {
        clangtidy.enable = true;
        cpplint.enable = true;

        deadnix.enable = true;

        dotenv-linter.enable = true;
        eslint_d.enable = true;
        htmlhint.enable = true;
      };

      nvim-lint.enable = true;
      nvim-lint.linters = {
        "cpp" = {};
      };
    };
    formatter = {
      conform-nvim = {
        # filetree.neo-tree.enable = true;
        enable = true;
        setupOpts.formatters_by_ft = {
          cmake = ["cmake_format"];
          # lisp = ["sbcl"];
        };

        presets = {
          biome-check.enable = true;
          biome-organize-imports.enable = true;
          biome.enable = true;

          clang-format.enable = true;

          dockerfmt.enable = true;
          just.enable = true;

          sbcl.enable = true;
          shfmt.enable = true;
        };
      };
    };

    git = {
      enable = true;
      neogit.enable = true;
    };

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
        typescript-language-server.enable = true;

        bash-language-server.enable = true;
        clangd.enable = true;
        docker-language-server.enable = true;
        gitlab-ci-ls.enable = true;
        just-lsp.enable = true;
        marksman.enable = true;
        rust-analyzer.enable = true;
        sqls.enable = true;
      };

      otter-nvim.enable = true;
    };

    repl.conjure.enable = true;

    mini = {
      ai.enable = true;
      align.enable = true;
      move.enable = true;
      basics.enable = true;
      bracketed.enable = true;
      cursorword.enable = true;
      trailspace.enable = true;
      surround.enable = true;
      pick = {
        enable = true;
        setupOpts = {
          mappings = {
            "scroll_down" = "<C-j>";
            "scroll_up" = "<C-k>";
            "scroll_left" = "<C-h>";
            "scroll_right" = "<C-l>";

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

        templates = {
          folder = "~/Vaults/Vault/Templates";
        };

        daily_notes = {
          enabled = true;
          folder = "200 Personal/Daily";
          template = "~/Vaults/Vault/Templates/Daily Note Template";
        };
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

      clojure.enable = true;

      docker = {
        enable = true;
        extraDiagnostics.enable = true;
      };

      assembly.enable = true;
      astro.enable = true;
      lua.enable = true;

      clang = {
        enable = true;

        cHeader = true;
        extraDiagnostics.enable = false; # TODO: check if annoying format warnings are gone
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

      tsx = {
        enable = true;
        treesitter.enable = true;
        extraDiagnostics.enable = true;
        extraDiagnostics.types = ["biomejs"];
        format.type = ["biome" "prettier"];
      };

      sql.enable = true;
      yaml.enable = true;
      json.enable = true;
      just.enable = true;
      xml.enable = true;

      lisp = {
        enable = true;

        format = {
          enable = true;
          type = ["emacs"];
        };
      };

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

    telescope = {
      enable = true;

      extensions = [
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
    };

    terminal = {
      toggleterm.enable = true;
      toggleterm.lazygit.enable = true;
    };

    ui = {
      # ui2.enable = true;
      borders.enable = true;
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

      crazy-coverage.enable = true;

      csvview = {
        enable = true;
        autoEnable = true;
      };

      preview.markdownPreview.enable = true;

      motion.flash-nvim.enable = true;

      multicursors.enable = true;

      oil-nvim.enable = true;

      snacks-nvim.enable = true;
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
      vim.treesitter.language.add('commonlisp', { filetypes = { 'lisp' } })

      vim.lsp.config("cl_lsp", {
        cmd = { "cl-lsp" },
        filetypes = { "lisp" },
        root_markers = { ".git" },
      })

      vim.lsp.enable("cl_lsp")

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
      require('mini.move').setup({
        mappings = {
          left = '<C-h>',
          right = '<C-l>',
          down = '<C-j>',
          up = '<C-k>',

          line_left = '<C-h>',
          line_right = '<C-l>',
          line_down = '<C-j>',
          line_up = '<C-k>',
        },

        -- Options which control moving behavior
        options = {
          -- Automatically reindent selection during linewise vertical move
          reindent_linewise = true,
        },
      })

      local externals_patterns = { 'externals', 'externals_m' }
      local function toggle_externals_filter()
        local values = require('telescope.config').values
        local current = values.file_ignore_patterns or {}
        local present = {}
        local has_externals = false
        for _, pat in ipairs(current) do
          local is_external = false
          for _, ext in ipairs(externals_patterns) do
            if pat == ext then
              is_external = true
              has_externals = true
            end
          end
          if not is_external then
            table.insert(present, pat)
          end
        end
        if not has_externals then
          for _, ext in ipairs(externals_patterns) do
            table.insert(present, ext)
          end
        end
        values.file_ignore_patterns = present
        vim.notify('Telescope: externals filter ' .. (has_externals and 'OFF' or 'ON'))
      end
      vim.keymap.set('n', '<leader>fe', toggle_externals_filter, { desc = 'Toggle externals filter in Telescope' })
    '';

    extraPackages = with pkgs; [
      cargo-nextest
    ];

    extraPlugins = {
      overseer = {
        package = pkgs.vimPlugins.overseer-nvim;
        setup = "require('overseer').setup {}";
      };

      nvim-nio = {
        package = pkgs.vimPlugins.nvim-nio;
      };
      plenary-nvim = {
        package = pkgs.vimPlugins.plenary-nvim;
      };

      neotest = {
        package = pkgs.vimPlugins.neotest;
        setup = ''
          local neotest = require("neotest")

          neotest.setup({
            adapters = {
              require("neotest-vitest"),
              -- require("neotest-bun"),
              require("neotest-rust")({ args = { "--no-capture" } }),
              require("neotest-gtest").setup({}),
              require("neotest-ctest").setup({}),
            },
          })

          local map = vim.keymap.set

          map("n", "<leader>tn", function()
            neotest.run.run()
          end, { desc = "Run nearest test" })

          map("n", "<leader>tf", function()
            neotest.run.run(vim.fn.expand("%"))
          end, { desc = "Run file tests" })

          map("n", "<leader>ta", function()
            neotest.run.run(vim.uv.cwd())
          end, { desc = "Run all tests" })

          map("n", "<leader>ts", function()
            neotest.summary.toggle()
          end, { desc = "Toggle test summary" })

          map("n", "<leader>to", function()
            neotest.output.open({ enter = true })
          end, { desc = "Open test output" })

          map("n", "<leader>tdn", function()
            neotest.run.run({ strategy = "dap" })
          end, { desc = "Debug nearest test" })

          map("n", "<leader>tdf", function()
            neotest.run.run(vim.fn.expand("%"), { strategy = "dap" })
          end, { desc = "Debug file tests" })
        '';
      };
      neotest-vitest = {
        package = pkgs.vimPlugins.neotest-vitest;
      };
      # neotest-bun = {
      #   package = pkgs.vimPlugins.neotest-bun;
      # };
      neotest-rust = {
        package = pkgs.vimPlugins.neotest-rust;
      };
      neotest-gtest = {
        package = pkgs.vimPlugins.neotest-gtest;
      };
      neotest-ctest = {
        package = pkgs.vimPlugins.neotest-ctest;
      };
    };
  };
}
