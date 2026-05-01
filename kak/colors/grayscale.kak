# Greyscale: monochromatic grey-based light colorscheme

evaluate-commands %sh{
    bg="rgb:000000"
    fg="rgb:909090"
    fg_alpha="rgba:90909080"
    white="rgb:b0b0b0"
    accent="rgb:bbb0a0"
    comment="rgb:545454"
    constant="rgb:a0b8a0"
    blackish="rgb:202020"
    selection="rgb:383838"
    second_selection="rgb:282828"
    red="rgb:fb4934"
    green="rgb:68bb26"

    cat <<EOF

    # For Code
    set-face global keyword ${white}+b
    set-face global type ${accent}
    set-face global attribute @keyword
    set-face global value ${constant}
    set-face global string @value
    set-face global meta ${white}
    set-face global builtin @keyword
    set-face global variable ${fg}
    set-face global module ${white}
    set-face global function @variable
    set-face global comment ${comment}+i
    set-face global documentation ${white}+d
    set-face global operator ${comment}
    set-face global delimiter ${comment}

    # For markup
    set-face global title ${accent}+b
    set-face global header ${white}+b
    set-face global block ${fg}
    set-face global mono ${fg}
    set-face global link ${accent}+u
    set-face global list Default
    set-face global bullet +b

    # Built-in faces
    set-face global Default ${fg},${bg}
    set-face global PrimarySelection ${fg_alpha},${selection}+g
    set-face global SecondarySelection ${fg_alpha},${second_selection}+g
    set-face global PrimaryCursor ${bg},${fg}+fg
    set-face global SecondaryCursor ${bg},${comment}+fg
    set-face global PrimaryCursorEol @PrimaryCursor
    set-face global SecondaryCursorEol @SecondaryCursor

    set-face global MenuForeground ${white},${selection}+b
    set-face global MenuBackground ${fg},${blackish}
    set-face global MenuInfo +d

    set-face global Information ${white},${blackish}
    set-face global InlineInformation @Information

    set-face global Error ${bg},${red}
    set-face global DiagnosticError ${red}
    set-face global DiagnosticWarning ${accent}

    set-face global StatusLine ${white},${blackish}
    set-face global StatusLineMode ${white}+b
    set-face global StatusLineInfo ${accent}+bd
    set-face global StatusLineValue ${constant}+bd
    set-face global StatusCursor ${bg},${fg}
    set-face global Prompt @keyword

    set-face global BufferPadding ${comment}

    set-face global LineNumbers ${comment}
    set-face global LineNumberCursor ${white}+b
    set-face global LineNumbersWrapped ${comment}+d
    set-face global MatchingChar ${white}+b
    set-face global Whitespace ${comment}+f
    set-face global WrapMarker ${comment}+f

EOF
}
