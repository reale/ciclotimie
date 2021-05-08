#!/bin/bash

# A special csplit(1) is needed, see https://github.com/reale/coreutils

CSPLIT=../../../coreutils/src/csplit

cat > README.md <<EOF
# Ciclotimie

* Ciclotimie
    * [preface](preface.md)
EOF

# preface

sed 's/\\[^{\]\+\({[^}]\+}\)*//' ../tex/preface.tex > preface.md


#chapters

for chapter in ombra primavere geologia a-gravame nostos kresy-wschodnie

do
    rm -fr $chapter && mkdir $chapter

    (
        cd $chapter

        sed -n '/^\\poemtitle{/,$p' ../../tex/$chapter.tex \
            | $CSPLIT -o 1 -sz -n 2 -f '' -b '%02d.md' - '/\\poemtitle{.*}/' '{*}'

        for f in ??.md
        do
            poemtitle="$(sed -n 's/\\poemtitle{\(.*\)}/\1/p' "$f")"
            echo "    * [$chapter - $poemtitle]($chapter/$f)" >> ../README.md

            sed -i 's/\\poemtitle{\(.*\)}/# \1/' "$f"
            sed -i 's/\\[^{\]\+\({[^}]\+}\)*//'  "$f"
            sed -i 's/\\\\/  /'                  "$f"
            sed -i 's/^[ \t]*//'                 "$f"

            cat -s "$f" > "$f~" && mv "$f~" "$f"

            sed -i '${/^$/d;}'                   "$f"
        done
    )
done
