#!/bin/sh
#===============================================================================
#         USAGE: ./pandog.sh [source directory] [destination directory] [website name]
#   DESCRIPTION: Static website generator, inspired by  https://github.com/fmash16/ssg5/blob/main/ssg5
#  REQUIREMENTS: pandoc
#       CREATED: 05/12/2022 02:13:07 PM
#      REVISION:  ---
#===============================================================================
#set -o nounset      # Treat unset variables as an error
SRC_DIR="$1"
DST_DIR="$2"
WEBSITE_NAME="$3"
COUNT=0
cp $SRC_DIR/index.md $SRC_DIR/index.md.backup
printf "\n# recent blog posts.   \n" >> $SRC_DIR/index.md
printf "\n# browse posts by tags.   \n" > $SRC_DIR/tag_index.md
#generate posts into a seperate folder
	if [[ -d $SRC_DIR/posts ]];then
		[ ! -d $DST_DIR/posts ] && mkdir $DST_DIR/posts
		cp $SRC_DIR/style.css $DST_DIR/posts/style.css || echo "WARNING: stylesheet file not found"
		for POST in $(ls -lt $SRC_DIR/posts/*)
		do
		if [[ $POST == *.md ]];then
				TITLE=$(grep -i "#" "$POST" | head -n1 | awk -F "# " '{ print $2 }')
				DATE=$(grep -i date "$POST" | head -n1 | awk -F ":" '{ print $2 }')
				TAGS=$(grep -i tags "$POST" | head -n1 | sed 's/*\[tags: //;s/].*$//')
				TAG1=$(echo $TAGS | awk -F ', ' '{print $1}')
				TAG2=$(echo $TAGS | awk -F ', ' '{print $2}')
				TAG3=$(echo $TAGS | awk -F ', ' '{print $3}')
				[ -f "$SRC_DIR/$TAG1.md" ] && rm "$SRC_DIR/$TAG1.md"
				[ -n "$TAG1" ] && printf "\n###$DATE - [$TITLE](posts/$(echo "$POST" | sed 's/src\/posts//;s/.md/.html/'))  \n" >> $SRC_DIR/$TAG1.md && printf "\n[$TAG1]($TAG1.html)" >> $SRC_DIR/tag_index.md
				[ -f "$SRC_DIR/$TAG2.md" ] && rm "$SRC_DIR/$TAG2.md"
				[ -n "$TAG2" ] && printf "\n###$DATE - [$TITLE](posts/$(echo "$POST" | sed 's/src\/posts//;s/.md/.html/'))  \n" >> $SRC_DIR/$TAG2.md && printf "\n[$TAG2]($TAG2.html)" >> $SRC_DIR/tag_index.md
				[ -f "$SRC_DIR/$TAG3.md" ] && rm "$SRC_DIR/$TAG3.md"
				[ -n "$TAG3" ] && printf "\n###$DATE - [$TITLE](posts/$(echo "$POST" | sed 's/src\/posts//;s/.md/.html/'))  \n" >> $SRC_DIR/$TAG3.md && printf "\n[$TAG3]($TAG3.html)" >> $SRC_DIR/tag_index.md
				NEW_POST="$DST_DIR/posts$(echo "$POST" | sed 's/src\/posts//;s/.md/.html/')"
				[ -f "$NEW_POST" ] && echo "WARNING:Found an existing post, Deleted $NEW_POST" && rm "$NEW_POST"
				cat $SRC_DIR/header.html > "$NEW_POST" || echo "WARNING: header file not found"
				sed -i "0,/title>/{s/title>/title> $WEBSITE_NAME | $TITLE/}" "$NEW_POST" 
				pandoc "$POST" --wrap=none >> "$NEW_POST"
				cat $SRC_DIR/footer.html >> "$NEW_POST" || echo "WARNING: footer file not found"
				printf "\n###$DATE - [$TITLE](posts/$(echo "$POST" | sed 's/src\/posts//;s/.md/.html/')) [[$(echo $TAGS | awk -F"," '{print $1}' | sed 's/ //' )](tag_index.html)]  \n" >> $SRC_DIR/index.md
				COUNT=$(( COUNT+1 ))
		fi
		done
	else
		echo "WARNING: posts folder doesn't exist"
	fi
printf "\n --- \n  *last website update: $(date -u +"%Y-%m-%d at %H:%M")*   \n" >> $SRC_DIR/index.md
cp $SRC_DIR/style.css $DST_DIR/style.css || echo "WARNING: stylesheet file not found"
#delete duplicate tags
cat -n $SRC_DIR/tag_index.md | sort -uk2 | sort -nk1 | cut -f2- > $SRC_DIR/tag_index.md.tmp
mv -f $SRC_DIR/tag_index.md.tmp $SRC_DIR/tag_index.md

for SRC_FILE in $SRC_DIR/* 
do
	if [[ $SRC_FILE == *.md ]];then
		#generate an output filename
		OUT=$DST_DIR/$(echo $SRC_FILE | sed 's/src\///;s/.md/.html/')
		#check if a page with the same name exists, delete it and print a warning
		[ -f "$OUT" ] && echo "WARNING:Found an existing page, Deleted $OUT" && rm "$OUT"
		cat $SRC_DIR/header.html > "$OUT" || echo "WARNING: header file not found"
		pandoc "$SRC_FILE" --wrap=none >> "$OUT"
		cat $SRC_DIR/footer.html >> "$OUT" || echo "WARNING: footer file not found"
		TITLE=$(grep -i "#" "$SRC_FILE" | head -n1 | awk -F "# " '{ print $2 }')
		sed -i "0,/title>/{s@title>@title> $WEBSITE_NAME | $TITLE@}" "$OUT" 
		COUNT=$(( COUNT+1 ))
	fi
done
mv -f $SRC_DIR/index.md.backup $SRC_DIR/index.md
echo "done, created: $COUNT new files"
