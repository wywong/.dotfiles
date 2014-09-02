#!/usr/bin/sh
printf "Volume: "
# amixer get 'Master' | egrep -0o "\[[0-9]+%\]|\[on\]|\[off\]" | tr "\\n" " "
amixer get 'Master' | egrep -0o "[0-9]+%|\[on\]|\[off\]" | tr "\\n" " "

