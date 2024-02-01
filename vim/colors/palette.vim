if &t_Co >= 256
    let g:cBlack = '0' "#000000
    let g:cWhite = '15' "#ffffff

    let g:cGray1 = '253' "#dadada
    let g:cGray2 = '251' "#c6c6c6
    let g:cGray3 = '242' "#6c6c6c
    let g:cGray4 = '239' "#4e4e4e

    let g:cBlue = '117' "#87d7ff
    let g:cRed = '167' "#d75f5f
    let g:cYellow = '222' "#ffd787

    let g:cDarkBlue = '74' "#5fafd7
    let g:cDarkRed = '131' "#af5f5f
    let g:cDarkYellow = '179' "#d7af5f

    let g:cLightBg = '236' "#303030
    let g:cDarkBg = '235' "#262626
else
    let g:cBlack = '0' "#000000
    let g:cWhite = '15' "#ffffff

    let g:cGray1 = '15' "#ffffff
    let g:cGray2 = '15' "#ffffff
    let g:cGray4 = '15' "#ffffff
    let g:cGray3 = '15' "#ffffff

    let g:cBlue = '12' "#0000ff
    let g:cRed = '9' "#ff0000
    let g:cYellow = '11' "#ffff00

    let g:cDarkBlue = '4' "#000080
    let g:cDarkRed = '1' "#800000
    let g:cDarkYellow = '3' "#808000

    let g:cLightBg = '7' "#c0c0c0
    let g:cDarkBg = '0' "#000000
endif
