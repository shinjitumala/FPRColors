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
}' "$input"
