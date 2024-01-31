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

"SPELL CHECKING UNDERLINE: {{{
    call s:C("SpellBad","","","italic,underline")
    call s:C("SpellCap","","","italic,underline")
    call s:C("SpellRare","","","")
    call s:C("SpellLocal","","","")
"}}}

"CORE: {{{
    call s:C("Normal",g:cLightText,g:cDarkGrayBg,"")
    hi! link Conceal Normal

    call s:C("Cursor","",g:cDarkGrayBg,"standout")
    call s:C("CursorColumn","",g:cLightGrayBg,"")
    call s:C("CursorLine","",g:cLightGrayBg,"")
    call s:C("CursorLineNr",g:cBlue,g:cLightGrayBg,"bold")
    call s:C("LineNr",g:cDarkGrayFg,"","bold")

    call s:C("Visual","",g:cDarkGrayBg,"standout")
    call s:C("VertSplit",g:cGray,"","")
    call s:C("MatchParen","",g:cLightGrayBg,"bold")

    "whitespace
    call s:C("TabLine","",g:cBlack,"")
    call s:C("TabLineFill","",g:cBlack,"")
    call s:C("TabLineSel",g:cBlack,g:cGray,"")
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
    call s:C("WildMenu",g:cGray,g:cLightGrayBg,"")

    "folding
    call s:C("Folded",g:cBlue,g:cLightGrayBg,"bold")
    call s:C("FoldColumn",g:cLightText,"","bold")
    call s:C("SignColumn",g:cRed,"","bold")
    hi! link ColorColumn SignColumn

    "syntax style
    call s:C("Boolean",g:cYellow,"","bold")
    call s:C("Comment",g:cLightGrayFg,"","italic")
    call s:C("Conditional",g:cYellow,"","")
    call s:C("Constant",g:cBlue,"","bold")
    call s:C("Delimiter",g:cWhite,"","")
    call s:C("Directory",g:cBlue,"","")
    call s:C("Function",g:cBlue,"","bold")
    call s:C("Identifier",g:cBlue,"","bold")
    call s:C("Keyword",g:cBlue,"","bold")
    call s:C("Label",g:cRed,"","")
    call s:C("NonText",g:cBlue,"","")
    call s:C("Number",g:cRed,"","bold")
    call s:C("Operator",g:cRed,"","")
    call s:C("PreProc",g:cYellow,"","")
    call s:C("Question",g:cBlue,"","")
    call s:C("Special",g:cYellow,"","bold")
    call s:C("SpecialKey",g:cLightGrayFg,"","")
    call s:C("Statement",g:cYellow,"","")
    call s:C("String",g:cWhite,"","bold")
    call s:C("StringDelimiter",g:cDarkText,"","")
    call s:C("Tag",g:cYellow,"","")
    call s:C("Title",g:cRed,"","bold")
    call s:C("Todo",g:cRed,"","bold")
    call s:C("Type",g:cRed,"","bold")
    call s:C("Typedef",g:cRed,"","bold")
    hi! link Character String
    hi! link Float Number
    hi! link Include Keyword
    hi! link MoreMsg Special
    hi! link SpecialChar String
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
    call s:C("DiffText",g:cDarkText,"","standout")
"}}}

"LANGUAGE: {{{
    "c
    call s:C("cBraces",g:cYellow,"","")
    hi! link cBlock String
    hi! link cBlock cBraces
    hi! link cNumbersCom Number

    "coffeeScript
    hi! link coffeeRegExp javaScriptRegexpString

    "dosini
    hi! link dosiniLabel Function

    "gitcommit
    call s:C("gitcommitSummary",g:cLightText,"","")
    call s:C("gitcommitType",g:cBlue,"","")
    call s:C("gitcommitFile",g:cRed,"","")

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

    "javaScript
    call s:C("jsImport",g:cRed,"","bold")
    call s:C("jsModuleKeyword",g:cYellow,"","bold")
    call s:C("jsFrom",g:cRed,"","bold")
    call s:C("jsExport",g:cRed,"","bold")
    call s:C("jsFuncBlock",g:cBlue,"","")
    call s:C("jsObjectKey",g:cBlue,"","")
    call s:C("jsObjectProp",g:cBlue,"","")
    call s:C("jsBracket",g:cYellow,"","bold")
    call s:C("jsReturn",g:cRed,"","bold")
    hi! link jsBraces Delimiter
    hi! link jsParens Delimiter
    hi! link jsDomElemAttrs jsSpecial
    hi! link jsDomElemFuncs jsFunction
    hi! link jsHtmlEvents jsSpecial

    "json
    autocmd BufEnter,FileType json hi! link Label Constant
    autocmd BufEnter,FileType json hi! link Number Todo
    autocmd BufEnter,FileType json hi! link String Statement

    "markdown
    call s:C("mkdCode",g:cYellow,g:cLightGrayBg,"")
    call s:C("mkdURL",g:cLightGrayFg,"","")
    hi! link mkdIndentCode mkdCode

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

    "php
    hi! link phpArrayPair Operator
    hi! link phpNull Constant
    hi! link phpSuperglobal Identifier

    "ruby
    call s:C("rubyGlobalVariable","","","bold")
    hi! link rubyClass Type
    hi! link rubyConstant Type
    hi! link rubyGlobalVariable rubyInstanceVariable
    hi! link rubyInterpolationDelimiter Identifier
    hi! link rubyModule rubyClass
    hi! link rubyPredefinedIdentifier PreProc
    hi! link rubySharpBang Comment

    "sh
    call s:C("shVariable",g:cBlue,"","bold")
    call s:C("shAlias",g:cBlue,"","bold")

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

