#!/bin/bash

rm -f README.md

for chapter in preface ombra primavere geologia a-gravame nostos kresy-wschodnie

do
    rm -fr $chapter
done
