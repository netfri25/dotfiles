function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus # save the current pipestatus

    set -l suffix
    if functions -q fish_is_root_user; and fish_is_root_user
        set suffix '#'
    else
        set suffix ')'
    end

    # PWD
    set_color $pure_color_mute
    echo -n "$USER "
    set_color $fish_color_cwd
    echo -n (path normalize "$(basename (dirname $PWD))/$(basename $PWD)")
    set_color normal

    # git
    set git_branch (git branch --show-current 2> /dev/null)
    if test -n "$git_branch"
        echo -n " $git_branch"
    end

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "] " "|" "$status_color" "$statusb_color" $last_pipestatus)
    echo -n " $prompt_status"
    set_color normal

    if functions -q fish_is_root_user; and fish_is_root_user
        set_color red
    end

    echo -n "$suffix "
    set_color normal
end
