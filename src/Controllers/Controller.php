<?php

namespace app\Controllers;

class Controller{

    public function __construct($container){
        $this->container = $container;
    }

    public function listeFleurs($request, $response){
        $flowers = json_decode(file_get_contents('http://www.ctrlouis.ovh:3000/flowers/'));
        $this->container->view->render($response, "Accueil.html.twig", ['flowers' => $flowers]);
    }

    public function EditFleur($request, $response){



        $id = $_POST['id'];
        $original_name = $_POST['original_name'];
        $name = $_POST['name'];
        $height = $_POST['height'];
        $nectar =$_POST['nectar'];
        $pollen = $_POST['pollen'];
        $miellat = $_POST['miellat'];
        $flowering = $_POST['flowering'];
        $location = $_POST['location'];
        $points = $_POST['points'];
        $img = $_POST['img'];
        $id = $_POST['id'];

        /*
        $original_name = Slim::getInstance()->request->post('original_name');
        $name = Slim::getInstance()->request->post('name');
        $height = Slim::getInstance()->request->post('height');
        $nectar = Slim::getInstance()->request->post('nectar');
        $pollen = Slim::getInstance()->request->post('pollen');
        $miellat = Slim::getInstance()->request->post('miellat');
        $flowering = Slim::getInstance()->request->post('flowering');
        $location = Slim::getInstance()->request->post('location');
        $points = Slim::getInstance()->request->post('points');
        $img = Slim::getInstance()->request->post('img');
        */


        $flowerJson = json_encode(array(
            'id' => $id,
            'original_name' => $original_name,
            'name'=> $name,
            'height'=> $height,
            'nectar'=> $nectar,
            'pollen' => $pollen,
            'miellat' => $miellat,
            'flowering' => $flowering,
            'location' => $location,
            'points' => $points,
            'img' => $img
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

        echo($flowerJson);

       self::listeFleurs($request, $response);
    }

    public function impressionQRcode(){

    }

    public function deleteFleur(){
        
    }
}