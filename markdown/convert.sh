#!/bin/bash

for f in *.md
do
    poemtitle="$(sed -n 's/\\poemtitle{\(.*\)}/\1/p' "$f")"
    echo "    * [$poemtitle]($f)" >> README.md

    sed -i 's/\\poemtitle{\(.*\)}/# \1/' "$f"
    sed -i 's/\\[^{\]\+\({[^}]\+}\)*//'  "$f"
    sed -i 's/\\\\/  /'                  "$f"
    sed -i 's/^[ \t]*//'                 "$f"

    cat -s "$f" > "$f~" && mv "$f~" "$f"

    sed -i '${/^$/d;}'                   "$f"
done
