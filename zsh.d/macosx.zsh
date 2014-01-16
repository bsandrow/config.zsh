if [ $(uname) = "Darwin" ]; then
    # For Xcode 5.0
    export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

    # Notes:
    # - iTerm2 allows you to set the text that appears on the window titlebar
    #   and the tab separately.
    # - Setting the tab title when the window title is 'default' will set both.
    #   E.g.:
    #       stt_tab 123   # tab title: 123, window title: 123
    #       stt_title 456 # tab title: 123, window title: 456
    #
    #       # on the other hand...
    #       stt_title 456 # tab title: default, window title: 456
    #       stt_tab 123   # tab title: 123, window title: 456
    # - Setting a title to the same name as the Profile actually resets the
    #   title to the default title.
    #
    set_terminal_title() {
        local mode=$1;
        shift;
        echo -ne "\e]$mode;$*\a"
    }
    alias stt_both='set_terminal_title 0'   # window + tab titles
    alias stt_tab='set_terminal_title 1'    # tab title only (See above for exception)
    alias stt_title='set_terminal_title 2'  # window title only
fi
