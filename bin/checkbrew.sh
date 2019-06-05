#!/usr/bin/env bash

for i in $(brew leaves)
do
    found=$(egrep -c "brew install \b${i}\b([^-]|$)" brew.sh)
    if [[ $found -ne 1 ]]; then
        echo "Check ${i} [${found}]... "
    fi
done

for i in $(brew cask list)
do
    found=$(egrep -c "brew cask install \b${i}\b([^-]|$)" brew.sh)
    if [[ $found -ne 1 ]]; then
        echo "Check cask ${i} [${found}]... "
    fi
done
