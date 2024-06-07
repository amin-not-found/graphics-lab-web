#!/bin/bash

# TODO : use a more sophisticated method to generate index.html

rm index.html
touch index.html
echo "<style>        
*{
    font-family: sans-serif;  
}         
li {                           
    font-size: x-large;        
}                             
</style>

<h2> Programs: </h2>
<ul>" >> index.html

for dir in */; do
    echo "<li><a href='./${dir}'> ${dir%/} </a></li>" >> index.html
done

echo "</ul>" >> index.html