if exists("b:current_syntax")
  finish
endif

" 1. Entidades principais do FSH (Profile, Extension, Instance, etc.)
syn match fshEntity "^\(Profile\|Extension\|Instance\|ValueSet\|CodeSystem\|RuleSet\|Mapping\|Logical\|Invariant\|Alias\|InstanceOf\):"

" 2. Atributos base (Parent, Id, Title, Description, etc.)
syn match fshProperty "^\(Parent\|Id\|Title\|Description\|Severity\|Expression\|XPath\|Source\|Target\):"

" 3. O asterisco que define as regras do FHIR
syn match fshRuleBullet "^\s*\*\s"

" 4. Símbolos e Operadores matemáticos/atribuição
syn match fshOperator "="
syn match fshOperator "->"
syn match fshOperator "\^"

" 5. Textos entre aspas (Strings)
syn region fshString start='"' end='"'

" 6. Comentários (linhas começando com // ou blocos /* */)
syn match fshComment "//.*$"
syn region fshBlockComment start="/\*" end="\*/"

" 7. Números e Booleanos
syn match fshNumber "\<\d\+\>"
syn keyword fshBoolean true false

" ==========================================
" LIGAR AS REGRAS AOS GRUPOS DE CORES DO TEMA
" ==========================================
hi def link fshEntity        Keyword
hi def link fshProperty      Type
hi def link fshRuleBullet    Special
hi def link fshOperator      Operator
hi def link fshString        String
hi def link fshComment       Comment
hi def link fshBlockComment  Comment
hi def link fshNumber        Number
hi def link fshBoolean       Boolean

let b:current_syntax = "fsh"
