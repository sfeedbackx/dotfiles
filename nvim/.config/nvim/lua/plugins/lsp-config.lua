return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
  },
  config = function()
    local lsp = require("lsp-zero").preset("recommended")

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      local map = vim.keymap.set

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>vcs", vim.lsp.buf.workspace_symbol, opts)
      map("n", "<leader>vd", vim.diagnostic.open_float, opts)
      map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
      map("n", "<leader>vgr", vim.lsp.buf.references, opts)
      map("n", "<leader>vcr", vim.lsp.buf.rename, opts)
      map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      map("n", "[d", vim.diagnostic.goto_next, opts)
      map("n", "]d", vim.diagnostic.goto_prev, opts)

      -- Auto signature help on ( and ,
      if client.server_capabilities.signatureHelpProvider then
        vim.api.nvim_create_autocmd("TextChangedI", {
          buffer = bufnr,
          callback = function()
            local char = vim.api.nvim_get_current_line():sub(vim.api.nvim_win_get_cursor(0)[2],
              vim.api.nvim_win_get_cursor(0)[2])
            if char == "(" or char == "," then
              vim.defer_fn(vim.lsp.buf.signature_help, 100)
            end
          end,
        })
      end
    end)

    -- Simple diagnostics with rounded borders
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      float = { border = "rounded" },
      update_in_insert = false,
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, { border = "rounded" }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, { border = "rounded" }
    )

    -- Mason setup
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", "clangd", "ts_ls", "eslint",
        "rust_analyzer", "kotlin_language_server",
        "jsonls", "html", "elixirls", "tailwindcss",
        "tflint", "dockerls", "bashls",
        "marksman", "cucumber_language_server",
        "astro", "pylsp"
      },
      handlers = {
        lsp.default_setup,
      }
    })

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer",  keyword_length = 3 },
        { name = "path" },
      }),
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { { name = "path" } },
        { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
      ),
    })

    lsp.setup()
  end,
}
