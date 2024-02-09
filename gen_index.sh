#!/bin/bash

# TODO : use a more sophisticated method to generate index.html

rm index.html
touch index.html
for dir in */; do
    echo "<a href='./${dir}'> ${dir} </a></br>" >> index.html
done