return {
{
  "luukvbaal/statuscol.nvim",
   config = function()
      local builtin = require("statuscol.builtin")

      require("statuscol").setup({
        -- relculright = true,
		ft_ignore = { "neo-tree", "Neotree" },  -- ← THIS FIXES IT
        segments = {
          { sign = { name = { ".*" } }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        }
      })
    end 
}
}
