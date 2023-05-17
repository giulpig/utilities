
#compdef espup

autoload -U is-at-least

_espup() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_espup_commands" \
"*::: :->espup" \
&& ret=0
    case $state in
    (espup)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:espup-command-$line[1]:"
        case $line[1] in
            (completions)
_arguments "${_arguments_options[@]}" \
'-l+[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'--log-level=[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'-h[Print help]' \
'--help[Print help]' \
':shell -- Shell to generate completions for:(bash elvish fish powershell zsh)' \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
'-d+[Target triple of the host]:DEFAULT_HOST:(x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu x86_64-pc-windows-msvc x86_64-pc-windows-gnu x86_64-apple-darwin aarch64-apple-darwin)' \
'--default-host=[Target triple of the host]:DEFAULT_HOST:(x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu x86_64-pc-windows-msvc x86_64-pc-windows-gnu x86_64-apple-darwin aarch64-apple-darwin)' \
'-f+[Relative or full path for the export file that will be generated. If no path is provided, the file will be generated under home directory (https\://docs.rs/dirs/latest/dirs/fn.home_dir.html)]:EXPORT_FILE:_files' \
'--export-file=[Relative or full path for the export file that will be generated. If no path is provided, the file will be generated under home directory (https\://docs.rs/dirs/latest/dirs/fn.home_dir.html)]:EXPORT_FILE:_files' \
'-l+[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'--log-level=[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'-a+[Xtensa Rust toolchain name]:NAME: ' \
'--name=[Xtensa Rust toolchain name]:NAME: ' \
'-n+[Nightly Rust toolchain version]:NIGHTLY_VERSION: ' \
'--nightly-version=[Nightly Rust toolchain version]:NIGHTLY_VERSION: ' \
'-t+[Comma or space separated list of targets \[esp32,esp32c2,esp32c3,esp32c6,esp32h2,esp32s2,esp32s3,all\]]:TARGETS: ' \
'--targets=[Comma or space separated list of targets \[esp32,esp32c2,esp32c3,esp32c6,esp32h2,esp32s2,esp32s3,all\]]:TARGETS: ' \
'-v+[Xtensa Rust toolchain version]:TOOLCHAIN_VERSION: ' \
'--toolchain-version=[Xtensa Rust toolchain version]:TOOLCHAIN_VERSION: ' \
'-e[Extends the LLVM installation]' \
'--extended-llvm[Extends the LLVM installation]' \
'-s[Only install toolchains required for STD applications]' \
'--std[Only install toolchains required for STD applications]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(uninstall)
_arguments "${_arguments_options[@]}" \
'-l+[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'--log-level=[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'-a+[Xtensa Rust toolchain name]:NAME: ' \
'--name=[Xtensa Rust toolchain name]:NAME: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(update)
_arguments "${_arguments_options[@]}" \
'-d+[Target triple of the host]:DEFAULT_HOST:(x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu x86_64-pc-windows-msvc x86_64-pc-windows-gnu x86_64-apple-darwin aarch64-apple-darwin)' \
'--default-host=[Target triple of the host]:DEFAULT_HOST:(x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu x86_64-pc-windows-msvc x86_64-pc-windows-gnu x86_64-apple-darwin aarch64-apple-darwin)' \
'-l+[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'--log-level=[Verbosity level of the logs]:LOG_LEVEL:(debug info warn error)' \
'-a+[Xtensa Rust toolchain name]:NAME: ' \
'--name=[Xtensa Rust toolchain name]:NAME: ' \
'-v+[Xtensa Rust toolchain version]:TOOLCHAIN_VERSION: ' \
'--toolchain-version=[Xtensa Rust toolchain version]:TOOLCHAIN_VERSION: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_espup__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:espup-help-command-$line[1]:"
        case $line[1] in
            (completions)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(uninstall)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(update)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_espup_commands] )) ||
_espup_commands() {
    local commands; commands=(
'completions:Generate completions for the given shell' \
'install:Installs Espressif Rust ecosystem' \
'uninstall:Uninstalls Espressif Rust ecosystem' \
'update:Updates Xtensa Rust toolchain' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'espup commands' commands "$@"
}
(( $+functions[_espup__completions_commands] )) ||
_espup__completions_commands() {
    local commands; commands=()
    _describe -t commands 'espup completions commands' commands "$@"
}
(( $+functions[_espup__help__completions_commands] )) ||
_espup__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'espup help completions commands' commands "$@"
}
(( $+functions[_espup__help_commands] )) ||
_espup__help_commands() {
    local commands; commands=(
'completions:Generate completions for the given shell' \
'install:Installs Espressif Rust ecosystem' \
'uninstall:Uninstalls Espressif Rust ecosystem' \
'update:Updates Xtensa Rust toolchain' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'espup help commands' commands "$@"
}
(( $+functions[_espup__help__help_commands] )) ||
_espup__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'espup help help commands' commands "$@"
}
(( $+functions[_espup__help__install_commands] )) ||
_espup__help__install_commands() {
    local commands; commands=()
    _describe -t commands 'espup help install commands' commands "$@"
}
(( $+functions[_espup__install_commands] )) ||
_espup__install_commands() {
    local commands; commands=()
    _describe -t commands 'espup install commands' commands "$@"
}
(( $+functions[_espup__help__uninstall_commands] )) ||
_espup__help__uninstall_commands() {
    local commands; commands=()
    _describe -t commands 'espup help uninstall commands' commands "$@"
}
(( $+functions[_espup__uninstall_commands] )) ||
_espup__uninstall_commands() {
    local commands; commands=()
    _describe -t commands 'espup uninstall commands' commands "$@"
}
(( $+functions[_espup__help__update_commands] )) ||
_espup__help__update_commands() {
    local commands; commands=()
    _describe -t commands 'espup help update commands' commands "$@"
}
(( $+functions[_espup__update_commands] )) ||
_espup__update_commands() {
    local commands; commands=()
    _describe -t commands 'espup update commands' commands "$@"
}

if [ "$funcstack[1]" = "_espup" ]; then
    _espup "$@"
else
    compdef _espup espup
fi
