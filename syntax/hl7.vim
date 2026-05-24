if exists("b:current_syntax")
  finish
endif

" 1. Nomes dos Segmentos (Ex: MSH, PID, OBX, ORC - 3 letras/números no início da linha)
syn match hl7Segment "^[A-Z][A-Z0-9]\{2\}"

" 2. O separador principal de campos (O Pipe)
syn match hl7FieldSep "|"

" 3. O separador de componentes (O Chapéu)
syn match hl7CompSep "\^"

" 4. O separador de repetição (O Til)
syn match hl7RepSep "\~"

" 5. O separador de subcomponentes (O E comercial)
syn match hl7SubCompSep "&"

" 6. Caracteres de escape em HL7 (Ex: \F\, \S\, \.br\)
syn match hl7Escape "\\.\{-}\\"

hi def link hl7Segment       Keyword
hi def link hl7FieldSep      Operator 
hi def link hl7CompSep       Type 
hi def link hl7RepSep        Special
hi def link hl7SubCompSep    Constant
hi def link hl7Escape        String

let b:current_syntax = "hl7"
