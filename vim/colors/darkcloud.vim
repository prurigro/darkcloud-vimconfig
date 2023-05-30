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

"remove all the colours before writing our own
hi clear

if exists("syntax_on")
    syntax reset
endif

"declare the name of our theme
let colors_name = "darkcloud"

"sets the highlighting for the given group | format: s:C('Name','Foreground','Background','Style')
fun! s:C(group, fg, bg, attr)
    if has("gui_running")
        let l:term = "gui"
    else
        let l:term = "cterm"
    endif

    if a:fg != ""
        exec "hi " . a:group . " " . l:term . "fg=" . a:fg
    else
        exec "hi " . a:group . " " . l:term . "fg=NONE"
    endif

    if a:bg != ""
        exec "hi " . a:group . " " . l:term . "bg=" . a:bg
    else
        exec "hi " . a:group . " " . l:term . "bg=NONE"
    endif

    if a:attr != ""
        exec "hi " . a:group . " " . l:term . "=" . a:attr
    else
        exec "hi " . a:group . " " . l:term . "=NONE"
    endif
endfun

"SYNTAX COLORS:

"SPELL CHECKING UNDERLINE: (blue, yellow, none, none) {{{
    call s:C("SpellBad",g:cRed,"","italic,underline")
    call s:C("SpellCap",g:cYellow,"","italic,underline")
    call s:C("SpellRare","","","")
    call s:C("SpellLocal","","","")
"}}}

"CORE: {{{
    call s:C("Normal",g:cNormalText,g:cDarkGrayBg,"")
    hi Normal ctermfg=254 ctermbg=235
    hi! link Conceal Normal

    call s:C("Cursor","",g:cDarkGrayBg,"standout")
    call s:C("CursorColumn","",g:cLightGrayBg,"")
    hi CursorColumn ctermbg=236
    call s:C("CursorLine","",g:cLightGrayBg,"")
    hi CursorLine ctermbg=236
    call s:C("CursorLineNr",g:cBlue,g:cLightGrayBg,"bold")
    hi CursorLineNr ctermbg=236
    call s:C("LineNr",g:cDarkGrayFg,"","bold")
    hi LineNr ctermfg=239

    call s:C("Visual","",g:cDarkGrayBg,"standout")
    call s:C("VertSplit",g:cDarkText,"","")
    call s:C("MatchParen","",g:cLightGrayBg,"bold")

    "whitespace
    call s:C("TabLine","",g:cBlack,"")
    call s:C("TabLineFill","",g:cBlack,"")
    call s:C("TabLineSel",g:cBlack,g:cDarkText,"")
    call s:C("ExtraWhiteSpace",g:cDarkRed,g:cDarkGrayBg,"")

    "menu call
    call s:C("Pmenu",g:cBlue,g:cLightGrayBg,"")
    call s:C("PmenuSel",g:cBlue,g:cLightGrayBg,"bold")

    "search
    call s:C("Search","",g:cDarkGrayBg,"standout")
    hi! link IncSearchMatch Search
    hi! link IncSearchMatchReverse Search
    call s:C("IncSearch","",g:cDarkGrayBg,"standout")
    hi! link IncSearchOnCursor IncSearch
    hi! link IncSearchCursor IncSearchOnCursor

    "status line
    call s:C("StatusLine","",g:cLightGrayBg,"")
    hi! link StatusLineNC StatusLine
    call s:C("WildMenu",g:cDarkText,g:cLightGrayBg,"")

    "folding
    call s:C("Folded",g:cBlue,g:cLightGrayBg,"bold")
    call s:C("FoldColumn",g:cNormalText,"","bold")
    call s:C("SignColumn",g:cRed,"","bold")
    hi! link ColorColumn SignColumn

    "syntax style
    call s:C("Boolean",g:cBlue,"","bold")
    call s:C("Comment",g:cLightGrayFg,"","italic")
    call s:C("Conditional",g:cYellow,"","")
    call s:C("Constant",g:cBlue,"","bold")
    call s:C("Delimiter",g:cWhite,"","")
    call s:C("Directory",g:cBlue,"","")
    call s:C("Function",g:cBlue,"","")
    call s:C("Identifier",g:cBlue,"","bold")
    call s:C("Keyword",g:cYellow,"","bold")
    call s:C("Label",g:cRed,"","")
    call s:C("NonText",g:cBlue,"","")
    call s:C("Number",g:cYellow,"","bold")
    call s:C("Operator",g:cRed,"","")
    call s:C("PreProc",g:cYellow,"","")
    call s:C("Question",g:cBlue,"","")
    call s:C("Special",g:cYellow,"","bold")
    call s:C("SpecialKey",g:cLightGrayFg,"","")
    call s:C("Statement",g:cYellow,"","")
    call s:C("String",g:cWhite,"","bold")
    call s:C("StringDelimiter",g:cDarkText,"","")
    call s:C("Tag",g:cBlue,"","bold")
    call s:C("Title",g:cRed,"","bold")
    call s:C("Todo",g:cRed,"","bold")
    call s:C("Type",g:cRed,"","bold")
    call s:C("Typedef",g:cRed,"","bold")
    hi! link Character String
    hi! link Float Number
    hi! link Include Keyword
    hi! link MoreMsg Special
    hi! link SpecialChar Special
    hi! link StorageClass Type
    hi! link Structure PreProc

    "errors
    call s:C("Error",g:cRed,g:cBlack,"standout")
    hi! link WarningMsg Error
    hi! link ErrorMsg Error

    "vimdiff
    call s:C("DiffAdd",g:cYellow,"","standout")
    call s:C("DiffChange",g:cBlue,"","standout")
    call s:C("DiffDelete",g:cRed,"","standout")
    call s:C("DiffText",g:cLightText,"","standout")
