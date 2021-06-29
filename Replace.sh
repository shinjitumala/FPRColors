#!/bin/bash
input=$1
output=$2

function print_usage() {
    echo "Usage: $0 <input> <output>"
}

if [ ! -f "$input" ]; then
    echo "File \"$input\" does not exist."
    print_usage
    exit 1
fi
if [ -z "$output" ]; then
    print_usage
    exit 1
fi
if [ -f "$output" ]; then
    read -rp "File \"$output\" already exists. Overwrite? (y/n)" res
    case $res in
    [Yy]*) ;;
    [Nn]*) exit 0 ;;
    *) echo "Unknown response." && exit 1 ;;
    esac
fi

awk '{
    if(match($0, /"[^"]*": null/)){}else{print $0}
}' "$input" |
    sed 's/@BG@/#000000/g;s/@BO@/#4A4A4A/g;s/@MG@/#939393/g;s/@FG@/#DDDDDD/g;s/@AD@/#1D5224/g;s/@AM@/#3DA94B/g;s/@AL@/#5CFF72/g;s/@AF@/#BCF6BC/g;s/@WF@/#F8E8A0/g;s/@EF@/#F2ABB5/g;s/@IF@/#9298ED/g;s/@AB@/#037603/g;s/@WB@/#715D01/g;s/@EB@/#710211/g;s/@IB@/#030968/g;' >"$output"
