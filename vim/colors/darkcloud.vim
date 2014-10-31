"============================================================"
"                                                            "
"  Darkcloud Vim Config: theme                               "
"                                                            "
"  By: Kevin MacMartin (prurigro@gmail.com)                  "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"
"
" Acknowledgements:
"
"  I found the jellybeans theme part way through creating
"  this one and liked how it scripted compatibility between
"  cterm and gui, so I stripped its colours and ported
"  my own in, using jellybeans as a functional template.
"
"  As referenced in the original jellybean theme, the set
"  of color approximation functions were created by Henry
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

"color approximation functionality {{{
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
            let l:fgs = substitute(a:fg, '^#', '', '')
            let l:bgs = substitute(a:bg, '^#', '', '')
            let l:fge = empty(l:fgs)
            let l:bge = empty(l:bgs)

            if !l:fge && !l:bge
                exec "hi ".a:group." guifg=#".l:fgs." guibg=#".l:bgs." ctermfg=".s:rgb(l:fgs)." ctermbg=".s:rgb(l:bgs)
            elseif !l:fge && l:bge
                exec "hi ".a:group." guifg=#".l:fgs." guibg=NONE ctermfg=".s:rgb(l:fgs)." ctermbg=NONE"
            elseif l:fge && !l:bge
                exec "hi ".a:group." guifg=NONE guibg=#".l:bgs." ctermfg=NONE ctermbg=".s:rgb(l:bgs)
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

"SPELL CHECKING UNDERLINE: (blue, yellow, none, none)
hi SpellBad   guisp=#87d7ff gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=bold,underline cterm=bold,underline
hi SpellCap   guisp=#ffd787 gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
hi SpellRare  guisp=NONE gui=NONE guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=NONE cterm=NONE
hi SpellLocal guisp=NONE gui=NONE guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=NONE cterm=NONE

"SYNTAX COLORS:

"format:
"format: ('name','fg    ','bg    ','style      ',s:lowcolor-fg,'lowcolor-bg')
"example:('Line','000000','f0f0f0','italic,bold',s:termBlack  ,'White')

