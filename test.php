<?php


$fleurs = file_get_contents('http://www.ctrlouis.ovh:3000/flowers/');

echo($fleurs);