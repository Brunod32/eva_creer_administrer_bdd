/* Créer la base de données theatercomplex en spécifiant le jeu d'encodage: */
CREATE DATABASE IF NOT EXISTS theaterComplex CHARACTER SET utf8 COLLATE utf8_general_ci;

/* Création des tables */
CREATE TABLE theater (
    id_theater int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    address varchar(255)
)ENGINE=InnoDB;

CREATE TABLE admin (
    id_admin int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstName varchar(30) NOT NULL,
    lastName varchar(30) NOT NULL,
    password varchar(100) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE price (
    id_price int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    rate float NOT NULL,
    content varchar(100)
)ENGINE=InnoDB;

CREATE TABLE screening (
    id_screening int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    movieTitle varchar(30) NOT NULL,
    date datetime NOT NULL,
    startHour time NOT NULL,
    endHour time NOT NULL,
    placeNumber int NOT NULL,
    id_price int,
        CONSTRAINT fk_screening_id_price
        FOREIGN KEY (id_price)
        REFERENCES price(id_price)
        ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE employee (
    id_employee int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstName varchar(30)NOT NULL,
    lastName varchar(30)NOT NULL,
    password varchar(100) NOT NULL,
    id_screening int,
        CONSTRAINT fk_employee_id_screening
        FOREIGN KEY (id_screening)
        REFERENCES screening(id_screening)
        ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE customer (
    id_customer int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstName varchar(30) NOT NULL,
    lastName varchar(30) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(100) NOT NULL,
    id_screening int,
    CONSTRAINT fk_customer_id_screening
        FOREIGN KEY (id_screening)
        REFERENCES screening(id_screening)
        ON DELETE CASCADE,
    id_price int,
    CONSTRAINT fk_customer_id_price
        FOREIGN KEY (id_price)
        REFERENCES price(id_price)
        ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE broadcasting (
    id_broadcasting int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_theater int,
    CONSTRAINT fk_broadcasting_id_theater
        FOREIGN KEY (id_theater)
        REFERENCES theater(id_theater)
        ON DELETE CASCADE,
    id_screening int,
    CONSTRAINT fk_broadcasting_id_screening
        FOREIGN KEY (id_screening)
        REFERENCES screening(id_screening)
        ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE screeningManagement (
    id_screeningManagement int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_theater int,
    CONSTRAINT fk_screeningManagement_id_theater
        FOREIGN KEY (id_theater)
        REFERENCES theater(id_theater)
        ON DELETE CASCADE,
    id_admin int,
    CONSTRAINT fk_screeningManagement_id_admin
        FOREIGN KEY (id_admin)
        REFERENCES admin(id_admin)
        ON DELETE CASCADE
)ENGINE=InnoDB;

/* Alimentation des tables */
/* Table theater */
INSERT INTO theater(name, address) VALUES ("Cinemanimal", "1895 rue des frères Lumière 06400 Cannes");
INSERT INTO theater(name, address) VALUES ("Projector", "7 rue de la bobine 35230 Cinévillage");
INSERT INTO theater(name, address) VALUES ("La boite à image", "1 avenue des vedettes 12345 Starcity");
INSERT INTO theater(name, address) VALUES ("Spectakl", "1911 boulevard de étoiles 22540 Aulioude");

/* Table admin */
INSERT INTO admin(firstName, lastName, password) VALUES ("Anna", "Grame", "$2y$10$Stafk6cwqIjSmJ6xGYJNzOGIam/nIJC.N93p46GF76mjtff/iFcxe");
INSERT INTO admin(firstName, lastName, password) VALUES ("Bob", "Sleigh", "$2y$10$SjM4khVzxXNmaoO3uydSEOc1JLMyjA2i3WnVLqegyN.o.r2Dfa3ie");
INSERT INTO admin(firstName, lastName, password) VALUES ("Ali", "Gatore", "$2y$10$XJBPqaFVpTh54khBgINgPeF3PNaNIFKLFLBcm0MOBx7bjOy5yA5lq");
INSERT INTO admin(firstName, lastName, password) VALUES ("Jean", "Registre", "$2y$10$xSinM4EYoJF7kQa9EmprZevWYjauMEZwZx9FyBlFNi700cxvuVH/6");
INSERT INTO admin(firstName, lastName, password) VALUES ("Justin", "Ptipeu", "$2y$10$lQPo1mY2f2cJlJAOa2Jeh.F0ItfUc3e90MKFu2fZc3tEHTBNSDDc.");

/* Table price */
INSERT INTO price(name, rate, content) VALUES ("Plein tarif", "9.20", "Tarif plein");
INSERT INTO price(name, rate, content) VALUES ("Etudiant", "7.60", "Tarif étudiant appliquable sur présentation d'un justificatif");
INSERT INTO price(name, rate, content) VALUES ("Moins-14", "5.90", "Tarif pour les enfants de moins de 14 ans");

/* Table screening */
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Le chant de la mer', '2021/01/11', '20:00', '21:25', 21, 1);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Tintin et le secret de la licorne', '2021/02/11', '10:00', '11:42', 83, 2);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Les robinson des mers du sud', '2021/04/11', '20:00', '22:01', 85, 3);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Halloween', '2021/08/08', '21:00', '22:27', 41, 1);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Snowden', '2021/10/12', '20:00', '22:14', 67, 1);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Frozen', '2021/05/09', '18:00', '19:38', 87, 3);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('The social network', '2021/09/25', '20:30', '22:30', 48, 3);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Angry birds', '2021/06/01', '15:00', '16:33', 57, 2);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Harry Potter et le prince de sang-mélé', '2021/09/09', '20:00', '22:33', 98, 1);
insert into screening (movieTitle, date, startHour, Endhour, placeNumber, id_price) values ('Arthur et les Minimoys 3', '2021/03/12', '15:00', '16:37', 59, 1);

/* Table employee */
insert into employee (firstName, lastName, password, id_screening) values ('Max', 'Himome', '$2y$10$HykF/LNQAo5XfBYUjk5dk.fKWo4ysaBZJicrEvpyKPAQPM2hLmDZu', 1);
insert into employee (firstName, lastName, password, id_screening) values ('Otto', 'Graphe', '$2y$10$/m8tlDH0QoOmnaF.ZDSq5eCW0fapOWf2gALebYegGK.IosQeOxPNW', 2);
insert into employee (firstName, lastName, password, id_screening) values ('Mira', 'Belle', '$2y$10$m.O5akfdL5dtnLJNAXeG8./STte2ZdIMIDUoUpipi/zQor0Pue0g.', 3);
insert into employee (firstName, lastName, password, id_screening) values ('Sam', 'Pique', '$2y$10$dqdP9UlyyA8PfMnyk.JhNONN/GSJAP8l7s0HPSFapA6R7mwZa4Lpe', 4);
insert into employee (firstName, lastName, password, id_screening) values ('Terry', 'Kiki', '$2y$10$GYWYWmaNIPoW1A56ON6q6OLQlao640QPUFVJE.sUEhPXtbNa/vLLK', 5);

/* Table customer */
insert into customer (firstName, lastName, email, password, id_screening) values ('Edith', 'Oriale', 'editoriale@stumbleupon.com', '$2y$10$dOepOgNwF1xoy5HL6NXv9Op21b3iqbUwtuOoVZ60H62sXmvSlOrye', 1);
insert into customer (firstName, lastName, email, password, id_screening) values ('Elie', 'Copter', 'elicop3@angelfire.com', '$2y$10$okh2srDU03YS8PrjrrHyku.YYyXrbi357054vPXdCM8QNATQbFohW', 2);
insert into customer (firstName, lastName, email, password, id_screening) values ('Amar', 'Di', 'amardi@nih.gov', '$2y$10$4ueUsSrNGOKhXnPmX7.j6efk4xQQomsJsxxSqkL1MDzDuwx1MCRIq', 3);
insert into customer (firstName, lastName, email, password, id_screening) values ('Annie', 'Male', 'amale@moonfruit.com', '$2y$10$bI8V46NKs.tkMX/Cq6c3wOFmXH0UrJeFGGRnKjMEpT3FeU0Ipu.Wm', 4);
insert into customer (firstName, lastName, email, password, id_screening) values ('Agathe', 'Zeublouse', 'azeblouse@dot.gov', '$2y$10$3bdYQdx/8Q5LsRjzL9W7B.YZJma5Wlmoh06HFBvPZEIt5TbxCPKmS', 5);

/* Table broadcasting */
insert into Broadcasting (id_theater, id_screening) values (1, 3);
insert into Broadcasting (id_theater, id_screening) values (2, 5);
insert into Broadcasting (id_theater, id_screening) values (4, 4);
insert into Broadcasting (id_theater, id_screening) values (2, 2);
insert into Broadcasting (id_theater, id_screening) values (1, 3);
insert into Broadcasting (id_theater, id_screening) values (3, 9);
insert into Broadcasting (id_theater, id_screening) values (3, 8);

/* TABLE screeningManagement */
insert into screeningManagement (id_theater, id_admin) values (1, 2);
insert into screeningManagement (id_theater, id_admin) values (2, 5);
insert into screeningManagement (id_theater, id_admin) values (4, 4);
insert into screeningManagement (id_theater, id_admin) values (2, 1);
insert into screeningManagement (id_theater, id_admin) values (3, 3);
insert into screeningManagement (id_theater, id_admin) values (4, 2);
insert into screeningManagement (id_theater, id_admin) values (2, 1);
insert into screeningManagement (id_theater, id_admin) values (3, 4);
insert into screeningManagement (id_theater, id_admin) values (1, 5);
insert into screeningManagement (id_theater, id_admin) values (1, 4);

/* Privilèges accordés aux utilisateurs */
-- Création des utilisateurs admin
CREATE USER 'annagrame'@'localhost' IDENTIFIED BY '$2y$10$Stafk6cwqIjSmJ6xGYJNzOGIam/nIJC.N93p46GF76mjtff/iFcxe';
CREATE USER 'bobsleigh'@'localhost' IDENTIFIED BY '$2y$10$SjM4khVzxXNmaoO3uydSEOc1JLMyjA2i3WnVLqegyN.o.r2Dfa3ie';
CREATE USER 'aligatore'@'localhost' IDENTIFIED BY '$2y$10$XJBPqaFVpTh54khBgINgPeF3PNaNIFKLFLBcm0MOBx7bjOy5yA5lq';
CREATE USER 'jeanregistre'@'localhost' IDENTIFIED BY '$2y$10$xSinM4EYoJF7kQa9EmprZevWYjauMEZwZx9FyBlFNi700cxvuVH/6';
CREATE USER 'justinptipeu'@'localhost' IDENTIFIED BY '$2y$10$lQPo1mY2f2cJlJAOa2Jeh.F0ItfUc3e90MKFu2fZc3tEHTBNSDDc.';
-- Attribution des privilèges
GRANT ALL PRIVILEGES ON *.* TO 'annagrame'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'bobsleigh'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'aligatore'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'jeanregistre'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'justinptipeu'@'localhost' WITH GRANT OPTION;
-- Rechargement de la table des privilèges
FLUSH PRIVILEGES;

-- Création des utilisateurs employee
CREATE USER 'maxhimome'@'localhost' IDENTIFIED BY '$2y$10$HykF/LNQAo5XfBYUjk5dk.fKWo4ysaBZJicrEvpyKPAQPM2hLmDZu';
CREATE USER 'ottographe'@'localhost' IDENTIFIED BY '$2y$10$/m8tlDH0QoOmnaF.ZDSq5eCW0fapOWf2gALebYegGK.IosQeOxPNW';
CREATE USER 'mirabelle'@'localhost' IDENTIFIED BY '$2y$10$m.O5akfdL5dtnLJNAXeG8./STte2ZdIMIDUoUpipi/zQor0Pue0g.';
CREATE USER 'sampique'@'localhost' IDENTIFIED BY '$2y$10$dqdP9UlyyA8PfMnyk.JhNONN/GSJAP8l7s0HPSFapA6R7mwZa4Lpe';
CREATE USER 'terrykiki'@'localhost' IDENTIFIED BY '$2y$10$GYWYWmaNIPoW1A56ON6q6OLQlao640QPUFVJE.sUEhPXtbNa/vLLK';
-- Attribution des privilèges
GRANT SELECT ON *.* TO 'maxhimome'@'localhost';
GRANT SELECT ON *.* TO 'ottographe'@'localhost';
GRANT SELECT ON *.* TO 'mirabelle'@'localhost';
GRANT SELECT ON *.* TO 'sampique'@'localhost';
GRANT SELECT ON *.* TO 'terrykiki'@'localhost';
-- Rechargement de la table des privilèges
FLUSH PRIVILEGES;

-- Revoquer les droits des utilisateurs
DELETE FROM mysql.user WHERE user='<USERNAME>';

/* Utilitaire de sauvegarde et restauration de la base de données */
/* sauvegarde */
mysqldump -u root -p theatercomplex > c:/xampp/apps/savebddtheatercomplex.sql

/* restauration */
/* Avant de saisir cette commande, se connecter à mysql et faire un CREATE DATABASE theatercomplex */
mysql -u root -p theatercomplex < c:/xampp/apps/savebddtheatercomplex.sql