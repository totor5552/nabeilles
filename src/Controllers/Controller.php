<?php

namespace app\Controllers;

class Controller{

    public function __construct($container){
        $this->container = $container;
    }

    public function listeFleurs($request, $response){
        $flowers = file_get_contents('http://www.ctrlouis.ovh:3000/flowers/');
        // var_dump($flowers);
        $this->container->view->render($response, "Accueil.html.twig", ['flowers' => $flowers]);
    }
}