"CORE: {{{
    call s:X("Normal","#eaeaea","#262626","","White",s:termBlack)
    hi Normal ctermfg=254 ctermbg=235
    hi! link Conceal Normal

    call s:X("Cursor","","#262626","standout,underline,bold",s:termBlack,"White")
    call s:X("CursorColumn","","#303030","","",s:termBlack)
    hi CursorColumn ctermbg=236
    call s:X("CursorLine","","#303030","","",s:termBlack)
    hi CursorLine ctermbg=236
    call s:X("CursorLineNr","#87d7ff","#303030","bold","Blue",s:termBlack)
    hi CursorLineNr ctermbg=236
    call s:X("LineNr","#4e4e4e","","bold","White",s:termBlack)
    hi LineNr ctermfg=239

    call s:X("Visual","","#262626","standout","",s:termBlack)
    call s:X("MatchParen","","#303030","bold,underline","","")

    "whitespace
    call s:X("TabLine","","#000000","","",s:termBlack)
    call s:X("TabLineFill","","#000000","","",s:termBlack)
    call s:X("TabLineSel","#000000","#d0d0d0","",s:termBlack,"White")
    call s:X("ExtraWhiteSpace","FF0000","#262626","","Red",s:termBlack)

    "menu call
    call s:X("Pmenu","#87d7ff","#303030","","Grey","Blue")
    call s:X("PmenuSel","#87d7ff","#4e4e4e","bold","White","Black")

    "search
    call s:X("Search","","#262626","standout","",s:termBlack)
    hi! link IncSearchMatch Search
    hi! link IncSearchMatchReverse Search
    call s:X("IncSearch","","#262626","standout,bold,underline","",s:termBlack)
    hi! link IncSearchOnCursor IncSearch
    hi! link IncSearchCursor IncSearchOnCursor

    "status line
    call s:X("StatusLine","","#303030","","",s:termBlack)
    hi! link StatusLineNC StatusLine
    call s:X("VertSplit","#626262","#626262","",s:termBlack,s:termBlack)
    call s:X("WildMenu","#808080","#303030","","White",s:termBlack)

    "folding
    call s:X("Folded","#87d7ff","#4e4e4e","bold","Blue",s:termBlack)
    call s:X("FoldColumn","#eaeaea","","bold","White","")
    call s:X("SignColumn","#d75f5f","","bold","Red","")
    hi! link ColorColumn SignColumn

    "syntax style
    call s:X("Title","#d75f5f","","bold","Red","")
    call s:X("Comment","#6c6c6c","","italic","Grey","")
    call s:X("Constant","#87d7ff","","bold","Blue","")
    call s:X("Special","#ffd787","","bold","Yellow","")
    call s:X("Delimiter","#ffffff","","","White","")
    call s:X("String","#ffffff","","bold","White","")
    call s:X("StringDelimiter","#d0d0d0","","","White","")
    call s:X("Identifier","#87d7ff","","bold","Blue","")
    call s:X("Type","#d75f5f","","bold","Red","")
    call s:X("Function","#87d7ff","","","Blue","")
    call s:X("Label","#d75f5f","","","Red","")
    call s:X("Statement","#ffd787","","","Yellow","")
    call s:X("PreProc","#ffd787","","","Yellow","")
    call s:X("Keyword","#ffd787","","bold","Yellow","")
    call s:X("Operator","#d75f5f","","","Red","")
    call s:X("NonText","#87d7ff","","","Blue","")
    call s:X("SpecialKey","#626262","","",s:termBlack,"")
    call s:X("Directory","#87d7ff","","","Blue","")
    call s:X("Question","#87d7ff","","","Blue","")
    call s:X("Todo","#d75f5f","","bold","Red","")

    "errors
    call s:X("Error","#d75f5f","#000000","standout","Red",s:termBlack)
    hi! link WarningMsg Error
    hi! link ErrorMsg Error
    hi! link MoreMsg Special
    hi! link Structure PreProc
    hi! link Number Type

    "vimdiff
    call s:X("DiffAdd","#ffd787","","standout","Yellow","")
    call s:X("DiffDelete","#d75f5f","","standout","Red","")
    call s:X("DiffChange","#87d7ff","","standout","Blue","")
    call s:X("DiffText","#c6c6c6","","standout","White","")
"}}}

"SYNTAX: {{{
    "html
    hi! link htmlTitle Title
    call s:X("htmlH1","#d75f5f","","bold","Red","")
    call s:X("htmlH2","#87d7ff","","bold","Blue","")
    call s:X("htmlH3","#ffd787","","bold","Yellow","")
    call s:X("htmlH4","#d75f5f","","italic","Red","")
    call s:X("htmlH5","#87d7ff","","italic","Blue","")
    call s:X("htmlH6","#ffd787","","italic","Yellow","")
    call s:X("htmlSpecialChar","","","italic","","")
    call s:X("htmlArg","#d75f5f","","bold","Red","")
    call s:X("htmlTagName","#ffd787","","bold","Yellow","")
    call s:X("htmlTag","#87d7ff","","bold","Blue","")
    call s:X("htmlLink","#d75f5f","","underline","Red","")
    call s:X("htmlBold","#ffffff","","bold","White","")

    "markdown
    call s:X("mkdURL","#6c6c6c","","","Grey","")
    call s:X("mkdCode","#ffd787","#444444","","Yellow","Grey")
    hi! link mkdIndentCode mkdCode

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

    "json
    autocmd BufEnter,FileType json hi! link Label Constant
    autocmd BufEnter,FileType json hi! link Number Todo
    autocmd BufEnter,FileType json hi! link String Statement

    "coffeeScript
    hi! link coffeeRegExp javaScriptRegexpString

    "c
    call s:X("cBraces","#ffd787","","","Yellow","")
    hi! link cBlock cBraces
    hi! link cOperator cBraces
    hi! link cCharacter String
    hi! link cBlock String
    hi! link cNumbersCom Number

    "dosini
    hi! link dosiniLabel Function

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
    hi! link rubyPredefinedIdentifier PreProc
    call s:X("rubyGlobalVariable","","","bold","","")

    "lua
    hi! link luaOperator Conditional

    "systemd unit files
    hi! link sdKey Identifier
    hi! link sdFilename String
    hi! link sdFileList sdFilename
    hi! link sdExecFile sdFilename
    hi! link sdExecArgs sdExecFile
    hi! link sdDocURI sdFilename
    hi! link sdValue PreProc
    hi! link sdServiceBlock sdValue
    hi! link sdSocketBlock Operator
    hi! link sdUnitBlock Comment
    hi! link sdBindIPv6 sdValue
    hi! link sdIPTOS Label
    hi! link sdTCPCongest Label
    hi! link sdIOSchedClass sdValue
    hi! link sdIOSchedPrio sdValue
    hi! link sdCPUSchedPol sdValue
    hi! link sdBool sdValue
    hi! link sdDatasize sdValue
    hi! link sdSymbol sdValue
    hi! link sdOtherSignal sdValue
    hi! link sdDevAllow Keyword
    hi! link sdCapability sdDevAllow
