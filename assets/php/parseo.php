<?php
$json=file_get_contents('https://di.unsa.edu.ar/wp-json/wp/v2/pages');
$array=json_decode($json);
echo("<pre>");
var_dump($array);
echo("</pre>");