"TREESITTER: {{{
    if has('nvim')
        call s:C("@attribute",g:cRed,"","")
        call s:C("@boolean",g:cBlue,"","bold")
        call s:C("@character",g:cWhite,"","bold")
        call s:C("@constant",g:cDarkText,"","")
        call s:C("@constant.builtin",g:cDarkText,"","")
        call s:C("@constant.macro",g:cDarkText,"","")
        call s:C("@constructor",g:cDarkText,"","")
        call s:C("@danger",g:cRed,"","bold")
        call s:C("@error",g:cRed,"","bold")
        call s:C("@exception",g:cRed,"","")
        call s:C("@float",g:cYellow,"","bold")
        call s:C("@function",g:cLightText,"","")
        call s:C("@function.builtin",g:cBlue,"","bold")
        call s:C("@function.macro",g:cBlue,"","italic")
        call s:C("@field",g:cBlue,"","italic")
        call s:C("@include",g:cBlue,"","bold")
        call s:C("@keyword",g:cRed,"","bold")
        call s:C("@keyword.function",g:cRed,"","bold")
        call s:C("@keyword.operator","","","bold")
        call s:C("@label",g:cWhite,"","")
        call s:C("@namespace",g:cDarkText,"","")
        call s:C("@none",g:cLightText,"","")
        call s:C("@number",g:cRed,"","bold")
        call s:C("@operator",g:cRed,"","")
        call s:C("@parameter",g:cYellow,"","")
        call s:C("@parameter.reference",g:cYellow,"","bold")
        call s:C("@property",g:cBlue,"","")
        call s:C("@punctuation.bracket",g:cDarkText,"","")
        call s:C("@punctuation.delimiter",g:cDarkText,"","")
        call s:C("@punctuation.special",g:cDarkText,"","bold")
        call s:C("@repeat",g:cBlue,"","")
        call s:C("@string",g:cWhite,"","bold")
        call s:C("@string.escape",g:cYellow,"","")
        call s:C("@string.regex","","","italic")
        call s:C("@symbol",g:cRed,"","")
        call s:C("@tag",g:cYellow,"","bold")
        call s:C("@tag.attribute",g:cBlue,"","bold")
        call s:C("@tag.delimiter",g:cBlue,"","bold")
        call s:C("@text",g:cLightText,"","")
        call s:C("@text.diff.add",g:cYellow,"","")
        call s:C("@text.diff.change",g:cBlue,"","")
        call s:C("@text.diff.delete",g:cRed,"","")
        call s:C("@text.emphasis","","","italic")
        call s:C("@text.environment",g:cWhite,"","")
        call s:C("@text.environment.name",g:cWhite,"","")
        call s:C("@text.literal",g:cLightText,"","")
        call s:C("@text.math","","","bold,italic")
        call s:C("@text.reference",g:cWhite,"","")
        call s:C("@text.strike","","","strikethrough")
        call s:C("@text.strong","","","bold")
        call s:C("@text.title","","","")
        call s:C("@text.todo",g:cDarkText,"","")
        call s:C("@text.underline","","","underline")
        call s:C("@text.uri","","","bold")
        call s:C("@type",g:cYellow,"","bold")
        call s:C("@type.builtin",g:cYellow,"","bold")
        call s:C("@variable",g:cBlue,"","")
        call s:C("@variable.builtin",g:cYellow,"","bold")
        call s:C("@warning",g:cRed,"","")
        hi! link @annotation @comment
        hi! link @comment Comment
        hi! link @conditional Conditional
        hi! link @method @function
        hi! link @note @comment
    endif
"}}}

"cleanup {{{
    delf s:C
"}}}
