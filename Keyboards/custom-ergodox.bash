#!/usr/bin/env bash
#
# Keyboard: Ergodox
#
# These build scripts are just a convenience for configuring your keyboard (less daunting than CMake)
# Jacob Alexander 2015-2019


# Build the Left Side
"${BASH_SOURCE%/*}/custom-ergodox-l.bash"

# Build the Right Side
"${BASH_SOURCE%/*}/custom-ergodox-r.bash"
