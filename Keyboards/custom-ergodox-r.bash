#!/usr/bin/env bash
#
# Keyboard: Ergodox
#
# These build scripts are just a convenience for configuring your keyboard (less daunting than CMake)
# Jacob Alexander 2015-2019



#################
# Configuration #
#################


# VID:PID Mapping
export VENDOR_ID="0x308F"
export PRODUCT_ID="0x0025"


# Feel free to change the variables in this section to configure your keyboard

BuildPath="Custom-ICED-R"

## KLL Configuration ##

# Generally shouldn't be changed, this will affect every layer
BaseMap="customScanCodeMap rightHand slave1 leftHand"

# This is the default layer of the keyboard
# NOTE: To combine kll files into a single layout, separate them by spaces
# e.g.  DefaultMap="mylayout mylayoutmod"
DefaultMap="customLayer0 customLcdFuncMap customRight"

# This is where you set the additional layers
# NOTE: Indexing starts at 1
# NOTE: Each new layer is another array entry
# e.g.  PartialMaps[1]="layer1 layer1mod"
#       PartialMaps[2]="layer2"
#       PartialMaps[3]="layer3"
PartialMaps[1]="customLayer1"
PartialMaps[2]="customLayer2"



##########################
# Advanced Configuration #
##########################

# Don't change the variables in this section unless you know what you're doing
# These are useful for completely custom keyboards
# NOTE: Changing any of these variables will require a force build to compile correctly

# Keyboard Module Configuration
ScanModule="Infinity_Ergodox"
MacroModule="PixelMap"
OutputModule="USB"
DebugModule="full"

# Microcontroller
Chip="mk20dx256vlh7"

# Compiler Selection
Compiler="gcc"



########################
# Bash Library Include #
########################

# Shouldn't need to touch this section

# Check if the library can be found
if [ ! -f "${BASH_SOURCE%/*}/cmake.bash" ]; then
	echo "ERROR: Cannot find 'cmake.bash'"
	exit 1
fi

# Load the library
source "${BASH_SOURCE%/*}/cmake.bash"
