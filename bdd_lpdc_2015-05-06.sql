# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# H�te: localhost (MySQL 5.6.22)
# Base de donn�es: bdd_lpdc
# Temps de g�n�ration: 2015-05-06 09:47:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table _possede
# ------------------------------------------------------------

LOCK TABLES `_possede` WRITE;
/*!40000 ALTER TABLE `_possede` DISABLE KEYS */;

INSERT INTO `_possede` (`id_Produit`, `id_Type_Contenant`)
VALUES
	(1,1),
	(3,1),
	(2,2);

/*!40000 ALTER TABLE `_possede` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table commande
# ------------------------------------------------------------

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;

INSERT INTO `commande` (`id_Commande`, `dateH_Commande`, `heure_Livraison`, `livraison`, `id_User`, `id_Etat`)
VALUES
	(2,'2015-05-06 11:46:00','2015-05-06 13:00:00','Livraison',1,2);

/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table commande_contient
# ------------------------------------------------------------

LOCK TABLES `commande_contient` WRITE;
/*!40000 ALTER TABLE `commande_contient` DISABLE KEYS */;

INSERT INTO `commande_contient` (`nombre_produit`, `id_Commande`, `id_Produit`)
VALUES
	(1,2,2);

/*!40000 ALTER TABLE `commande_contient` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table etat_commande
# ------------------------------------------------------------

LOCK TABLES `etat_commande` WRITE;
/*!40000 ALTER TABLE `etat_commande` DISABLE KEYS */;

INSERT INTO `etat_commande` (`id_Etat`, `libelle_Etat`)
VALUES
	(1,'A Valider'),
	(2,'En Cours'),
	(3,'En Attente'),
	(4,'Terminée');

/*!40000 ALTER TABLE `etat_commande` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table fabrique
# ------------------------------------------------------------

LOCK TABLES `fabrique` WRITE;
/*!40000 ALTER TABLE `fabrique` DISABLE KEYS */;

INSERT INTO `fabrique` (`id_Traiteur`, `id_Produit`)
VALUES
	(1,1),
	(1,2),
	(1,3);

/*!40000 ALTER TABLE `fabrique` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table menu
# ------------------------------------------------------------

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`nb_personne`, `id_Produit`, `prix`, `designation`, `description`)
VALUES
	(1,2,18,'Menu du Jour','Préparé à base de produits frais du marché.');

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table menu_contient
# ------------------------------------------------------------

LOCK TABLES `menu_contient` WRITE;
/*!40000 ALTER TABLE `menu_contient` DISABLE KEYS */;

INSERT INTO `menu_contient` (`id_Produit_Menu`, `id_Produit_Plat`)
VALUES
	(2,1),
	(2,3);

/*!40000 ALTER TABLE `menu_contient` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table panier
# ------------------------------------------------------------



# Affichage de la table panier_contient
# ------------------------------------------------------------



# Affichage de la table plat
# ------------------------------------------------------------

LOCK TABLES `plat` WRITE;
/*!40000 ALTER TABLE `plat` DISABLE KEYS */;

INSERT INTO `plat` (`id_Produit`, `nb_Personne`, `est_Chaud`, `prix`, `designation`, `description`, `id_Type_Cuisine`)
VALUES
	(1,1,1,15,'Magret de Canard','Elevé en France, #OKLM',1),
	(3,1,0,8.5,'Oeufs en Couille d\'Âne','Oeufs meurette revisité',1);

/*!40000 ALTER TABLE `plat` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table produit
# ------------------------------------------------------------

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;

INSERT INTO `produit` (`id_Produit`, `designation_Produit`, `prix`)
VALUES
	(1,'',0),
	(2,'',0),
	(3,'',0);

/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table traiteur
# ------------------------------------------------------------

LOCK TABLES `traiteur` WRITE;
/*!40000 ALTER TABLE `traiteur` DISABLE KEYS */;

INSERT INTO `traiteur` (`id_Traiteur`, `nom_Traiteur`, `adresse`, `tel_Traiteur`)
VALUES
	(1,'Au Vilain Petit Canard','41 rue Franklin 69002 Lyon','0478623477');

/*!40000 ALTER TABLE `traiteur` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table type_contenant
# ------------------------------------------------------------

LOCK TABLES `type_contenant` WRITE;
/*!40000 ALTER TABLE `type_contenant` DISABLE KEYS */;

INSERT INTO `type_contenant` (`id_Type_Contenant`, `designation_Type_Contenant`)
VALUES
	(1,'Boite biodégradable'),
	(2,'Sac en papier biodégradable');

/*!40000 ALTER TABLE `type_contenant` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table type_cuisine
# ------------------------------------------------------------

LOCK TABLES `type_cuisine` WRITE;
/*!40000 ALTER TABLE `type_cuisine` DISABLE KEYS */;

INSERT INTO `type_cuisine` (`id_Type_Cuisine`, `designation_Type_Cuisine`)
VALUES
	(1,'Français');

/*!40000 ALTER TABLE `type_cuisine` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table user
# ------------------------------------------------------------

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id_User`, `nom`, `prenom`, `date_Naissance`, `adresse`, `telephone`, `email`, `password`)
VALUES
	(1,'COUTURIER','AurÃ©lien','0000-00-00','','0612345678','aurelien.couturier@epsi.fr','coucou'),
	(2,'MURE','SÃ©bastien','0000-00-00','','0612345678','sebastien.mure@epsi.fr','coucou'),
	(3,'SEMPE','Jean-Baptiste','0000-00-00','','0612345678','jeanbaptiste.sempe@epsi.fr','coucou'),
	(4,'THIRY','Nicolas','0000-00-00','','0612345678','nicolas.thiry@epsi.fr','coucou');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
