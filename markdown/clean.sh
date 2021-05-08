#!/bin/bash

rm -f README.md preface.md

for chapter in ombra primavere geologia a-gravame nostos kresy-wschodnie

do
    rm -fr $chapter
done
