-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 06 mars 2020 à 14:44
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `jeediner`
--

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--
DROP TABLE IF EXISTS `panier`;
CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `produit_fk` int(11) NOT NULL,
  `utilisateurs_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--
DROP TABLE IF EXISTS `produit`;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `prix` varchar(45) DEFAULT NULL,
  `categorie` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `description`, `prix`, `categorie`) VALUES
(1, 'Burger Special', 'Pain gourmet, steak haché frais, façon bouchère cuit selon votre goût, cheddar, sauce barbecue,salade iceberg, butternut cuisiné, oignons rouges, cornichons aigre-doux.', '6,90', 'Burger'),
(2, 'Veggie Burger', 'Pain craquelé au malt d’orge, steak de lentilles, sauce Caesar,copeaux de parmesan, butternut cuisiné, oignons rouges, oignons frits, mâche.', '5,80', 'Burger'),
(3, 'Super Duper Burger', 'Pain gourmet, steak haché frais façon bouchère cuit selon votre goût, Maroilles AOP, sauce Maroilles,salade iceberg, butternut cuisiné, oignons rouges, cornichons aigre-doux.', '5,50', 'Burger'),
(4, 'Kiddies Burger', 'Tortillas de maïs bleu, effiloché d’épaule de porc mariné aux épices (pulled pork), confit d’oignons rouges,mozzarella, cheddar, mâche, sauce à la coriandre, au miel et au paprika fumé', '6,50', 'Burger'),
(5, 'Hotdog Special', 'Pain brioché, saucisse pure bœuf, Cheddar, oignons crispy, Ketchup /Moutarde.', '4', 'Hotdog'),
(6, 'Bacon Cheesedog', 'Pain brioché, saucisse pure bœuf, Cheddar, Emmental, bacon grillé, oignons confits.', '4,50', 'Hotdog'),
(7, 'King Size Hotdog', 'Pain brioché, saucisse de volaille , fromage Raclette, oignons confits, dinde fumée, Sauce BBC.', '4,80', 'Hotdog'),
(8, 'Kiddies Hotdog', 'Pain brioché, blanc de poulet panné aux Corn Flakes, Coleslaw, oignons crispy.', '3,90', 'Hotdog'),
(9, 'Chocolate Vanilla', 'Glace vanille, glace chocolat, sauce chocolat, chantilly et caramel au sucre vanillé. ', '2,50', 'Shake'),
(10, 'Strawberry Smoothie', 'Sorbets framboise, sorbet fraise, sorbet cassis, crème de cassis, chantilly, amandes effilées et biscuits.', '3,90', 'Shake'),
(11, 'Mango Banana Medley', 'Banane, glace vanille, glace chocolat, glace mange, sauce chocolat, chantilly, amandes effilées et biscuits.', '2,20', 'Shake'),
(12, 'Dark Chocolate Supreme', 'Glace chocolat, copeaux de chocolat blanc, sauce Nutella, chantilly et Kinder.', '2', 'Shake'),
(13, 'Strawberry Waffle', 'Une gauffre croustillante accompagnée de fruits frais, servie avec sirop de chocolat, coulis de fraise et tartinade de Nutella.', '4,20', 'BreakFast'),
(14, 'Bacon and Eggs', 'Oeufs brouillés servi avec du bacon, jambon ou saucisse, pomme de terre rissolées et pain multigrain grillé.', '2', 'BreakFast'),
(15, 'French Toast With Eggs', 'De belles tranches de pain perdu au choix (blanc, multigrain, blé complet) servies avec du sirop d\'érable, accompagnée d\'oeufs brouillés.  ', '2,30', 'BreakFast'),
(16, 'Bacon and Pancakes', 'De beaux pancakes moelleux servis avec sirop d\'érable, fruits frais, coulis de fruits et tartinade de Nutella.', '3,80', 'BreakFast');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--
DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `codepostal` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `portable` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `adresse`, `codepostal`, `ville`, `portable`, `email`, `password`, `admin`) VALUES
(1, 'admin', 'admin', '3 bis rue Condamine', '38000', 'Grenoble', '0606060606', 'epsi@free.com', 'admin', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`,`utilisateurs_fk`,`produit_fk`),
  ADD KEY `fk_panier_produit_idx1` (`produit_fk`),
  ADD KEY `fk_panier_utilisateurs1_idx1` (`utilisateurs_fk`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fk_panier_produit` FOREIGN KEY (`produit_fk`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_panier_utilisateurs1` FOREIGN KEY (`utilisateurs_fk`) REFERENCES `utilisateurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
