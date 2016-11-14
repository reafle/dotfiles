#!/bin/bash
command -v upower > /dev/null 2>&1 || { exit 1; }

# TODO: round to 2 floating points
percentage=`upower -i \`upower -e | grep battery -i\` | grep percentage -i | awk '{ print $2; }' | tr -d '\%'`

charging=`upower -i \`upower -e | grep battery -i\` | grep state -i | awk '{ print (index($2, "charg") != 0) ? "⚡" : ""; }'`
echo $charging $percentage %
