#!/bin/sh
# Pretty print csv files
perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | exec less -F -S -X- -K
