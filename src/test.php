<?php


$flowerJson = json_encode(array(
    'id' => 46,
    'original_name' => 'Erythroxylum coca',
    'name'=> 'coca',
    'height'=> 2,
    'nectar'=> 2,
    'pollen' => 2,
    'miellat' => '',
    'flowering' => 'mai',
    'location' => 'peru',
    'points' => 10,
    'img' => ""
));
$adresse = "http://www.ctrlouis.ovh:3000/flowers/". $id;

$ch = curl_init($adresse);
curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch,CURLOPT_PUT, true);

curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Content-type: application/json'
));
curl_setopt($ch, CURLOPT_POSTFIELDS, $flowerJson);

curl_exec($ch);
curl_close($ch);

