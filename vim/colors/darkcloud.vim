"========================"
"                        "
"  Darkcloud Vim Theme:  "
"                        "
"  Maintainer: Prurigro  "
"  License: MIT          "
"                        "
"========================"
"
" Acknowledgements:
"  I found the jellybeans theme part way through creating
"  this one and liked how it scripted compatibility between
"  cterm and gui, so I stripped its colours and ported
"  my own in, using jellybeans as a functional template.
"
"  As referenced in the original jellybean theme, the set
"  of color approximation functions were creaed by Henry
"  So, Jr. and David Liang
"

"remove all the colours before writing our own
hi clear
if exists("syntax_on")
    syntax reset
endif

if has("gui_running") || &t_Co == 88 || &t_Co == 256
    let s:low_color = 0
else
    let s:low_color = 1
endif

let colors_name = "darkcloud"

"color approximation funcionality{{{
    "approximate the grey index from a given grey level
    fun! s:grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    "find the grey level for a given grey index
    fun! s:grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    "find the palette index for a given grey index
    fun! s:grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    "approximate the color index from a given color level
    fun! s:rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    "find the color level for a given color index
    fun! s:rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    "find the palette index for a set of RGB color indices
    fun! s:rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    "find the palette index to approximate a set of RGB color levels
    fun! s:color(r, g, b)
        "get the closest grey
        let l:gx = s:grey_number(a:r)
        let l:gy = s:grey_number(a:g)
        let l:gz = s:grey_number(a:b)

        "get the closest color
        let l:x = s:rgb_number(a:r)
        let l:y = s:rgb_number(a:g)
        let l:z = s:rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            let l:dgr = s:grey_level(l:gx) - a:r
            let l:dgg = s:grey_level(l:gy) - a:g
            let l:dgb = s:grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = s:rgb_level(l:gx) - a:r
            let l:dg = s:rgb_level(l:gy) - a:g
            let l:db = s:rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                return s:grey_color(l:gx)
            else
                return s:rgb_color(l:x, l:y, l:z)
            endif
        else
            return s:rgb_color(l:x, l:y, l:z)
        endif
    endfun

    "find the palette index to approximate the 'rrggbb' hex string
    fun! s:rgb(rgb)
        let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
        let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
        let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
        return s:color(l:r, l:g, l:b)
    endfun

    "sets the highlighting for the given group
    fun! s:X(group, fg, bg, attr, lcfg, lcbg)
        if s:low_color
            let l:fge = empty(a:lcfg)
            let l:bge = empty(a:lcbg)

            if !l:fge && !l:bge
                exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=".a:lcbg
            elseif !l:fge && l:bge
                exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=NONE"
            elseif l:fge && !l:bge
                exec "hi ".a:group." ctermfg=NONE ctermbg=".a:lcbg
            endif
        else
            let l:fge = empty(a:fg)
            let l:bge = empty(a:bg)

            if !l:fge && !l:bge
                exec "hi ".a:group." guifg=#".a:fg." guibg=#".a:bg." ctermfg=".s:rgb(a:fg)." ctermbg=".s:rgb(a:bg)
            elseif !l:fge && l:bge
                exec "hi ".a:group." guifg=#".a:fg." guibg=NONE ctermfg=".s:rgb(a:fg)." ctermbg=NONE"
            elseif l:fge && !l:bge
                exec "hi ".a:group." guifg=NONE guibg=#".a:bg." ctermfg=NONE ctermbg=".s:rgb(a:bg)
            endif
        endif

        if a:attr == ""
            exec "hi ".a:group." gui=none cterm=none"
        else
            let noitalic = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
            if empty(noitalic)
                let noitalic = "none"
            endif
            exec "hi ".a:group." gui=".a:attr." cterm=".noitalic
        endif
    endfun
"}}}

if !exists("g:colorscheme_use_lowcolor_black") || g:colorscheme_use_lowcolor_black
    let s:termBlack = "Black"
else
    let s:termBlack = "Grey"
endif

"SYNTAX COLORS:
"format: ('name','fg    ','bg    ','style      ',s:lowcolor-fg,'lowcolor-bg')
"example:('Line','000000','f0f0f0','italic,bold',s:termBlack  ,'White')

call s:X("Visual","","262626","standout","",s:termBlack)
call s:X("Cursor","","000000","standout,bold,underline","",s:termBlack)

