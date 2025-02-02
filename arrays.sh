#!/bin/bash

MOVIES=("The Shawshank Redemption" "The Godfather" "The Dark Knight" "The Godfather II" "The Lord of the Rings: The Return of the King" "Pulp Fiction" "Schindler's List" "12 Angry")


echo "the fist movie is ${MOVIES[0]}
echo "the second movie is ${MOVIES[1]}

echo "all movies are ${MOVIES[@]}"
echo "all movies are ${MOVIES[*]}"