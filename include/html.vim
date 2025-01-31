syn include @razorhtmljs syntax/javascript.vim | unlet b:current_syntax
syn include @razorhtmlcss syntax/css.vim

syn region razorhtmlTag matchgroup=razorhtmlTag start=/\%#=1<\a[[:alnum:].:_-]*/ end=/\%#=1>/ contains=razorhtmlAttribute
syn region razorhtmlEndTag start=/\%#=1<\// end=/\%#=1>/

syn match razorhtmlAttribute /\%#=1[^"'>/=[:space:]]\+/ contained nextgroup=razorhtmlAttributeOperator skipwhite skipnl
syn match razorhtmlAttributeOperator /\%#=1=/ contained nextgroup=razorhtmlValue skipwhite skipnl

syn match razorhtmlValue /\%#=1[^[:space:]>]\+/ contained contains=razorhtmlEntityReference,razorhtmlCharacterReference

syn region razorhtmlValue matchgroup=razorhtmlValueDelimiter start=/\%#=1"/ end=/\%#=1"/ contained contains=razorhtmlEntityReference,razorhtmlCharacterReference
syn region razorhtmlValue matchgroup=razorhtmlValueDelimiter start=/\%#=1'/ end=/\%#=1'/ contained contains=razorhtmlEntityReference,razorhtmlCharacterReference

syn match razorhtmlEntityReference /\%#=1&\a[[:alnum:]]*;/
syn match razorhtmlCharacterReference /\%#=1&#\d\+;/
syn match razorhtmlCharacterReference /\%#=1&#x\x\+;/

syn region razorhtmlTag matchgroup=razorhtmlTag start=/\%#=1<script\>/ end=/\%#=1>/ contains=razorhtmlAttribute nextgroup=razorhtmlScript,razorhtmlEndTag skipnl
syn region razorhtmlScript start=/\%#=1/ matchgroup=razorhtmlEndTag end=/\%#=1<\/script>/ contained keepend transparent contains=@razorhtmljs
syn match razorhtmlEndTag /\%#=1<\/script>/ contained

syn region razorhtmlTag matchgroup=razorhtmlTag start=/\%#=1<style\>/ end=/\%#=1>/ contains=razorhtmlAttribute nextgroup=razorhtmlStyle,razorhtmlEndTag skipnl
syn region razorhtmlStyle start=/\%#=1/ matchgroup=razorhtmlEndTag end=/\%#=1<\/style>/ contained transparent contains=@razorhtmlcss
syn match razorhtmlEndTag /\%#=1<\/style>/ contained

syn region razorhtmlComment matchgroup=razorhtmlCommentDelimiter start=/\%#=1<!--/ end=/\%#=1-->/
syn region razorhtmlDoctype matchgroup=razorhtmlCommentDelimiter start=/\%#=1<!\cdoctype\>/ end=/\%#=1>/

hi def link razorhtmlTag Identifier
hi def link razorhtmlEndTag razorhtmlTag
hi def link razorhtmlAttribute Keyword
hi def link razorhtmlValue String
hi def link razorhtmlValueDelimiter razorhtmlValue
hi def link razorhtmlEntityReference SpecialChar
hi def link razorhtmlCharacterReference razorhtmlEntityReference
hi def link razorhtmlComment Comment
hi def link razorhtmlCommentDelimiter razorhtmlComment
hi def link razorhtmlDoctype razorhtmlComment
