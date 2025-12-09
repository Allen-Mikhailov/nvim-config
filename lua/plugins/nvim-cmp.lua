return {
	{'neovim/nvim-lspconfig', tag = 'v1.8.0', pin = true},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	
	-- Type checking for typescript
	{
	  "jose-elias-alvarez/typescript.nvim",
	  config = function()
		require("typescript").setup({
		  server = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		  },
		})
	  end,
	}
}
