--1-- Lister toutes les BDD de PHPMyAdmin
SHOW DATABASES;

--2-- Créer une base de données SQL nommée HARIBO
CREATE DATABASE haribo;

--3--
/**
* Créer une table stagiaire qui comporte 3 champs :
* - id_stagiaire => nombre qui s'auto-incrémente, requis et clé primaire
* - prenom => 100 caractères, requis
* - couleur des yeux => 30 caractères, requis
* - genre => homme ou femme, requis
*/

CREATE TABLE stagiaire (
id_stagiaire INT AUTO_INCREMENT PRIMARY KEY,
prenom VARCHAR (100) NOT NULL,
genre ENUM ('h', 'f') NOT NULL
);

ALTER TABLE stagiaire RENAME COLUMN couleur_yeux TO yeux;

SHOW COLUMNS FROM stagiaire;
 
--4--
/**
* Insérer dans cette table les informations de votre groupe (données ci-dessous) :
* Vera marron f
* Abdelkarim marron h
* Julien marron h
* Radouane marron h
* Sarah vert f
* Marwan marron h
* Mathis marron h
* Khaoula marron f
* Fatima marron f
* Allaan bleu h
* Ivan marron h
* Ayoub marron h
* Abdou marron h
*/
INSERT INTO stagiaire (prenom, yeux, genre)
VALUE
('Vera', 'marron', 'f'),
('Abdelkarim', 'marron', 'h'),
('Julien', 'marron', 'h'),
('Radouane', 'marron', 'h'),
('Sarah', 'vert', 'f'),
('Marwan', 'marron', 'h'),
('Mathis', 'marron', 'h'),
('Khaoula', 'marron', 'f'),
('Fatima', 'marron', 'f'),
('Allaan', 'bleu', 'h'),
('Ivan', 'marron', 'h'),
('Ayoub', 'marron', 'h'),
('Abdou', 'marron', 'h');

SELECT * FROM stagiaire;

--5--
/**
* Créer une table bonbon
* qui comporte 3 champs :
* - id_bonbon => nombre qui s'auto-incrémente, requis et clé primaire
* - nom => 100 caractères, requis
* - saveur => 100 caractères, requis
*/
CREATE TABLE bonbon (
id_bonbon INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100),
saveur VARCHAR(100)
);

ALTER TABLE bonbon
MODIFY nom VARCHAR(100) NOT NULL;

ALTER TABLE bonbon
MODIFY saveur VARCHAR(100) NOT NULL;

--6--
/**
* Insérer dans cette table des bonbons haribo (données ci-dessous) :
* 'dragibus', 'cola'
* 'tagada', 'fraise'
* 'bams', 'banane'
* 'rotella', 'reglisse'
* 'floppys', 'sucre'
* 'rainbollows', 'marshmallow'
* 'bigharri', 'cerise'
* 'oursor', 'fruits'
* 'croco', 'fruits'
* 'oeufoplat', 'guimauve')
* 'flanbotti', 'caramel'
*/

INSERT INTO bonbon (nom, saveur)
VALUES 
('dragibus', 'cola'),
('tagada', 'fraise'),
('bams', 'banane'),
('rotella', 'reglisse'),
('floppys', 'sucre'),
('rainbollows', 'marshmallow'),
('bigharri', 'cerise'), 
('oursor', 'fruits'),
('croco', 'fruits'),
('oeufoplat', 'guimauve'),
('flanbotti', 'caramel');

SELECT * FROM bonbon;

--7--
/**
* créer une table manger
* qui comporte 5 champs :
* - id_manger => nombre qui s'auto-incrémente, requis et clé primaire
* - id_stagiaire => champs de la table stagiaire (la structure de la colonne doit être identique à celle crée dans la table où il est clef primaire)
* - id_bonbon => champs de la table bonbon (idem)
* - date_manger => type date, requis
* - quantite => nombre, requis
*/

 CREATE TABLE manger (
id_manger INT AUTO_INCREMENT PRIMARY KEY,
date_manger DATE NOT NULL,
quantite INT NOT NULL,
id_stagiaire INT,
FOREIGN KEY(id_stagiaire) REFERENCES stagiaire(id_stagiaire), 
id_bonbon INT,
FOREIGN KEY(id_bonbon) REFERENCES bonbon(id_bonbon)
);

--8--
/**
* insérer dans la table manger des informations sur qui a consommé quel bonbon, quand et dans quelles quantités (données ci-dessous) :
(4,7,'2024-08-20', 5),
(1,1,'2024-08-05', 5),
(2,2,'2024-08-03', 5),
(3,3,'2024-08-04', 5),
(5,4,'2024-08-15', 5),
(6,5,'2024-08-18', 5),
(7,6,'2024-08-22', 5),
(8,8,'2024-08-19', 5),
(9,9,'2024-08-21', 5),
(10,10,'2024-08-01', 5),
(11,11,'2024-08-06', 5);
*/

