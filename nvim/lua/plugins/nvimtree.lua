return {
    { "nvim-tree/nvim-web-devicons", dependencies = "nvim-tree/nvim-tree.lua" },
    {
        "nvim-tree/nvim-tree.lua",
        keys = { { "<leader>e", "<cmd>NvimTreeToggle<CR>" } },
        config = function()
            require("nvim-tree").setup {
                update_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                    ignore_list = {},
                },
                view = {
                    width = 30,
                    side = "left",
                },
                renderer = {
                    indent_markers = {
                        enable = false,
                        icons = {
                            corner = "└",
                            edge = "│",
                            item = "│",
                            none = " ",
                        },
                    },
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            git = {
                                unstaged = "",
                                staged = "S",
                                unmerged = "",
                                renamed = "➜",
                                deleted = "",
                                untracked = "U",
                                ignored = "◌",
                            },
                            folder = {
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                            },
                        },
                    },
                    highlight_git = true,
                    root_folder_modifier = ":t",
                },

                on_attach = function(bufnr)
                    local api = require('nvim-tree.api')

                    local function opts(desc)
                        return {
                            desc = 'nvim-tree: ' .. desc,
                            buffer = bufnr,
                            noremap = true,
                            silent = true,
                            nowait = true
                        }
                    end

                    api.config.mappings.default_on_attach(bufnr)
                    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
                    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
                    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close'))
                    vim.keymap.set('n', 'v', api.node.open.vertical, opts('VSplit'))
                    vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
                end,
            }
        end
    }
}
