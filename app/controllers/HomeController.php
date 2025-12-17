<?php

class HomeController
{
    public static function index()
    {
        if (!isset($_SESSION['user'])) {
            Flight::redirect('/login');
        }

        Flight::render('accueil', [
            'user' => $_SESSION['user']
        ]);
    }
}
