#!/bin/bash
if [ -f ~/.tasks/t/t.py ]; then
    title="t: "
    counter=`python ~/.tasks/t/t.py --task-dir ~/.tasks --list tasks | wc -l`

    if [ $counter -gt 0 ]; then
        echo $title $counter "|"
    fi;
fi;
