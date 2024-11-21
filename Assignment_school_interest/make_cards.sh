#!/usr/bin/env bash

printf '
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cartas</title>
<link rel="stylesheet" href="style.css">
</head>
<body id="cartas">
' > cards.html
while read line;
do

    echo $line | sed -E 's/[[:space:]]*,[[:space:]]*/,/g; s/^ *| *$//g' |  sed -E 's/([^,]+),([^,]+),["]?([^"]+)["]?,([^,]+),["]?([^",]+)["]?,["]?([^"]+)["]?/<div><p class="center">Carta N°: \1<\/p><p>Taxa de juros: \3 \5<br>Tipo de juros: \4<br>Periodo de aplicação: \6<\/p><\/div>/g' >> cards.html

done < cards.csv
printf '
</body>
</html>
' >> cards.html
