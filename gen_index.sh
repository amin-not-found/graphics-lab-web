#!/bin/bash

# TODO : use a more sophisticated method to generate index.html

rm index.html
touch index.html
printf "<!DOCTYPE html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<style>
html,body{
    margin: 0;
    padding: 1rem;
}
*{
    font-family: sans-serif;
}
li {
    font-size: x-large;
}
</style>
</head>

<body>
<h2> Programs: </h2>
<ul>\n" >> index.html

for dir in */; do
    printf "  <li><a href='./${dir}'>" >> index.html
    printf "${dir%/}" | sed -r 's/(^|_)(\w)/\U \2/g' >> index.html
    printf "</a></li>\n" >> index.html
done

printf "</ul>\n</body>" >> index.html