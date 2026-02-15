$env.XBPS_DISTDIR = "/home/netfri/.void-packages"
$env.MANPAGER = "nvim +Man!"

$env._JAVA_AWT_WM_NONREPARENTING = 1
$env.AWT_TOOLKIT = "MToolkit"
$env.GTK_THEME = "Adwaita:dark"

$env.PATH ++= [
    /home/netfri/.cargo/bin
    /home/netfri/.local/bin
    /home/netfri/.cabal/bin
    /home/netfri/.ghcup/bin
]

source /tmp/.zoxide.nu

alias nvd = neovide



$env.config.buffer_editor = "nvim"

$env.config.history.sync_on_enter = false
$env.config.history.isolation = false
$env.config.show_banner = false
$env.config.rm.always_trash = false
$env.config.buffer_editor = "nvim"
$env.config.show_hints = true
$env.config.use_kitty_protocol = false
$env.config.shell_integration.reset_application_mode = true
$env.config.display_errors.exit_code = false
$env.config.display_errors.termination_signal = true
$env.config.error_lines = 1
$env.config.footer_mode = "auto"

$env.config.table.mode = "light"
$env.config.table.index_mode = "never"
$env.config.table.show_empty = true
$env.config.table.header_on_separator = false
$env.config.table.abbreviated_row_count = null
$env.config.table.footer_inheritance = false
$env.config.table.missing_value_symbol = "(none)"
$env.config.table.batch_duration = 1sec
$env.config.table.stream_page_size = 1000

$env.config.datetime_format.table = null
$env.config.datetime_format.normal = null

$env.config.filesize.unit = "binary"
$env.config.filesize.show_unit = true
$env.config.filesize.precision = 2

$env.config.float_precision = 2

$env.config.ls.use_ls_colors = true
$env.config.ls.clickable_links = true

$env.config.hooks.pre_prompt = []
$env.config.hooks.pre_execution = []
$env.config.hooks.env_change = {}
$env.config.hooks.command_not_found = null

$env.config.color_config.foreground = null
$env.config.color_config.background = null
$env.config.color_config.cursor = null

$env.config.color_config.shape_external = "white_bold"
$env.config.color_config.shape_internalcall = "white_bold"

$env.config.color_config.shape_string = "white"
$env.config.color_config.shape_filepath = "white"
$env.config.color_config.shape_flag = "white"
$env.config.color_config.shape_globpattern = "white"
$env.config.color_config.shape_externalarg = "white"

$env.PROMPT_COMMAND = {||
    let status = (if ($env.LAST_EXIT_CODE != 0) { $"(ansi red)[($env.LAST_EXIT_CODE)]" } else { '' })
    let user = $"(ansi dark_gray)($env.USER)"
    let directory = $"(ansi green)($env.PWD | path split | reverse | take 2 | reverse | path join)"
    let git_branch = $"(ansi reset)(try { git branch --show-current err> /dev/null })"
    let indicator = (if (is-admin) { $"(ansi red)#" } else { $"(ansi reset))" })

    let prompt = ([$user $directory $git_branch $status $indicator] | where {|item| ($item | ansi strip) != ''} | str join ' ')
    $"(ansi reset)($prompt) "
}

$env.PROMPT_COMMAND_RIGHT = {||}
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_MULTILINE_INDICATOR = ""
$env.TRANSIENT_PROMPT_COMMAND = $env.PROMPT_COMMAND
$env.TRANSIENT_PROMPT_INDICATOR = $env.PROMPT_INDICATOR
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = $env.PROMPT_INDICATOR_VI_INSERT
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = $env.PROMPT_INDICATOR_VI_NORMAL
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = $env.PROMPT_MULTILINE_INDICATOR
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = $env.PROMPT_COMMAND_RIGHT
