#!/usr/bin/env bash

printf '
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resultado</title>
<link rel="stylesheet" href="style.css">
</head>
<body id="result">
<h1 id="h1_results">Respostas</h1>
' > answers.html
while read line;
do
    echo $line | sed -E 's/[[:space:]]*,[[:space:]]*/,/g; s/^ *| *$//g' |  sed -E 's/([^,]+),([^,]+),["]?([^"]+)["]?/<p class="p_results">Casa: \1<br>Valor da casa: \2<br>Resultado: \3<\/p>/g' >> answers.html

done < answers.csv
printf '
</body>
</html>
' >> answers.html
