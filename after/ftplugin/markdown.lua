-- Desliga o Treesitter e força o motor de sintaxe clássico do Vim
vim.schedule(function()
    vim.treesitter.stop(0) 
    vim.bo.syntax = "markdown"
    
    -- A MÁGICA: Força o Neovim a ler o arquivo desde o começo 
    -- para nunca mais perder o contexto do HTML e não esquecer as cores
    vim.cmd("syntax sync fromstart")
end)
