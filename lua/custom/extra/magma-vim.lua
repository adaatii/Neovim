function MagmaInitPython()
    vim.cmd[[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]]
end

function MagmaInitCSharp()
    vim.cmd[[
    :MagmaInit .net-csharp
    :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
    ]]
end

function MagmaInitFSharp()
    vim.cmd[[
    :MagmaInit .net-fsharp
    :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
    ]]
end

vim.cmd[[
:command MagmaInitPython lua MagmaInitPython()
:command MagmaInitCSharp lua MagmaInitCSharp()
:command MagmaInitFSharp lua MagmaInitFSharp()
]]

vim.keymap.set("n", "<LocalLeader>r", "<cmd>MagmaEvaluateOperator<cr>", { desc = "Evaluate Operator", silent = true, expr = true })
vim.keymap.set("n", "<LocalLeader>rr", "<cmd>MagmaEvaluateLine<cr>", { desc = "Evaluate Line", silent = true })
vim.keymap.set("x", "<LocalLeader>r", "<cmd><C-u>MagmaEvaluateVisual<cr>", { desc = "Evaluate Visual", silent = true })
vim.keymap.set("n", "<LocalLeader>rc", "<cmd>MagmaReevaluateCell<cr>", { desc = "Reevaluate Cell", silent = true })
vim.keymap.set("n", "<LocalLeader>rd", "<cmd>MagmaDelete<cr>", { desc = "Delete Magma Output", silent = true })
vim.keymap.set("n", "<LocalLeader>ro", "<cmd>MagmaShowOutput<cr>", { desc = "Show Magma Output", silent = true })

vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "ueberzug"

