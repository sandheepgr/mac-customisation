return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- 1. Clear default section triangles so they don't insert artifacts
      opts.options.section_separators = { left = "", right = "" }

      -- 2. Perfectly apply the smooth outer cap on the far left (NORMAL mode)
      if opts.sections and opts.sections.lualine_a and opts.sections.lualine_a[1] then
        opts.sections.lualine_a[1] = {
          type(opts.sections.lualine_a[1]) == "table" and opts.sections.lualine_a[1][1] or opts.sections.lualine_a[1],
          separator = { left = "" },
        }
      end

      -- 3. Perfectly apply the smooth outer cap on the far right (Time block)
      if opts.sections and opts.sections.lualine_z and opts.sections.lualine_z[1] then
        opts.sections.lualine_z[1] = {
          type(opts.sections.lualine_z[1]) == "table" and opts.sections.lualine_z[1][1] or opts.sections.lualine_z[1],
          separator = { right = "" },
        }
      end
    end,
  },
}
