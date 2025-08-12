require("config.lazy")

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "javascript", "typescript", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
	--  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("neo-tree").setup({
  close_if_last_window = true,
  open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
  window = {
    position = "left",
    width = "20%" -- adjust width as you need.
  },
  filesystem = {
    follow_current_file = {
      enable = true,
    },
    window = {
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
      }
}
    
	filtered_items = {
		visible = true, -- If set to true, "hide" means "dimmed out"
		hide_dotfiles = false,
		hide_gitignored = false,
	},

  }
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree")
		vim.cmd("set tabstop=4")
		vim.cmd("set shiftwidth=4")
	end,
})
