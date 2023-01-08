#!/bin/zsh
#===============================================================================
#
#          FILE: words.sh
#
#         USAGE: ./words.sh
#
#   DESCRIPTION: gets a terminal friendly version of an link,adds estimated reading time and displays it using w3m
#		 play youtube using mpv
#
#  ORGANIZATION: 
#       CREATED: 04/28/2022 11:28:29 PM
#      REVISION:  ---
#===============================================================================

#set -o nounset                                  # Treat unset variables as an error
case $1 in
*youtube.com/*)
	mpv --ytdl-format=22 "$1" > /dev/null
	;;
*reddit.com/*)
	rtv -l "$1"
	;;
*lifehacker.com/*)
	 librewolf "$1" > /dev/null
	;;
	*)
readable -q "$1" > ~/.newsboat/temparticle
WORDOCUNT=$(sed 's/<[^*]>//g' ~/.newsboat/temparticle | wc -w)
TIME=$(( (WORDOCUNT/250) ))
sed -i "s/<hr>/<hr>\n Estimated Reading Time: $TIME-$(( TIME+1)) minutes\n<hr>/" ~/.newsboat/temparticle
w3m -o confirm_qq=false -T text/html ~/.newsboat/temparticle
;;
esac
