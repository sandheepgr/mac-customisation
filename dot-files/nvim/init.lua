-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Make background transparent for Normal windows, floating windows, and menus
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE", ctermbg = "NONE" })

-- Make the inactive window also transparent
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
