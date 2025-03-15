return {
   {
      "sainnhe/gruvbox-material",
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
         -- Set the background option
         vim.g.gruvbox_material_background = "hard" -- Options: "hard", "medium", "soft"

         -- Set the foreground option for better contrast
         vim.g.gruvbox_material_foreground = "material" -- Options: "material", "mix", "original"

         -- Enable italics
         vim.g.gruvbox_material_enable_italic = 1

         -- Disable bold style
         vim.g.gruvbox_material_disable_italic_comment = 0

         -- Additional customization options
         vim.g.gruvbox_material_better_performance = 1
         vim.g.gruvbox_material_transparent_background = 0 -- Set to 1 for transparent background

         -- load the colorscheme
         vim.cmd([[colorscheme gruvbox-material]])
      end,
   },
}
