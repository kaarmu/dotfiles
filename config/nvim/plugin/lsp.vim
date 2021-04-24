

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_keyword_length = 2

let g:fsharp_interactive_bin = 'dotnet fsi'

lua require('lsp')
