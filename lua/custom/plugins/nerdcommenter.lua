-- Create default mappings
vim.g.NERDCreateDefaultMappings = 0

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1

-- Set a language to use its alternate delimiters by default
vim.g.NERDAltDelims_java = 1

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1

-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1

-- Enable NERDCommenterToggle to check all selected lines is commented or not 
vim.g.NERDToggleCheckAllLines = 1

-- Binds
vim.api.nvim_set_keymap("v", "<C-/>", "<plug>NERDCommenterToggle", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-/>", "<plug>NERDCommenterToggle", { noremap = true, silent = true })

