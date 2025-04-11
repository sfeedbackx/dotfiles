local capabilities = require('cmp_nvim_lsp').default_capabilities()
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ALL",
        "-Xmx1G",
        "-javaagent:/home/omega/.local/share/nvim/mason/packages/jdtls/lombok.jar",
        "-jar", "/home/omega/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
        "-configuration", "/home/omega/.local/share/nvim/mason/packages/jdtls/config_linux",
        "-data", vim.fn.expand("~/.cache/jdtls-workspace/") .. workspace_dir,
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    capabilities = capabilities,
}
require('jdtls').start_or_attach(config)

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {})
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})

