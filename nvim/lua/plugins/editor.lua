local uv = vim.loop
local function folderExists(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory"
end
local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end
return {
  {

    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "xiyaowong/telescope-emoji.nvim",
      --"nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            initial_mode = "normal",
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
      {
        ";c",
        function()
          local telescope = require("telescope")

          local function telescope_dir_current()
            if folderExists(vim.fn.getcwd() .. "/app") then
              return "./app"
            end
            if folderExists(vim.fn.getcwd() .. "/lib") then
              return "./lib"
            end
            if folderExists(vim.fn.getcwd() .. "/src") then
              return "./src"
            end
            return "./"
          end

          telescope.extensions.file_browser.file_browser({
            path = telescope_dir_current(),
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions
      opts.defaults = {
        initial_mode = "normal",
        wrap_results = true,
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          hidden = true,
          glob_pattern = { ".git/" },
          file_ignore_patterns = { ".git/" },
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          grouped = true,
          git_status = true,
          layout_config = { height = 40 },
          select_buffer = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
        emoji = {
          action = function(emoji)
            -- argument emoji is a table.
            -- {name="", value="", cagegory="", description=""}
            --vim.fn.setreg("*", emoji.value)
            --print([[Press p or "*p to paste this emoji]] .. emoji.value)

            -- insert emoji when picked
            vim.api.nvim_put({ emoji.value }, "c", false, true)
          end,
        },
      }
      telescope.setup(opts)
      --require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("emoji")
    end,
  },
  {
    "folke/flash.nvim",
    enable = false,
  },
}
