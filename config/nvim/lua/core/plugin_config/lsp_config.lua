local lspconfig = require('lspconfig')

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)


lspconfig.bashls.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.pyright.setup({})
lspconfig.omnisharp.setup({})