INSERT INTO manger (id_stagiaire, id_bonbon, date_manger, quantite)
VALUES 
(4,7,'2024-08-20', 5), 
(1,1,'2024-08-05', 5), 
(2,2,'2024-08-03',5), 
(3,3,'2024-08-04',5), 
(5,4,'2024-08-15',5), 
(6,5,'2024-08-18',5), 
(7,6,'2024-08-22',5), 
(8,8,'2024-08-19',5), 
(9,9,'2024-08-21',5), 
(10,10,'2024-08-01',5), 
(11,11,'2024-08-06',5);

SELECT * FROM manger;
--9-- Lister les tables de la BDD *haribo*
SHOW TABLES;

--10-- voir les paramètres de la table *bonbon*
SHOW COLUMNS FROM bonbon;
--11-- Sélectionner tous les champs de tous les enregistrements de la table *stagiaire*
SELECT * FROM `stagiaire`;
--12-- Rajouter un nouveau stagiaire *Patriiiick* en forçant la numérotation de l'id
INSERT INTO stagiaire(prenom,id_stagiaire)
VALUES ('Patriiiick',20);
--13-- Rajouter un nouveau stagiaire *Mila* SANS forcer la numérotation de l'id
INSERT INTO stagiaire(prenom) VALUES ('Mila');
--14-- Changer le prénom du stagiaire qui a l'id 100 de *Patriiiick* à *Patrick*
UPDATE stagiaire SET prenom='Patrick' WHERE id_stagiaire=20;
--15-- Rajouter dans la table manger que Patrick a mangé 5 Tagada purpule le 15 septembre
INSERT INTO manger(quantite, id_stagiaire, date_manger)
    VALUES (5, 20,'2024-09-15');
SELECT * FROM manger;
--16-- Sélectionner tous les noms des bonbons
SELECT nom FROM bonbon;
--17-- Sélectionner tous les noms des bonbons en enlevant les doublons
SELECT DISTINCT nom FROM bonbon;
--18-- Récupérer les couleurs des yeux des stagiaires (Sélectionner plusieurs champs dans une table)
SELECT prenom, yeux from stagiaire;
--19-- Dédoublonner un résultat sur plusieurs champs
SELECT prenom, yeux FROM stagiaire GROUP BY yeux;
--20-- Sélectionner le stagiaire qui a l'id 5
SELECT * FROM stagiaire WHERE id_stagiaire='5';
--21-- Sélectionner tous les stagiaires qui ont les yeux marrons
SELECT * FROM stagiaire WHERE yeux='marron';
--22-- Sélectionner tous les stagiaires dont l'id est plus grand que 9
SELECT * FROM stagiaire WHERE id_stagiaire > 9;
--23-- Sélectionner tous les stagiaires SAUF celui dont l'id est 13 (soyons supersticieux !) :!\ il y a 2 façons de faire
SELECT * FROM stagiaire WHERE id_stagiaire != 13;
SELECT * FROM stagiaire WHERE id_stagiaire <> 13;

--24-- Sélectionner tous les stagiaires qui ont un id inférieur ou égal à 10
SELECT * FROM stagiaire WHERE id_stagiaire <= 10;
--25-- Sélectionner tous les stagiaires dont l'id est compris entre 7 et 11
SELECT * FROM stagiaire WHERE id_stagiaire BETWEEN 7 AND 11;
--26-- Sélectionner les stagiaires dont le prénom commence par un *S*
SELECT * FROM stagiaire WHERE prenom LIKE 'S%';
--27-- Trier les stagiaires femmes par id décroissant
SELECT * FROM `stagiaire` WHERE genre = 'f' ORDER BY id_stagiaire DESC;
--28-- Trier les stagiaires hommes par prénom dans l'ordre alphabétique
SELECT * FROM stagiaire WHERE genre = 'h' ORDER BY prenom ASC;
--29-- Trier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabétique
SELECT * FROM stagiaire WHERE genre = 'f' ORDER BY genre DESC, yeux ASC;
--30-- Limiter l'affichage d'une requête de sélection de tous les stagiaires aux 3 premires résultats
SELECT * FROM `stagiaire` LIMIT 0,3;

--31-- Limiter l'affichage d'une requête de sélection de tous les stagiaires à partir du 3ème résultat et des 5 suivants
SELECT * FROM `stagiaire` LIMIT 5 OFFSET 3;
SELECT * FROM `stagiaire` LIMIT 3,5;

--32-- Afficher les 4 premiers stagiaires qui ont les yeux marron
SELECT * FROM `stagiaire` WHERE `yeux` ='marron' LIMIT 4 ;

--33-- Pareil mais en triant les prénoms dans l'ordre alphabétique
SELECT `prenom` FROM `stagiaire` WHERE `yeux` ='marron' ORDER BY `prenom` ASC LIMIT 4;

--34-- Compter le nombre de stagiaires
SELECT COUNT(*) FROM `stagiaire` ;
SELECT COUNT(`prenom`) AS `nombre_de_stagiaires` FROM `stagiaire` ;