call s:X("Pmenu","87d7ff","303030","","Grey","Blue")
call s:X("PmenuSel","87d7ff","4e4e4e","bold","White","Black")

call s:X("StatusLine","000000","d75f5f","bold",s:termBlack,"Red")
call s:X("StatusLineNC","ffffff","626262","","White","Grey")
call s:X("VertSplit","626262","626262","",s:termBlack,s:termBlack)
call s:X("WildMenu","808080","303030","","White",s:termBlack)

call s:X("Folded","87d7ff","626262","bold","Blue",s:termBlack)
call s:X("FoldColumn","87d7ff","262626","bold","Blue",s:termBlack)
call s:X("SignColumn","ffaf00","626262","bold","Red",s:termBlack)
call s:X("ColorColumn","ffaf00","626262","bold","Red",s:termBlack)

call s:X("TabLine","","000000","","",s:termBlack)
call s:X("TabLineFill","","000000","","",s:termBlack)
call s:X("TabLineSel","000000","ffffff","",s:termBlack,"White")

call s:X("Comment","626262","","italic","Grey","")
call s:X("Todo","d75f5f","","bold","Red","")

call s:X("Normal","d0d0d0","262626","","White",s:termBlack)
call s:X("MatchParen","ffffff","262626","standout,bold",s:termBlack,"White")
call s:X("CursorColumn","","303030","","",s:termBlack)
call s:X("CursorLine","","303030","","",s:termBlack)
call s:X("CursorLineNr","87d7ff","","bold","Blue",s:termBlack)
call s:X("LineNr","ffaf00","","","Yellow",s:termBlack)
call s:X("Title","d75f5f","","underline","Red","")
call s:X("Constant","87d7ff","","bold","Blue","")
call s:X("Special","ffaf00","","","Yellow","")
call s:X("Delimiter","ffffff","","","White","")
call s:X("String","ffffff","","italic","White","")
call s:X("StringDelimiter","ffff00","","","Yellow","")
call s:X("Identifier","87d7ff","","","Blue","")
call s:X("Type","d75f5f","","","Red","")
call s:X("Function","87d7ff","","","Blue","")
call s:X("Label","87d7ff","","","Blue","")
call s:X("Statement","ffd787","","","Yellow","")
call s:X("PreProc","ffd787","","","Yellow","")
call s:X("Operator","d75f5f","","","Red","")
call s:X("NonText","87d7ff","","","Blue","")
call s:X("SpecialKey","000000","","",s:termBlack,"")
call s:X("Search","87d7ff","262626","standout","Blue",s:termBlack)
call s:X("IncSearch","87d7ff","262626","standout,bold","Blue",s:termBlack)
call s:X("Directory","87d7ff","","","Blue","")
call s:X("Question","87d7ff","","","Blue","")
call s:X("ExtraWhitespace","262626","","standout",s:termBlack,"")
call s:X("Error","d75f5f","000000","standout","Red",s:termBlack)
hi! link ErrorMsg Error
hi! link MoreMsg Special
hi! link Structure PreProc
hi! link Number Type

"spell checking
call s:X("SpellBad","d75f5f","","undercurl","","Red")
call s:X("SpellCap","87d7ff","","undercurl","","Blue")
call s:X("SpellLocal","ffd787","","undercurl","","Yellow")
call s:X("SpellRare","ffffff","","italic","White","")

"diff
hi! link diffRemoved Constant
hi! link diffAdded String
call s:X("DiffAdd","000000","ffd787","italic",s:termBlack,"Yellow")
call s:X("DiffDelete","000000","d75f5f","italic",s:termBlack,"Red")
call s:X("DiffChange","000000","87d7ff","italic",s:termBlack,"Blue")
call s:X("DiffText","000000","c6c6c6","italic",s:termBlack,"White")

"html
hi! link htmlLink Statement
hi! link htmlTitle Title
call s:X("htmlH1","d75f5f","","standout,underline,bold","Red","")
call s:X("htmlH2","ffd787","","standout,underline,bold","Yellow","")
call s:X("htmlH3","87d7ff","","standout,underline,bold","Blue","")
call s:X("htmlH4","d75f5f","","underline,bold","Red","")
call s:X("htmlH5","ffd787","","underline,bold","Yellow","")
call s:X("htmlH6","87d7ff","","underline,bold","Blue","")

"php
hi! link phpFunctions Function
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link StorageClass Type

