#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo -e "\033[31;1m You must be root to do this. \033[0m" 1>&2
   exit 100
fi

echo -e "\033[36;1m Setting up Dark Night Skin \033[0m"

cat > /usr/share/mc/skins/darknight.ini <<EOF
[skin]
    description = Dark Night skin

[Lines]
    horiz=─
    vert=│
    lefttop=┌
    righttop=┐
    leftbottom=└
    rightbottom=┘
    topmiddle=─
    bottommiddle=─
    leftmiddle=├
    rightmiddle=┤
    cross=┼
    dhoriz=─
    dvert=│
    dlefttop=┌
    drighttop=┐
    dleftbottom=└
    drightbottom=┘
    dtopmiddle=─
    dbottommiddle=─
    dleftmiddle=├
    drightmiddle=┤

[core]
    _default_ = gray;black
    # Also applies on the function key hints at the bottom
    selected = brightred;
    # Also applies on field names of file pane and the selected files
    # information at the bottom of file pane
    marked = yellow;
    markselect = brightred;
    gauge = ;white
    input = brightred;gray
    inputunchanged=brightred;gray
    disabled=gray;lightgray
    reverse = black;lightgray

[dialog]
    dfocus = brightred;
    dhotnormal = brightred;
    dhotfocus = brightred;

[error]
    _default_ = white;red
    errdhotnormal = yellow;red
    errdhotfocus = yellow;lightgray
# Must match /{usr/,}etc/mc/filehighlight.ini, or ~/.mc/filehighlight.ini
[filehighlight]
    directory = lightgray;
    executable = green;
    symlink = cyan;
    stalelink = lightgray;red;
    device = brown;
    # Such as socket, fifo
    special = brown;
    # Linux core dump file
    core = red;
    temp = black;green;
    archive = red;
    doc = green;
    source = cyan;
    media = magenta;
    graph = magenta;
    database = blue;

[menu]
    menuhot = brightred;
    menusel = brightred;
    menuhotsel = brightred;

[help]
    helpitalic = red;
    helpbold = blue;
    helplink = white;
    helpslink = white;brightred
# Untouched except removing _default_
[editor]
    editbold = yellow;blue
    editmarked = black;cyan
    editwhitespace = brightblue;blue
    linestate = white;cyan
# Untoched
[viewer]
    viewunderline = brightred;blue
# Added
[popupmenu]
    _default_=lightgray;blue
    menusel=black;cyan
    menutitle=lightgray;blue

[statusbar]
    _default_=black;cyan

[buttonbar]
    hotkey=brightred;
    button=lightgray;
EOF
sleep 5

echo -e "\033[36;1m Setting up ini config \033[0m"

sed -i 's/^skin=[a-zA-Z0-9]*/skin=darknight/' /home/*/.config/mc/ini

sleep 5

echo -e "\033[32;1m Complete! \033[0m"
