#! /bin/bash

MOVIES=("rrr" "pushpa" "gc" "avatar")

echo "First movie is: ${MOVIES[0]}"
echo "Second movie is : ${MOVIES[1]}"
echo "Third movie is : ${MOVIES[2]}"
echo "All movies are :: ${MOVIES[@]}"

TIMESTAMP=$(date)
echo "Script executed at : $TIMESTAMP"