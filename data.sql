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
        dateDonnee DATETIME,
        
    );
