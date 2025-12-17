<?php

use app\controllers\ApiExampleController;
use app\middlewares\SecurityHeadersMiddleware;
use flight\Engine;
use flight\net\Router;

/** 
 * @var Router $router 
 * @var Engine $app
 */

// This wraps all routes in the group with the SecurityHeadersMiddleware
$router->group('', function(Router $router) use ($app) {

	Flight::route('GET /login', ['AuthController', 'loginForm']);
	Flight::route('POST /login', ['AuthController', 'login']);
	Flight::route('GET /logout', ['AuthController', 'logout']);

	Flight::route('GET /accueil', ['HomeController', 'index']);
	
	Flight::route('GET /livraison', ['LivraisonController', 'index']);

}, [ SecurityHeadersMiddleware::class ]);