"}}}

"SYNTAX: {{{
    "html
    call s:C("htmlArg",g:cRed,"","bold")
    call s:C("htmlBold",g:cWhite,"","bold")
    call s:C("htmlH1",g:cRed,"","bold")
    call s:C("htmlH2",g:cBlue,"","bold")
    call s:C("htmlH3",g:cYellow,"","bold")
    call s:C("htmlH4",g:cRed,"","italic")
    call s:C("htmlH5",g:cBlue,"","italic")
    call s:C("htmlH6",g:cYellow,"","italic")
    call s:C("htmlLink",g:cRed,"","")
    call s:C("htmlSpecialChar","","","italic")
    call s:C("htmlTagName",g:cYellow,"","bold")

    "markdown
    call s:C("mkdCode",g:cYellow,g:cLightGrayBg,"")
    call s:C("mkdURL",g:cLightGrayFg,"","")
    hi! link mkdIndentCode mkdCode

    "php
    hi! link phpArrayPair Operator
    hi! link phpNull Constant
    hi! link phpSuperglobal Identifier

    "javaScript
    hi! link javaScriptBraces Delimiter
    hi! link javaScriptParens Delimiter
    hi! link javaScriptValue Constant
    hi! link javascriptDomElemAttrs javaScriptSpecial
    hi! link javascriptDomElemFuncs javaScriptFunction
    hi! link javascriptHtmlEvents javaScriptSpecial

    "json
    autocmd BufEnter,FileType json hi! link Label Constant
    autocmd BufEnter,FileType json hi! link Number Todo
    autocmd BufEnter,FileType json hi! link String Statement

    "coffeeScript
    hi! link coffeeRegExp javaScriptRegexpString

    "c
    call s:C("cBraces",g:cYellow,"","")
    hi! link cBlock String
    hi! link cBlock cBraces
    hi! link cNumbersCom Number

    "dosini
    hi! link dosiniLabel Function

    "objective-c/cocoa
    hi! link cocoaClass objcClass
    hi! link cocoaFunction Function
    hi! link objcClass Type
    hi! link objcDirective Type
    hi! link objcMessageName Identifier
    hi! link objcMethodArg Normal
    hi! link objcMethodName Identifier
    hi! link objcStatement Constant
    hi! link objcSubclass objcClass
    hi! link objcSuperclass objcClass

    "ruby
    call s:C("rubyGlobalVariable","","","bold")
    hi! link rubyClass Type
    hi! link rubyConstant Type
    hi! link rubyGlobalVariable rubyInstanceVariable
    hi! link rubyInterpolationDelimiter Identifier
    hi! link rubyModule rubyClass
    hi! link rubyPredefinedIdentifier PreProc
    hi! link rubySharpBang Comment

    "systemd unit files
    hi! link sdBindIPv6 sdValue
    hi! link sdBool sdValue
    hi! link sdCPUSchedPol sdValue
    hi! link sdCapability sdDevAllow
    hi! link sdDatasize sdValue
    hi! link sdDevAllow Keyword
    hi! link sdDocURI sdFilename
    hi! link sdExecArgs sdExecFile
    hi! link sdExecFile sdFilename
    hi! link sdFileList sdFilename
    hi! link sdFilename String
    hi! link sdIOSchedClass sdValue
    hi! link sdIOSchedPrio sdValue
    hi! link sdIPTOS Label
    hi! link sdKey Identifier
    hi! link sdOtherSignal sdValue
    hi! link sdServiceBlock sdValue
    hi! link sdSocketBlock Operator
    hi! link sdSymbol sdValue
    hi! link sdTCPCongest Label
    hi! link sdUnitBlock Comment
    hi! link sdValue PreProc
"}}}

"MISC: {{{
    "email
    hi! link mailHeaderKey Identifier

    "git
    hi! link ExtraditeLogName Type
    hi! link gitconfigAssignment Label

    "signify
    call s:C("SignifySignAdd",g:cYellow,"","bold")
    call s:C("SignifySignChange",g:cYellow,"","bold")
    call s:C("SignifySignDelete",g:cRed,"","bold")
    hi! link SignifyLineAdd DiffAdd
    hi! link SignifyLineChange DiffChange
    hi! link SignifyLineDelete DiffDelete

    "ale
    call s:C("ALEErrorSign",g:cRed,"","standout")
    call s:C("ALEWarningSign",g:cYellow,"","standout")

    "taglist
    hi! link TagListFileName Directory
"}}}

"cleanup {{{
    delf s:C
"}}}
