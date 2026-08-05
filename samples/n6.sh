#!/bin/bash

#This is an array script 

MOVIES=("pushpa" "rrr" "kgf" "r1")
GAMES=("f1" , "marrio")

echo "Below will be displayed the names of movies"

echo "First movie in array is ${MOVIES[0]}"

echo "Second movie in array is ${MOVIES[1]}"

echo "Third movie in array is ${MOVIES[2]}"

echo "To display all movies in array list are ${MOVIES[@]}"

echo "First game is ${GAMES[0]}"

echo "All games are ${GAMES[@]}"

echo "All movies and games are ${MOVIES[@]} and ${GAMES[@]}"

