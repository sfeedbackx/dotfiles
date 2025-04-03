return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "ts_ls", "eslint" }, -- Added eslint
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local cmp_lsp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = cmp_lsp_status and cmp_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

      local lspconfig_status, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status then return end

      -- Common on_attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
      end

      -- Optional: Configure diagnostics globally
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
      })

      -- Setup language servers
      local servers = { "clangd", "ts_ls", "eslint", "lua_ls" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end,
  },
}
