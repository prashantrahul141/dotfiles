# Nushell Environment Config File
#
# version = "0.86.0"

def create_left_prompt [] {
    let home =  $nu.home-path

    # Perform tilde substitution on dir
    # To determine if the prefix of the path matches the home dir, we split the current path into
    # segments, and compare those with the segments of the home dir. In cases where the current dir
    # is a parent of the home dir (e.g. `/home`, homedir is `/home/user`), this comparison will 
    # also evaluate to true. Inside the condition, we attempt to str replace `$home` with `~`.
    # Inside the condition, either:
    # 1. The home prefix will be replaced
    # 2. The current dir is a parent of the home dir, so it will be uneffected by the str replace
    let dir = (
        if ($env.PWD | path split | zip ($home | path split) | all { $in.0 == $in.1 }) {
            ($env.PWD | str replace $home "~")
        } else {
            $env.PWD
        }
    )

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X %p') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]


$env.NVM_DIR = "/home/prashant/.nvm"
$env.FLYCTL_INSTALL = "/home/prashant/.fly/"

# env
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.bun/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.local/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/linuxbrew/.linuxbrew/bin")
# $env.PATH = ($env.PATH | split row (char esep) | append "~/.nvim/nvim-linux64/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/opt/Clion/bin/")
$env.PATH = ($env.PATH | split row (char esep) | append "~/Projects/tools/bat-extras")
$env.PATH = ($env.PATH | split row (char esep) | append "/usr/local/go/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "~/Android/Sdk")
$env.PATH = ($env.PATH | split row (char esep) | append "~/Android/Sdk/emulator")
$env.PATH = ($env.PATH | split row (char esep) | append "~/Android/Sdk/platform-tools")
$env.PATH = ($env.PATH | split row (char esep) | append "~/External-apps/")
$env.PATH = ($env.PATH | split row (char esep) | append "~/Projects/tools")
# $env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.nvm/versions/node/v22.0.0/bin/")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.nvm/versions/node/v20.12.2/bin/")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.nvm/")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.local/share/pnpm")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.cargo/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/usr/local/go/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/go/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.local/kitty.app/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.dotnet/tools")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.fly/bin/")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/externals/")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/.local/bin/.juliaup/bin")

$env.PNPM_HOME = "/home/prashant/.local/share/pnpm"

$env.ANDROID_HOME = "/home/prashant/others/Android"
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/others/Android/emulator")
$env.PATH = ($env.PATH | split row (char esep) | append "/home/prashant/others/Android/platform-tools")
#env.DOTNET_CLI_TELEMETRY_OPTOUT = 1

$env.CHROME_PATH = "/usr/bin/brave-browser"

# default editor
$env.EDITOR = "nvim"

# ohmyposh
# oh-my-posh init nu --config ~/.config/.ohmyposh.omp.json --print | save ~/.config/.ohmyposh.nu --force

# zoxide
zoxide init nushell | save -f ~/.config/.zoxide.nu

# starship
$env.STARSHIP_CONFIG = ~/.config/starship.toml
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# disables some annoying stuff by npm.
$env.DISABLE_OPENCOLLECTIVE = 1
$env.ADBLOCK = 1
$env.QT_INSTALL_BINS = /usr/lib/qt6/bin/

$env.TERM = "tmux"

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

# creates and cd's into a new directory.
def --env mkcd [d: path]: nothing -> nothing {
    mkdir $d
    cd $d
}

