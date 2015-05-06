-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 06 Mai 2015 à 09:34
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bddcanard`
--
CREATE DATABASE IF NOT EXISTS `bddcanard` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bddcanard`;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id_Commande` int(11) NOT NULL AUTO_INCREMENT,
  `dateH_Commande` datetime NOT NULL,
  `heure_Livraison` datetime NOT NULL,
  `id_User` int(11) NOT NULL,
  `id_Type_Livraison` int(11) NOT NULL,
  `id_Etat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Commande`),
  KEY `FK_Commande_id_User` (`id_User`),
  KEY `id_Type_Livraison` (`id_Type_Livraison`),
  KEY `id_Etat` (`id_Etat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commande_contient`
--

CREATE TABLE IF NOT EXISTS `commande_contient` (
  `nombre_produit` int(11) NOT NULL,
  `id_Commande` int(11) NOT NULL,
  `id_Produit` int(11) NOT NULL,
  PRIMARY KEY (`id_Commande`,`id_Produit`),
  KEY `FK__contient_id_Produit` (`id_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etat_commande`
--

CREATE TABLE IF NOT EXISTS `etat_commande` (
  `id_Etat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_Etat` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Etat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fabrique`
--

CREATE TABLE IF NOT EXISTS `fabrique` (
  `id_Traiteur` int(11) NOT NULL,
  `id_Produit` int(11) NOT NULL,
  PRIMARY KEY (`id_Traiteur`,`id_Produit`),
  KEY `FK_Fabrique_id_Produit` (`id_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `nb_personne` int(11) NOT NULL,
  `id_Produit` int(11) NOT NULL,
  PRIMARY KEY (`id_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `menu_contient`
--

CREATE TABLE IF NOT EXISTS `menu_contient` (
  `id_Produit` int(11) NOT NULL,
  `id_Produit_1` int(11) NOT NULL,
  PRIMARY KEY (`id_Produit`,`id_Produit_1`),
  KEY `FK_contient_id_Produit_1` (`id_Produit_1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE IF NOT EXISTS `panier` (
  `id_Panier` int(11) NOT NULL AUTO_INCREMENT,
  `dateTime` datetime NOT NULL,
  `id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Panier`),
  KEY `id_User` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `panier_contient`
--

CREATE TABLE IF NOT EXISTS `panier_contient` (
  `nombre_produit` int(11) NOT NULL,
  `id_Panier` int(11) NOT NULL,
  `id_Produits` int(11) NOT NULL,
  PRIMARY KEY (`id_Panier`,`id_Produits`),
  KEY `id_Panier` (`id_Panier`),
  KEY `id_Produits` (`id_Produits`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE IF NOT EXISTS `plat` (
  `nb_Personne` int(11) NOT NULL,
  `est_Chaud` tinyint(1) NOT NULL,
  `id_Produit` int(11) NOT NULL,
  `id_Type_Cuisine` int(11) NOT NULL,
  PRIMARY KEY (`id_Produit`),
  KEY `FK_Plat_id_Type_Cuisine` (`id_Type_Cuisine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id_Produit` int(11) NOT NULL AUTO_INCREMENT,
  `designation_Produit` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `traiteur`
--

CREATE TABLE IF NOT EXISTS `traiteur` (
  `id_Traiteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_Traiteur` varchar(30) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `tel_Traiteur` varchar(12) NOT NULL,
  PRIMARY KEY (`id_Traiteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_contenant`
--

CREATE TABLE IF NOT EXISTS `type_contenant` (
  `id_Type_Contenant` int(11) NOT NULL AUTO_INCREMENT,
  `designation_Type_Contenant` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Type_Contenant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_cuisine`
--

CREATE TABLE IF NOT EXISTS `type_cuisine` (
  `id_Type_Cuisine` int(11) NOT NULL AUTO_INCREMENT,
  `designation_Type_Cuisine` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Type_Cuisine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_livraison`
--

CREATE TABLE IF NOT EXISTS `type_livraison` (
  `id_Type_Livraison` int(11) NOT NULL AUTO_INCREMENT,
  `designation_Type_Livraison` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Type_Livraison`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_User` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `date_Naissance` date NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `telephone` varchar(12) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `_possede`
--

CREATE TABLE IF NOT EXISTS `_possede` (
  `id_Produit` int(11) NOT NULL,
  `id_Type_Contenant` int(11) NOT NULL,
  PRIMARY KEY (`id_Produit`,`id_Type_Contenant`),
  KEY `FK__Possede_id_Type_Contenant` (`id_Type_Contenant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Etat` FOREIGN KEY (`id_Etat`) REFERENCES `etat_commande` (`id_Etat`),
  ADD CONSTRAINT `FK_Commande_id_Type_Livraison` FOREIGN KEY (`id_Type_Livraison`) REFERENCES `type_livraison` (`id_Type_Livraison`),
  ADD CONSTRAINT `FK_Commande_id_User` FOREIGN KEY (`id_User`) REFERENCES `user` (`id_User`);

--
-- Contraintes pour la table `commande_contient`
--
ALTER TABLE `commande_contient`
  ADD CONSTRAINT `FK__contient_id_Produit` FOREIGN KEY (`id_Produit`) REFERENCES `produit` (`id_Produit`),
  ADD CONSTRAINT `FK__contient_id_Commande` FOREIGN KEY (`id_Commande`) REFERENCES `commande` (`id_Commande`);

--
-- Contraintes pour la table `fabrique`
--
ALTER TABLE `fabrique`
  ADD CONSTRAINT `FK_Fabrique_id_Produit` FOREIGN KEY (`id_Produit`) REFERENCES `produit` (`id_Produit`),
  ADD CONSTRAINT `FK_Fabrique_id_Traiteur` FOREIGN KEY (`id_Traiteur`) REFERENCES `traiteur` (`id_Traiteur`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_Menu_id_Produit` FOREIGN KEY (`id_Produit`) REFERENCES `produit` (`id_Produit`);

--
-- Contraintes pour la table `menu_contient`
--
ALTER TABLE `menu_contient`
  ADD CONSTRAINT `FK_contient_id_Produit_1` FOREIGN KEY (`id_Produit_1`) REFERENCES `produit` (`id_Produit`),
  ADD CONSTRAINT `FK_contient_id_Produit` FOREIGN KEY (`id_Produit`) REFERENCES `produit` (`id_Produit`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fk_User` FOREIGN KEY (`id_User`) REFERENCES `user` (`id_User`);

--
-- Contraintes pour la table `panier_contient`
--
ALTER TABLE `panier_contient`
  ADD CONSTRAINT `fk_prodpanier` FOREIGN KEY (`id_Produits`) REFERENCES `produit` (`id_Produit`),
  ADD CONSTRAINT `fk_panier` FOREIGN KEY (`id_Panier`) REFERENCES `panier` (`id_Panier`);

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `FK_Plat_id_Type_Cuisine` FOREIGN KEY (`id_Type_Cuisine`) REFERENCES `type_cuisine` (`id_Type_Cuisine`),
  ADD CONSTRAINT `FK_Plat_id_Produit` FOREIGN KEY (`id_Produit`) REFERENCES `produit` (`id_Produit`);

--
-- Contraintes pour la table `_possede`
--
ALTER TABLE `_possede`
  ADD CONSTRAINT `FK__Possede_id_Type_Contenant` FOREIGN KEY (`id_Type_Contenant`) REFERENCES `type_contenant` (`id_Type_Contenant`),
  ADD CONSTRAINT `FK__Possede_id_Produit` FOREIGN KEY (`id_Produit`) REFERENCES `produit` (`id_Produit`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
