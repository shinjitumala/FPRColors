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

sed 's/@BG@/000000/g; s/@BO@/4A4A4A/g; s/@MG@/939393/g; s/@FG@/DDDDDD/g; s/@AD@/1D5224/g; s/@AM@/3DA94B/g; s/@AL@/5CFF72/g' "$input" >"$output"
