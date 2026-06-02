return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      -- Keeps individual inner tabs clean, flat, and standard
      separator_style = "thin",

      -- REMOVED OFFSETS: Removing this block forces the bufferline to
      -- span 100% of the screen width, completely ignoring the explorer column layout.
      offsets = {},
    },
  },
}