"javaScript
hi! link javaScriptParens Delimiter
hi! link javaScriptBraces Delimiter
hi! link javaScriptValue Constant
hi! link javascriptHtmlEvents javaScriptSpecial
hi! link javascriptDomElemAttrs javaScriptSpecial
hi! link javascriptDomElemFuncs javaScriptFunction

"coffeeScript
hi! link coffeeRegExp javaScriptRegexpString

"c
hi! link cOperator cBraces
hi! link cCharacter String
hi! link cBlock String

"objective-c/cocoa
hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective Type
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

"ruby
hi! link rubySharpBang Comment
hi! link rubyConstant Type
hi! link rubyFunction Function
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier
hi! link rubyClass Type
hi! link rubyIdentifier Identifier
call s:X("rubyGlobalVariable","","","bold","","")
"call s:X("rubySymbol","","","","","")
"call s:X("rubyControl","","","","","")
"call s:X("rubyRegexpDelimiter","","","","","")
"call s:X("rubyRegexp","","","","","")
"call s:X("rubyRegexpSpecial","","","","","")
"call s:X("rubyPredefinedIdentifier","","","","","")

"lua
hi! link luaOperator Conditional

"vim-indent-guides
call s:X("IndentGuidesOdd","","7c7c7c","","","Grey")
call s:X("IndentGuidesEven","","1c1c1c","","",s:termBlack)
if !exists("g:indent_guides_auto_colors")
    let g:indent_guides_auto_colors=0
endif

"EMAIL:
hi! link mailHeaderKey Identifier

"PLUGIN COLOURS:
"taglist
hi! link TagListFileName Directory

"syntastic
call s:X("SyntasticError","d75f5f","","standout,bold","Red","")
call s:X("SyntasticWarning","ffd787","","standout,bold","Yellow","")
hi! link SyntasticErrorLine SyntasticError
hi! link SyntasticWarningLine SyntasticWarning
hi! link SyntasticErrorSign Error
hi! link SyntasticWarningSign Statement
hi! link qfSeparator Delimiter
hi! link qfLineNr SyntasticError

"COLOR DEFINITIONS:
"delete functions {{{
    delf s:X
    delf s:rgb
    delf s:color
    delf s:rgb_color
    delf s:rgb_level
    delf s:rgb_number
    delf s:grey_color
    delf s:grey_level
    delf s:grey_number
"}}}

"colour presets (used with lightline) {{{
    let s:base3 = '#eaeaea'
    let s:base23 = '#d0d0d0'
    let s:base2 = '#c6c6c6'
    let s:base1 = '#b2b2b2'
    let s:base0 = '#949494'
    let s:base00 = '#767676'
    let s:base01 = '#606060'
    let s:base02 = '#4e4e4e'
    let s:base023 = '#303030'
    let s:darkblue = '#005fff'
    let s:red = '#d75f5f'
    let s:orange = '#ffaf00'
    let s:yellow = '#ffd787'
    let s:green = '#5faf00'
    let s:cyan = '#d7ffff'
    let s:blue = '#87d7ff'
    let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
    let s:p.normal.left = [ [ s:base023, s:blue ], [ s:base3, s:base01 ] ]
    let s:p.normal.right = [ [ s:base02, s:base1 ], [ s:base2, s:base01 ] ]
    let s:p.inactive.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
    let s:p.inactive.left =  [ [ s:base02, s:base0 ], [ s:base00, s:darkblue ] ]
    let s:p.insert.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
    let s:p.replace.left = [ [ s:base023, s:orange ], [ s:base3, s:base01 ] ]
    let s:p.visual.left = [ [ s:base023, s:green ], [ s:base3, s:base01 ] ]
    let s:p.normal.middle = [ [ s:base1, s:base02 ] ]
    let s:p.inactive.abmiddle = [ [ s:base0, s:base02 ] ]
    let s:p.tabline.left = [ [ s:base2, s:base01 ] ]
    let s:p.tabline.tabsel = [ [ s:base2, s:base023 ] ]
    let s:p.tabline.middle = [ [ s:base01, s:base1 ] ]
    let s:p.tabline.right = copy(s:p.normal.right)
    let s:p.normal.error = [ [ s:red, s:base023 ] ]
    let s:p.normal.warning = [ [ s:yellow, s:base02 ] ]
    let g:lightline#colorscheme#darkcloud#palette = lightline#colorscheme#fill(s:p)
"}}}
