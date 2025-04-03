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
        -- Uncomment and set the correct path if using a Java agent
        "-javaagent:/library/java/lombok.jar",
        "-jar", "/library/java/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuration", "/library/java/config_linux",
        "-data", vim.fn.expand("~/.cache/jdtls-workspace") .. workspace_dir,
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    capabilities = capabilities
}
require('jdtls').start_or_attach(config)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})


