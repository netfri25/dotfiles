# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](mg) %{
    set-option buffer filetype maglang
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=maglang %{
    require-module maglang
    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window maglang-.+ }
}

hook -group maglang-highlight global WinSetOption filetype=maglang %{
    add-highlighter window/maglang ref maglang
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/maglang }
}

provide-module maglang %§

add-highlighter shared/maglang regions
add-highlighter shared/maglang/code default-region group
add-highlighter shared/maglang/comment region '//' '$' fill comment
add-highlighter shared/maglang/string region '"'  (?<!\\)(\\\\)*" fill string
add-highlighter shared/maglang/char   region "'"  (?<!\\)(\\\\)*' fill value
add-highlighter shared/maglang/code/integer regex '\b\d+\b' 0:value
add-highlighter shared/maglang/code/delimiter regex '\(|\)|\[|\]|\{|\}|,' 0:delimiter
add-highlighter shared/maglang/code/float regex '(\b\d+\.)?\d+\b' 0:value
add-highlighter shared/maglang/code/type regex '\b[A-Z]\w*\b' 0:type
add-highlighter shared/maglang/code/boolean regex '\b(true|false)\b' 0:value
add-highlighter shared/maglang/code/keyword regex '\b(final|const|as|fn|return|break|continue|if|else|while|defer|struct|enum|sizeof|global)\b' 0:keyword

§
