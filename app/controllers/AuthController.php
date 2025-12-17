<?php

class AuthController
{
    public static function loginForm()
    {
        Flight::render('login');
    }

    public static function login()
    {
        $login = $_POST['loginUser'];
        $mdp   = $_POST['mdp'];

        $db = Flight::db();
        $sql = "SELECT * FROM livraison_User WHERE loginUser = ? AND mdp = ?";
        $stmt = $db->prepare($sql);
        $stmt->execute([$login, $mdp]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            $_SESSION['user'] = $user;
            Flight::redirect('/accueil');
        } else {
            Flight::render('login', [
                'error' => 'Login ou mot de passe incorrect'
            ]);
        }
    }

    public static function logout()
    {
        session_destroy();
        Flight::redirect('/login');
    }
}
