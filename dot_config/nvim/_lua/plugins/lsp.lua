return {
	{ "neovim/nvim-lspconfig" },
	{ 
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
}
