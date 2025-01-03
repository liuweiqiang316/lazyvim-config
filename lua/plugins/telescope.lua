return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>;",
      mode = { "n" },
      function()
        require("telescope.builtin").command_history()
      end,
    },
    { "<leader>sg", mode = { "n" }, false },
    {
      "<leader>sg",
      mode = { "n" },
      function()
        require("telescope.builtin").live_grep({
          additional_args = { "--no-ignore", "--hidden" },
          prompt_title = "Live Grep With Hidden Files",
        })
      end,
      desc = "Live Grep With Hidden Files",
    },
    {
      "<leader>sv",
      mode = { "n", "v" },
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Live Grep Under Cursor or Visual",
    },
    { "<leader>ff", mode = { "n" }, false },
    {
      "<leader>ff",
      mode = { "n" },
      function()
        require("telescope.builtin").find_files({
          no_ignore = true,
          prompt_title = "Find Files no_ignore",
        })
      end,
      desc = "Find Files no_ignore",
    },
    {
      "<C-p>",
      mode = { "n" },
      function()
        require("telescope.builtin").buffers({
          sort_mru = true,
          sort_lastused = true,
          ignore_current_buffer = true,
          prompt_title = "Switch Opened Buffer",
        })
      end,
      desc = "Switch Opened Buffer",
    },
  },
  opts = {
    defaults = {
      dynamic_preview_title = true,
      path_display = { "filename_first" },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          width = 0.88,
          height = 0.88,
        },
      },
      mappings = {
        i = {
          ["<c-v>"] = false,
        },
      },
    },
    pickers = {
      find_files = {
        mappings = {
          n = {
            ["cd"] = function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              local dir = vim.fn.fnamemodify(selection.path, ":p:h")
              require("telescope.actions").close(prompt_bufnr)
              -- Depending on what you want put `cd`, `lcd`, `tcd`
              vim.cmd(string.format("silent lcd %s", dir))
            end,
          },
        },
      },
    },
  },
}
