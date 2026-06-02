return {
  { "catppuccin/nvim" },
  lazy = false,
  name = "catppuccin",
  -- Add the options block below to enable transparency
  opts = {
    transparent_background = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
