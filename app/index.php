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

$container['db'] = function ($container) use ($capsule) {
    return $capsule;
};

session_start();

$app->get('/', '\\app\\Controllers\\Controller:listeFleurs')->setName('allFleur');
$app->get('/test', '\\app\\Controllers\\Test:Oui');
$app->post('/flower/:id','\\app\\Controllers\\Controller:editFleur');

try {
    $app->run();
} catch (Throwable $e) {
    var_dump($e);
}
