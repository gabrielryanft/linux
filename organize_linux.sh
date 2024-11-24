#!/bin/bash

organize () {
	tmp_file=$(mktemp)
	ls "$2" | grep -v -e "README.md" -e "LICENSE" -e "organize_linux.sh" -e "index.html" > $tmp_file
	printf "# $(basename $2) \n" > "$2/README.md"
	while read -r name
	do 
		if [ "$(file -b "$2/$name")" = "directory" ]; then
			printf "<a href='$1/$name/' target='_blank' rel='next'>$name</a><br/>\n" >> "$2/README.md"
			organize "$1/$name" "$2/$name"
		else
			printf "<a href='$1/$name' target='_blank' rel='next'>$name</a><br/>\n" >> "$2/README.md"
		fi
	done < "$tmp_file"
}
organize "https://gabrielryanft.github.io/linux" "$(pwd)"

