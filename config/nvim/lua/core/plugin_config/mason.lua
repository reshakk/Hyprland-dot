require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "bashls", "pyright", "cssls", "html", "omnisharp" }
})

-- local lspconfig = require("lspconfig")
-- require("mason-lspconfig").setup_handlers {
--   function(server_name)
--     lspconfig[server_name].setup({})
--   end,
-- }

