if has("gui_running")
    let g:cBlack = "#000000"
    let g:cWhite = "#ffffff"
    let g:cGray = "#dadada"

    let g:cBlue = "#87d7ff"
    let g:cRed = "#d75f5f"
    let g:cYellow = "#ffd787"

    let g:cDarkBlue = "#6caccc"
    let g:cDarkRed = "#a34848"
    let g:cDarkYellow = "#ccac6c"

    let g:cDarkGrayBg = "#262626"
    let g:cLightGrayBg = "#303030"

    let g:cDarkGrayFg = "#4e4e4e"
    let g:cLightGrayFg = "#6c6c6c"

    let g:cDarkText = "#c6c6c6"
    let g:cLightText = "#eeeeee"
elseif &t_Co >= 256
    let g:cBlack = '0' "#000000
    let g:cWhite = '15' "#ffffff
    let g:cGray = '253' "#dadada

    let g:cBlue = '117' "#87d7ff
    let g:cRed = '167' "#d75f5f
    let g:cYellow = '222' "#ffd787

    let g:cDarkBlue = '74' "#5fafd7
    let g:cDarkRed = '131' "#af5f5f
    let g:cDarkYellow = '179' "#d7af5f

    let g:cDarkGrayBg = '235' "#262626
    let g:cLightGrayBg = '236' "#303030

    let g:cDarkGrayFg = '239' "#4e4e4e
    let g:cLightGrayFg = '242' "#6c6c6c

    let g:cDarkText = '251' "#c6c6c6
    let g:cLightText = '255' "#eeeeee
else
    let g:cBlack = '0' "#000000
    let g:cWhite = '15' "#ffffff
    let g:cGray = '15' "#ffffff

    let g:cBlue = '12' "#0000ff
    let g:cRed = '9' "#ff0000
    let g:cYellow = '11' "#ffff00

    let g:cDarkBlue = '4' "#000080
    let g:cDarkRed = '1' "#800000
    let g:cDarkYellow = '3' "#808000

    let g:cDarkGrayBg = '0' "#000000
    let g:cLightGrayBg = '7' "#c0c0c0

    let g:cDarkGrayFg = '15' "#ffffff
    let g:cLightGrayFg = '15' "#ffffff

    let g:cDarkText = '15' "#ffffff
    let g:cLightText = '15' "#ffffff
endif
