#!/bin/bash
out=Replace.sh

base=ReplaceBase.in.sh
tables=README.md

code=$(cat "$base")

# Parse table
pattern=$(awk '{
    if(match($0, /`([^`]+)` *\| *!\[\]\(https:\/\/via\.placeholder\.com\/15\/([^/]+)/, m)){
        printf "s/" m[1] "/#" m[2] "/g;";
    }
}' "$tables")

code+=" |"
code+=$'\n'
code+="    sed '$pattern' >\"\$output\"";

echo "$code" >"$out"
