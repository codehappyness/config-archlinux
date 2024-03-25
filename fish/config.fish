set fish_greeting ""

#set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
if status is-interactive
    # Commands to run in interactive sessions can go here
end
# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
command -qv nvim && alias vim nvim && alias vi nvim

# lua 
set -g LUAPATH ~/app/lua-language-server
set -gx PATH $LUAPATH/bin $PATH
set --universal nvm_default_version v18

# Emulator 
set -gx JAVA_HOME /usr/lib/jvm/java-11-openjdk
set -gx PATH $JAVA_HOME $PATH

set -gx ANDROID_HOME ~/Android/Sdk
#set -e ANDROID_HOME
set -gx PATH $ANDROID_HOME $PATH
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH


set -gx PATH $HOME/development/flutter/bin $PATH

set -gx PATH $HOME/.cargo/bin $PATH

set -gx PATH $HOME/go/bin $PATH

#set -gx PATH /usr/local/bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
set -gx GTK_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx
set -gx SDL_IM_MODULE fcitx
set -gx XMODIFIERS @im=fcitx

#set -gx GTK_IM_MODULE ibus 
#set -gx QT_IM_MODULE ibus 
#set -gx SDL_IM_MODULE ibus 
#set -gx XMODIFIERS @im=ibus

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

if test -z "$WAYLAND_DISPLAY"; and test "$XDG_VTNR" -eq 1
    exec sway
end
