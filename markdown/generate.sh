#!/bin/bash

# A special csplit(1) is needed, see https://github.com/reale/coreutils

CSPLIT=../../../coreutils/src/csplit

cat > README.md <<EOF
# Ciclotimie

* Ciclotimie
EOF

for chapter in estati geologia giovaneuomo gravame inverni kresywschodnie nostoi ombra pan primavere
do
    rm -fr $chapter && mkdir $chapter

    (
        cd $chapter

        $CSPLIT -o 1 -sz -n 2 -f '' -b '%02d.md' ../../tex/$chapter.tex '/\\poemtitle{.*}/' '{*}'

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
