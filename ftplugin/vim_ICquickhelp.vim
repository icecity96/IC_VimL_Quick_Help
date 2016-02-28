if exists("g:IC_vimL_quick_help")
	finish
endif

let g:IC_vimL_quick_help = 1
"select help language default is English
if !exists("g:IC_quick_help_language")
	let g:IC_quick_help_language = "@en"
endif

"defaut map to start quick help
if !exists("g:IC_quick_help_start")
	let g:IC_quick_help_start = '<leader>h'
endif

function! ICQuickHelp()
	let line	= getline(".")
	let pos		= col(".")
	let after	= strpart(line, pos)
	let follow_chars = split(after,'\w')
	"get current word under cursor
	let word	= expand("<cword>")
	if follow_chars[0][0] == '('
		let word.= '()'
	endif 
	exec "help ".word.g:IC_quick_help_language
endfunction

exec "nnoremap ".g:IC_quick_help_start." :call ICQuickHelp()<CR>"
