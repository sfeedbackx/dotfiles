local M = {}

function M.setup()
	-- Get Mason paths
	local mason_registry = require("mason-registry")

	if not mason_registry.is_installed("jdtls") then
		vim.notify("jdtls is not installed. Run :MasonInstall jdtls", vim.log.levels.ERROR)
		return
	end

	--get jdtls path
	local jdtls_install_path = vim.fn.expand("$MASON/packages/jdtls")

	-- Find the equinox launcher jar (version may vary)
	local launcher_jar = vim.fn.glob(jdtls_install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

	if launcher_jar == "" then
		vim.notify("Could not find equinox launcher jar in " .. jdtls_install_path, vim.log.levels.ERROR)
		return
	end

	-- Determine OS config directory
	local os_config = "config_linux"
	if vim.fn.has("mac") == 1 then
		os_config = "config_mac"
	elseif vim.fn.has("win32") == 1 then
		os_config = "config_win"
	end
	local config_path = jdtls_install_path .. "/" .. os_config

	-- Path to Lombok jar
	local lombok_path = jdtls_install_path .. "/lombok.jar"

	-- Get capabilities from blink.cmp
	local capabilities = require("blink.cmp").get_lsp_capabilities()
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
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",
			"-javaagent:" .. lombok_path,
			"-jar",
			launcher_jar,
			"-configuration",
			config_path,
			"-data",
			workspace_dir,
		},
		root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
		capabilities = capabilities,
	}

	require("jdtls").start_or_attach(config)
end

return M
