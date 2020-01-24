<?php

require_once './vendor/autoload.php';
require_once './src/Config/Config.inc.php';

use Slim\Http\Request;
use Slim\Http\Response;
use Illuminate\Database\Capsule\Manager as DB;
use app\Models\Musique;

$container = array();

$container['flash'] = function ($container){
    return new \Slim\Flash\Messages;
};

$container["view"] = function ($container){

    $view = new \Slim\Views\Twig(__DIR__.'/src/Views');
    $router = $container->get('router');
    $uri = \Slim\Http\Uri::createFromEnvironment(new \Slim\Http\Environment($_SERVER));
    $view->addExtension(new \Slim\Views\TwigExtension($router, $uri));
    $view->getEnvironment()->addGlobal('flash', $container->flash);
    return $view;
};


// $container['settings'] = $config;

//Eloquent
$app = new \Slim\App($container,[
    'settings' => [
        'debug' => true,
        'displayErrorDetails' => true
    ]
]);

/**
 * on initialise la conn
 */
$capsule = new DB();
// $capsule->addConnection($container['settings']['db']);
// $capsule->setAsGlobal();
// $capsule->bootEloquent();

$container['db'] = function ($container) use ($capsule) {
    return $capsule;
};

session_start();


$app->get('/', function(Request $request, Response $response, $args){
    return $this->view->render($response, 'Accueil.html.twig');
})->setName('accueil');

// $app->get('/playlist/creer', '\\app\\Controllers\\PlaylistController:accessCreationPlaylist')->setName('creerplaylist');


try {
    $app->run();
} catch (Throwable $e) {
    var_dump($e);
}
