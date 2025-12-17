<?php

class LivraisonController
{
    public static function index()
    {
        if (!isset($_SESSION['user'])) {
            Flight::redirect('/login');
        }

        $db = Flight::db();

        $data = [
            'colis'      => $db->query("SELECT * FROM livraison_Colis")->fetchAll(),
            'vehicules'  => $db->query("SELECT * FROM livraison_Vehicules")->fetchAll(),
            'chauffeurs' => $db->query("SELECT * FROM livraison_Chauffeur")->fetchAll(),
            'entrepots'  => $db->query("SELECT * FROM livraison_Entrepot")->fetchAll(),
            'livraisons' => $db->query("SELECT * FROM livraison_Livraison")->fetchAll()
        ];

        Flight::render('gestionLivraison', $data);
    }
}