--35-- Compter le nombre de stagiaires hommes mais en changeant le nom de la colonne de résultat par *nb_stagiaires_H*
SELECT COUNT(*) AS `nombre_de_stagiaires_H` FROM `stagiaire` WHERE genre = 'h';

--36-- Compter le nombre de couleurs d'yeux différentes
SELECT COUNT(DISTINCT `yeux`) FROM `stagiaire`;

--37-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus petit
SELECT `prenom`, `yeux` FROM `stagiaire` ORDER BY `id_stagiaire` ASC LIMIT 1;
SELECT MIN(`id_stagiaire`), `prenom`, `yeux` FROM `stagiaire`;

--38-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus grand /!\ 
--c'est une requête imbriquée qu'il faut faire (requête sur le résultat d'une autre requête)
SELECT `prenom`, `yeux` FROM `stagiaire` WHERE `id_stagiaire` = (SELECT MAX(`id_stagiaire`) FROM `stagiaire`);

--39-- Afficher les stagiaires qui ont les yeux bleu et vert
SELECT * FROM `stagiaire` WHERE `yeux` IN ('bleu', 'vert');
SELECT * FROM `stagiaire` WHERE `yeux` = 'vert' OR yeux = 'bleu';
SELECT * FROM `stagiaire` WHERE `yeux` LIKE 'vert' <> yeux LIKE 'bleu';
--40-- A l'inverse maintenant, afficher les stagiaires qui n'ont pas les yeux bleu ni vert
SELECT * FROM `stagiaire` WHERE `yeux` != 'vert' OR yeux != 'bleu';
SELECT * FROM `stagiaire` WHERE `yeux` NOT IN ('bleu', 'vert');

--41-- récupérer tous les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations
SELECT * 
FROM `stagiaire`
RIGHT JOIN `manger` ON `stagiaire`.`id_stagiaire` = `manger`.`id_stagiaire`;

SELECT *
FROM `manger`
LEFT JOIN `stagiaire` ON `manger`.`id_stagiaire` = `stagiaire`.`id_stagiaire`

--42-- récupérer que les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations
SELECT * FROM `stagiaire` AS `s`, `manger` AS `m`
WHERE `s`.`id_stagiaire` = `m`.`id_stagiaire` AND `m`.`quantite` != 0 ;

--43-- prénom du stagiaire, le nom du bonbon, la date de consommation pour tous les stagiaires qui ont mangé au moins une fois
SELECT `stagiaire`.`prenom`, `bonbon`.`nom`, `manger`.`date_manger` 
FROM `stagiaire` 
INNER JOIN `manger` ON `stagiaire`.`id_stagiaire` = `manger`.`id_stagiaire`
INNER JOIN `bonbon` ON `bonbon`.`id_bonbon` = `manger`.`id_bonbon`;

--44-- Afficher les quantités consommées par les stagiaires (uniquement ceux qui ont mangé !)
SELECT `stagiaire`.`prenom`, `manger`.`quantite` 
FROM `stagiaire` 
INNER JOIN `manger` ON `stagiaire`.`id_stagiaire` = `manger`.`id_stagiaire`;
--45-- Calculer combien de bonbons ont été mangés au total par chaque stagiaire et afficher le nombre de fois où ils ont mangé
SELECT `stagiaire`.`prenom`, SUM(`manger`.`quantite`),  COUNT(`manger`.`date_manger`)
FROM`stagiaire` 
LEFT JOIN `manger` ON `stagiaire`.`id_stagiaire` = `manger`.`id_stagiaire` 
GROUP BY `stagiaire`.`id_stagiaire`;
--46-- Afficher combien de bonbons ont été consommés au total
SELECT SUM(`quantite`) AS total_bonbons FROM `manger`;

--47-- Afficher le total de *Tagada* consommées
SELECT SUM(`manger`.`quantite`) AS total_tagada 
FROM `manger `
INNER JOIN `bonbon` ON `manger`.`id_bonbon` = `bonbon`.`id_bonbon` 
WHERE `bonbon`.`nom` = 'tagada';
--48-- Afficher les prénoms des stagiaires qui n'ont rien mangé
SELECT `prenom` FROM `stagiaire` 
WHERE `id_stagiaire` NOT IN (SELECT `id_stagiaire` FROM `manger`);
--49-- Afficher les saveurs des bonbons (sans doublons)
SELECT DISTINCT `saveur` FROM `bonbon`;
--50-- Afficher le prénom du stagiaire qui a mangé le plus de bonbons
SELECT `stagiaire`.`prenom` 
FROM `stagiaire` 
INNER JOIN `manger` ON `stagiaire`.`id_stagiaire` = `manger`.`id_stagiaire` 
GROUP BY `stagiaire`.`prenom` 
ORDER BY SUM(`manger`.`quantite`) DESC 
LIMIT 1;

SELECT `stagiaire`.`prenom`, MAX(`manger`.`quantite`)
FROM `stagiaire` 
INNER JOIN `manger` ON `stagiaire`.`id_stagiaire` = `manger`.`id_stagiaire`;