<?php

use app\controllers\AuthController;
use app\controllers\HomeController;
use app\controllers\LivraisonController;
use app\middlewares\SecurityHeadersMiddleware;
use flight\Engine;
use flight\net\Router;

/** 
 * @var Router $router 
 * @var Engine $app
 */

// Ajoutez ces use statements en haut
// ou utilisez directement les classes avec leur namespace

$router->group('', function(Router $router) use ($app) {

    // Utilisez le namespace complet
    Flight::route('GET /login', ['app\controllers\AuthController', 'loginForm']);
    Flight::route('POST /login', ['app\controllers\AuthController', 'login']);
    Flight::route('GET /logout', ['app\controllers\AuthController', 'logout']);

    Flight::route('GET /accueil', ['app\controllers\HomeController', 'index']);
    
    Flight::route('GET /livraison', ['app\controllers\LivraisonController', 'index']);

}, [ SecurityHeadersMiddleware::class ]);