local success, data =  pcall(function()
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


	vim.keymap.set("n", "J", "mzJ`z")
	-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
	-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

	-- allow movement keys
	vim.keymap.set("i", "<C-h>", "<Left>")
	vim.keymap.set("i", "<C-l>", "<Right>")
	vim.keymap.set("i", "<C-j>", "<Down>")
	vim.keymap.set("i", "<C-k>", "<Up>")

	vim.keymap.set("x", "<leader>p", "\"_dP")

	vim.keymap.set("n", "<leader>y", "\"+y")
	vim.keymap.set("v", "<leader>y", "\"+y")
	vim.keymap.set("n", "<leader>Y", "\"+Y")

	vim.keymap.set("n", "<leader>d", "\"_d")
	vim.keymap.set("v", "<leader>d", "\"_d")

	vim.keymap.set("n", "Q", "<nop>")

	vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
	vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
	vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
	vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


	-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
	vim.keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { silent = true })

	-- Freezes on windows
	vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<nop>")

	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
end)

if not success then
	print("!!! Failed to set keymaps !!!\n\n", data)
end
