#! /bin/bash

starting_command=(
    "cowsay -e '0o' -T ' U' Hello $USER"
    "cowsay -f daemon Hello $USER"
    "cowsay -f duck Hello $USER"
    "cowsay -f gnu Hello $USER"
    "linuxlogo -F 'Just a fucking other day...'"
    "neofetch"
)

arr_size=${#starting_command[@]}

rand=$(($RANDOM % $arr_size))

eval ${starting_command[$rand]}
#eval "cowsay -e '0o' -T ' U' Hello $USER"
