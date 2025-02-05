#!/bin/sh

BRANCHES=$(git branch | grep -E -v "(main|\*)" | sed 's/^  //' | tr '\n' ' ')

if [[ -z "$BRANCHES" ]]
then
    echo "No branches to delete."
    exit 0
fi

echo -e "${BRANCHES// /\n}"

read -p "Delete these branches [Yy/Nn] ? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "$BRANCHES" | xargs git branch -D
fi
