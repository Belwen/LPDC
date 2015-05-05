#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        id_User        int (11) Auto_increment  NOT NULL ,
        nom            Varchar (30) NOT NULL ,
        prenom         Varchar (30) NOT NULL ,
        date_Naissance Date NOT NULL ,
        adresse        Varchar (100) NOT NULL ,
        telephone      Varchar (12) NOT NULL ,
        mail           Varchar (40) NOT NULL ,
        password       Varchar (30) NOT NULL ,
        PRIMARY KEY (id_User )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Plat
#------------------------------------------------------------

CREATE TABLE Plat(
        nb_Personne     Int NOT NULL ,
        est_Chaud       Bool NOT NULL ,
        id_Produit      Int NOT NULL ,
        id_Type_Cuisine Int NOT NULL ,
        PRIMARY KEY (id_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Traiteur
#------------------------------------------------------------

CREATE TABLE Traiteur(
        id_Traiteur  int (11) Auto_increment  NOT NULL ,
        nom_Traiteur Varchar (30) NOT NULL ,
        adresse      Varchar (100) NOT NULL ,
        tel_Traiteur Varchar (12) NOT NULL ,
        PRIMARY KEY (id_Traiteur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Produit
#------------------------------------------------------------

CREATE TABLE Produit(
        id_Produit          int (11) Auto_increment  NOT NULL ,
        designation_Produit Varchar (50) NOT NULL ,
        prix                Float NOT NULL ,
        PRIMARY KEY (id_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Menu
#------------------------------------------------------------

CREATE TABLE Menu(
        nb_personne Int NOT NULL ,
        id_Produit  Int NOT NULL ,
        PRIMARY KEY (id_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type Cuisine
#------------------------------------------------------------

CREATE TABLE Type_Cuisine(
        id_Type_Cuisine          int (11) Auto_increment  NOT NULL ,
        designation_Type_Cuisine Varchar (100) NOT NULL ,
        PRIMARY KEY (id_Type_Cuisine )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type Contenant
#------------------------------------------------------------

CREATE TABLE Type_Contenant(
        id_Type_Contenant          int (11) Auto_increment  NOT NULL ,
        designation_Type_Contenant Varchar (100) NOT NULL ,
        PRIMARY KEY (id_Type_Contenant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        id_Commande       int (11) Auto_increment  NOT NULL ,
        estValide         Bool NOT NULL ,
        estPayee          Bool NOT NULL ,
        estPrete          Bool NOT NULL ,
        dateH_Commande    Datetime NOT NULL ,
        id_User           Int NOT NULL ,
        heure_Livraison   Datetime NOT NULL ,
        id_Type_Livraison Int NOT NULL ,
        PRIMARY KEY (id_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type Livraison
#------------------------------------------------------------

CREATE TABLE Type_Livraison(
        id_Type_Livraison          int (11) Auto_increment  NOT NULL ,
        designation_Type_Livraison Varchar (30) NOT NULL ,
        PRIMARY KEY (id_Type_Livraison )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: contient
#------------------------------------------------------------

CREATE TABLE contient(
        id_Produit   Int NOT NULL ,
        id_Produit_1 Int NOT NULL ,
        PRIMARY KEY (id_Produit ,id_Produit_1 )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fabrique
#------------------------------------------------------------

CREATE TABLE Fabrique(
        id_Traiteur Int NOT NULL ,
        id_Produit  Int NOT NULL ,
        PRIMARY KEY (id_Traiteur ,id_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: _Possède
#------------------------------------------------------------

CREATE TABLE _Possede(
        id_Produit        Int NOT NULL ,
        id_Type_Contenant Int NOT NULL ,
        PRIMARY KEY (id_Produit ,id_Type_Contenant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: _contient
#------------------------------------------------------------

CREATE TABLE _contient(
        nombre_produit Int NOT NULL ,
        id_Commande    Int NOT NULL ,
        id_Produit     Int NOT NULL ,
        PRIMARY KEY (id_Commande ,id_Produit )
)ENGINE=InnoDB;

ALTER TABLE Plat ADD CONSTRAINT FK_Plat_id_Produit FOREIGN KEY (id_Produit) REFERENCES Produit(id_Produit);
ALTER TABLE Plat ADD CONSTRAINT FK_Plat_id_Type_Cuisine FOREIGN KEY (id_Type_Cuisine) REFERENCES Type_Cuisine(id_Type_Cuisine);
ALTER TABLE Menu ADD CONSTRAINT FK_Menu_id_Produit FOREIGN KEY (id_Produit) REFERENCES Produit(id_Produit);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Type_Livraison FOREIGN KEY (id_Type_Livraison) REFERENCES Type_Livraison(id_Type_Livraison);
ALTER TABLE contient ADD CONSTRAINT FK_contient_id_Produit FOREIGN KEY (id_Produit) REFERENCES Produit(id_Produit);
ALTER TABLE contient ADD CONSTRAINT FK_contient_id_Produit_1 FOREIGN KEY (id_Produit_1) REFERENCES Produit(id_Produit);
ALTER TABLE Fabrique ADD CONSTRAINT FK_Fabrique_id_Traiteur FOREIGN KEY (id_Traiteur) REFERENCES Traiteur(id_Traiteur);
ALTER TABLE Fabrique ADD CONSTRAINT FK_Fabrique_id_Produit FOREIGN KEY (id_Produit) REFERENCES Produit(id_Produit);
ALTER TABLE _Possede ADD CONSTRAINT FK__Possede_id_Produit FOREIGN KEY (id_Produit) REFERENCES Produit(id_Produit);
ALTER TABLE _Possede ADD CONSTRAINT FK__Possede_id_Type_Contenant FOREIGN KEY (id_Type_Contenant) REFERENCES Type_Contenant(id_Type_Contenant);
ALTER TABLE _contient ADD CONSTRAINT FK__contient_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id_Commande);
ALTER TABLE _contient ADD CONSTRAINT FK__contient_id_Produit FOREIGN KEY (id_Produit) REFERENCES Produit(id_Produit);