"}}}

"MISC: {{{
    "bookmarks
    call s:X("BookmarkSign","#87d7ff","","bold","Blue","")

    "email
    hi! link mailHeaderKey Identifier

    "git
    hi! link gitconfigAssignment Label
    hi! link ExtraditeLogName Type

    "gitv
    hi! link gitvSubject String
    hi! link gitvLocalUncommit Special
    hi! link gitvLocalCommited Identifier
    hi! link gitvSeperatorMarks Delimiter

    "notes
    call s:X("notesRule","","","bold","","")
    call s:X("WarningMsg","#ffd787","#2c2c2c","standout,bold","Yellow",s:termBlack)
    call s:X("notesTitle","#d75f5f","","underline,bold","Red","")
    call s:X("notesName","#ffd787","","underline,bold","Yellow","")
    call s:X("notesShortHeading","#ffd787","#262626","standout,underline,bold","Yellow","")
    call s:X("Underlined","#87d7ff","","underline,bold","Blue","")
    call s:X("notesInProgress","#87d7ff","#262626","standout,underline,bold","Blue","")
    call s:X("notesRealURL","#d75f5f","","underline,bold","Red","")
    hi! link notesTextURL notesRealURL
    hi! link notesSubtleURL notesRealURL
    hi! link notesListBullet FoldColumn
    hi! link notesListNumber notesListBullet
    hi! link notesVimCmd Function
    hi! link notesSingleQuoted String
    hi! link notesBlockQuote Pmenu
    hi! link notesModeLine Comment
    hi! link notesCodeStart Delimiter
    hi! link notesCodeEnd notesCodeStart
    hi! link notesLastEdited Statement
    hi! link notesAtxHeading Comment

    "quicktask
    hi! link quicktaskDatestamp Identifier
    hi! link quicktaskTimestamp Identifier
    hi! link quicktaskSection Todo
    call s:X("quicktaskTimeNote","#ffd787","","bold","Yellow","")
    call s:X("quicktaskTask","#ffffff","","bold","White","")

    "signify
    call s:X("SignifySignAdd","#ffd787","","bold","","Yellow")
    call s:X("SignifySignDelete","#d75f5f","","bold","","Red")
    call s:X("SignifySignChange","#ffd787","","bold","","Yellow")
    hi! link SignifyLineAdd DiffAdd
    hi! link SignifyLineDelete DiffDelete
    hi! link SignifyLineChange DiffChange

    "syntastic
    call s:X("SyntasticError","#d75f5f","","standout,bold","Red","")
    call s:X("SyntasticWarning","#ffd787","","standout,bold","Yellow","")
    hi! link SyntasticErrorLine SyntasticError
    hi! link SyntasticWarningLine SyntasticWarning
    hi! link SyntasticErrorSign SyntasticError
    hi! link SyntasticWarningSign SyntasticWarning
    hi! link qfSeparator Delimiter
    hi! link qfLineNr SyntasticError

    "taglist
    hi! link TagListFileName Directory

    "taskwarrior
    call s:X("taskwarrior_tablehead","#d0d0d0","","standout,bold",s:termBlack,"White")
    call s:X("taskwarrior_field","","","standout,bold","","")
    hi! link taskwarrior_id Comment
    hi! link taskwarrior_project Keyword
    hi! link taskwarrior_entry Identifier
    hi! link taskwarrior_description String
"}}}

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
