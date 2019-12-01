#!/bin/sh
# Pretty print tsv files : tab seperated
perl -pe 's/((?<=\t)|(?<=^))\t/ \t/g;' "$@" | column -t -s $'\t' | less  -F -S -X -K
