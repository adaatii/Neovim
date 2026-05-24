vim.api.nvim_create_user_command("HL7", function()
    local line = vim.api.nvim_get_current_line()

    -- Ignora linhas vazias
    if line == nil or line == "" then
        print("Linha vazia. Coloque o cursor sobre um segmento HL7.")
        return
    end

    local segment_name = string.sub(line, 1, 3)

    -- O delimitador de campo padrão é o Pipe (|) e o de componente é o Chapéu (^)
    local fields = vim.split(line, "|", { plain = true })
    local output = {
        string.format("=== ANALISADOR HL7: %s ===", segment_name),
        "--------------------------------------------------",
    }

    -- MSH é um caso especial no HL7 porque o próprio primeiro "|" é o campo 1
    local is_msh = (segment_name == "MSH")
    local field_offset = is_msh and 1 or 0

    if is_msh then
        table.insert(output, string.format("%s-1 : |", segment_name))
    end

    for i, field in ipairs(fields) do
        -- Pula o nome do segmento no início do loop
        if i > 1 then
            local field_idx = i - 1 + field_offset
            -- Se não tem nada no campo, mostra vazio
            if field == "" then
                table.insert(output, string.format("%s-%d :", segment_name, field_idx))
            else
                table.insert(output, string.format("%s-%d : %s", segment_name, field_idx, field))
                -- Quebra os componentes (ex: ADT^A04^ADT_A01)
                local components = vim.split(field, "%^")
                if #components > 1 then
                    for j, comp in ipairs(components) do
                        local prefix = (j == #components) and " └ " or " ├ "
                        table.insert(output, string.format("%s%s-%d.%d : %s", prefix, segment_name, field_idx, j, comp))
                    end
                end
            end
        end
    end

    -- Cria uma janela vertical na direita (vsplit) e joga o resultado nela
    vim.cmd("botright 15split")
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(false, true) -- false=não lista nos buffers, true=scratch (temporário)

    vim.api.nvim_win_set_buf(win, buf)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)

    -- Define o buffer como somente leitura para você poder fechar com 'q' rapidamente
    vim.bo[buf].modifiable = false
    vim.keymap.set('n', 'q', '<cmd>q<cr>', { buffer = buf, silent = true })

end, { desc = "Quebra a linha HL7 atual em uma árvore de campos" })
