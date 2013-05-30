"
"
let g:tex_flavor='latex'
set sw=2
set iskeyword+=:
"
"let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_DefaultTargetFormat = 'dvi'
"
"let g:Tex_CompileRule_pdf = 'pdflatex --shell-escape'
"let g:Tex_CompileRule_dvi = 'simpdftexnodel latex --maxpfb --extratexopts "--shell-escape --interaction=nonstopmode --src-specials --synctex=1"'
let g:Tex_CompileRule_dvi = 'simpdftex latex --maxpfb --extratexopts "-synctex=1"'
let g:Tex_ViewRule_pdf = "Preview"
let g:Tex_ViewRule_ps  = "Skim"
"let g:Tex_ViewRuleComplete_dvi = "open -a /Applications/Preview.app $*.pdf"
let g:Tex_ViewRule_dvi = "Skim"
"let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ViewRuleComplete_dvi = "open -a Skim $*.pdf"
"let g:Tex_MultiplteCompileFormats = 'dvi,pdf'

let g:Tex_IgnoredWarnings =
       \'Underfull'."\n".
       \'Overfull'."\n".
       \'specifier changed to'."\n".
       \'You have requested'."\n".
       \'Missing number, treated as zero'."\n".
       \'There were undefined references'."\n".
       \'Citation %.%# undefined'."\n".
       \'LaTeX Font Warning'

let g:Tex_IgnoreLevel = 8

let g:Tex_Env_figure = "\\begin{figure}[<++>]\<CR>\\centering\<CR>\\includegraphics[<++>]{<+file+>}\<CR>\\caption{<+caption text+>}\<CR>\\label{fig:<+label+>}\<CR>\\end{figure}<++>"
