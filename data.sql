    CREATE OR REPLACE DATABASE livraisonNoelS3;

    USE livraisonNoelS3;

    CREATE TABLE livraison_Societes(
        id INT AUTO_INCREMENT PRIMARY KEY ,
        nomSociete VARCHAR(25),
        addresseSociete VARCHAR(20)
    );

    CREATE TABLE livraison_Vehicules(
        id INT AUTO_INCREMENT PRIMARY KEY,
        nomVehicule VARCHAR(50),
        idSociete INT,
        idTypeVehicule INT 
    );

    CREATE TABLE livraison_Chauffeur (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nomChauffeur VARCHAR(75),
        idVehicule INT,
        idSociete INT,
        salaire DOUBLE
    );

-- mvt
    CREATE TABLE livraison_Livraison(
        id INT AUTO_INCREMENT PRIMARY KEY,
        idColis INT,
        idEntrepot INT,
        destination VARCHAR(30),
        idVehicule INT,
        idEtat INT,
        coutVoiture DOUBLE,
        salaireJournalier DOUBLE,
        idChauffeur INT,
        dateLivraison DATETIME
    );

    CREATE TABLE livraison_TypeVehicules(
        id INT AUTO_INCREMENT PRIMARY KEY,
        poidsMax DOUBLE
    );

    CREATE TABLE livraison_Colis(
        id INT AUTO_INCREMENT PRIMARY KEY,
        descriptionColi VARCHAR(50),
        prixUnitaire DOUBLE,
        poidsColis DOUBLE
    );

    CREATE TABLE livraison_Entrepot(
        id INT AUTO_INCREMENT PRIMARY KEY,
        adresseEntrepot VARCHAR(20),
        nomEntrepot VARCHAR(50)
    );

    CREATE TABLE livraison_EtatLivraison(
        id INT AUTO_INCREMENT PRIMARY KEY,
        etatlivraison VARCHAR(20)
    );
-- pour le moment
    CREATE TABLE livraison_ZoneLivraison(
        id INT AUTO_INCREMENT PRIMARY KEY,
        zoneLivraison VARCHAR(20)
    );

    CREATE TABLE livraison_HistoriqueBenefice(
        id INT AUTO_INCREMENT PRIMARY KEY,
        dateDonnee DATETIME
        
    );


DROP VIEW IF EXISTS livraison_v_HistoriqueBenefice;

CREATE VIEW livraison_v_HistoriqueBenefice AS
SELECT 
    DATE(l.dateLivraison) AS jour,
    MONTH(l.dateLivraison) AS mois,
    YEAR(l.dateLivraison) AS annee,

    SUM(c.prixUnitaire * c.poidsColis) AS chiffreAffaire,

    SUM(l.coutVoiture + l.salaireJournalier) AS coutRevient,

    SUM(
        (c.prixUnitaire * c.poidsColis) 
        - (l.coutVoiture + l.salaireJournalier)
    ) AS benefice

FROM livraison_Livraison l
JOIN livraison_Colis c ON l.idColis = c.id
WHERE l.idEtat = 2   -- LIVRÉ
GROUP BY 
    jour, mois, annee;



DROP VIEW IF EXISTS livraison_v_livraison_detail;

CREATE VIEW livraison_v_livraison_detail AS
SELECT 
    l.id,
    c.descriptionColi,
    v.nomVehicule,
    ch.nomChauffeur,
    e.nomEntrepot,
    el.etatlivraison,
    l.dateLivraison,
    l.coutVoiture,
    l.salaireJournalier
FROM livraison_Livraison l
JOIN livraison_Colis c ON l.idColis = c.id
JOIN livraison_Vehicules v ON l.idVehicule = v.id
JOIN livraison_Chauffeur ch ON l.idChauffeur = ch.id
JOIN livraison_Entrepot e ON l.idEntrepot = e.id
JOIN livraison_EtatLivraison el ON l.idEtat = el.id;


