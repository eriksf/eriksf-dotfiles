#!/usr/bin/env bash

find . -path ./.git -prune -o -type f -print0 | while IFS= read -r -d '' file
do
    n=$(echo $file | sed 's|./||')
    t=""
    if [ "$n" -ot "../$n" ]; then
        t="(newer)"
    fi
    #echo "Diffing $n $t..."
    out=$(diff $n ../$n 2>/dev/null)
    if [[ ! -z $out ]]; then
        echo "Found difference in $n $t..."
        echo "$out"
    fi
done
