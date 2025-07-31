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
    padding: 0.75rem;
}
*{
    font-family: sans-serif;
}
li {
    font-size: larger;
}
a {
    text-decoration: none;
}
a:hover, a:focus {
    text-decoration: underline;
}
.description {
    font-size: 0.8em;
    margin-top: 0.3em;
    margin-bottom: 0.5em;
    padding-left: 1em;
}
</style>
</head>

<body>
<h2> Graphics Lab Programs: </h2>
<ul>\n" >> index.html


for path in ../src/*; do
    description=$(head -1 "$path")
    if [[ "$description" =~ "//\s*disabled" ]]; then
        continue;
    elif [[ "$description" == "// *" ]]; then
        description="${description:3}"
    else
        description=""
    fi

    prog=$(basename "$path" .c)
    # Convert snake_case to human readable title
    title=$(echo -n "$prog" | awk -F_ '{for(i=1;i<=NF;i++)$i=toupper(substr($i,1,1)) substr($i,2); print}')

    echo -n "  <li><a tabindex='0' href='./${prog}'>" >> index.html
    echo -n "$title" >> index.html
    echo -n "</a><p class=\"description\">" >> index.html
    echo -n "$description" >> index.html
    echo    "</p></li>" >> index.html
done

printf "</ul>\n</body>" >> index.html