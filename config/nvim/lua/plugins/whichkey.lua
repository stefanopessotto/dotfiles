return {
  { 'echasnovski/mini.nvim',       version = false },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function()
      local status_ok, which_key = pcall(require, "which-key")
      if not status_ok then
        return
      end

      local setup = {
        preset = "helix",
        plugins = {
          marks = true,        -- shows a list of marks on ' and `
          registers = true,    -- shows registers on " in NORMAL
          presets = {
            operators = false, -- operators like d, y
            motions = true,    -- help for motions
            windows = true,    -- default bindings on <c-w>
            nav = true,        -- bindings to work with windows
            z = true,          -- bindings for folds, .. prefixed with z
            g = true,          -- bindings for prefixed with g
          },
        },
        delay = 50,
        show_help = true,
        show_keys = true,

      }
      which_key.setup(setup)
    end,
  }
}
