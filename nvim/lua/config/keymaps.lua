----------------------------------------------------
------------------ KEY MAPPINGS --------------------
----------------------------------------------------

-- Essentials
vim.g.mapleader = " "
    local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "source file" })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "escape to normal mode" })
vim.keymap.set("n", "Q", "<nop>", { desc = "disable Q" })

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "page down centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "page up centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous search result centered" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "join lines keep cursor" })

-- Editing
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up" })
vim.keymap.set("v", "<", "<gv", { desc = "indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "indent right and reselect" })
vim.keymap.set("n", "x", '"_x', opts) -- delete without overwriting yank
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "delete without overwriting yank" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "paste without overwriting yank" })
vim.keymap.set("v", "p", '"_dp', opts) -- paste in visual mode

-- Yanking & Clipboard
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "yank to system clipboard" })

-- Search & Replace
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "clear search highlight" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 
    { desc = "replace word under cursor globally" })

-- File Operations
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format file" })

vim.keymap.set("n", "<leader>fp", function()
    local filePath = vim.fn.expand("%:~")
    vim.fn.setreg("+", filePath)
    print("File path copied to clipboard: " .. filePath)
end, { desc = "copy file path to clipboard" })

vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make file executable" })

-- Tab Operations
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current file in new tab" })

-- Window Operations
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "equalize split sizes" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close split" })

-- System Integration
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", 
    { desc = "open new tmux session" })

vim.keymap.set("n", "<leader>re", "<cmd>restart<CR>", { desc = "restart neovim" })
