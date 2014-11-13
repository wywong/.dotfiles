#!/usr/bin/sh
printf "Volume: "
amixer get 'Master' | egrep -0o -m 1 "[0-9]+%|\[on\]|\[off\]" | tr "\\n" " "

