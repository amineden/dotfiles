#!/bin/bash -
#===============================================================================
#
#          FILE: abs_path.sh
#
#         USAGE: ./abs_path.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#  ORGANIZATION: 
#       CREATED: 09/10/2021 02:31:42 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
MPD_DIR=$(grep 'music_directory' .config/mpd/mpd.conf | sed 's/^.* "//;s/"$//')
SONG=$(mpc -f %file% | head -n1)
echo "$MPD_DIR/$SONG"
