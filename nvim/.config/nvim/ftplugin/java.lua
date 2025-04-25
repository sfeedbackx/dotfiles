local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_zero = require("lsp-zero")

local on_attach = lsp_zero.default_on_attach
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ALL",
        "-Xmx1G",
        "-javaagent:/home/omega/.local/share/nvim/mason/packages/jdtls2/lombok.jar",
        "-jar",
        "/home/omega/.local/share/nvim/mason/packages/jdtls2/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
        "-configuration", "/home/omega/.local/share/nvim/mason/packages/jdtls2/config_linux",
        "-data", workspace_dir,
    },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    capabilities = capabilities,
    on_attach = on_attach,
}

require('jdtls').start_or_attach(config)
