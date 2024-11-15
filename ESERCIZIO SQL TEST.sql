CREATE DATABASE TOYS ;

USE TOYS;

CREATE TABLE MACROAREA (
ID_MACROAREA INT PRIMARY KEY,
NOME_MACROAREA VARCHAR(25) NOT NULL,
CONSTRAINT NOME_MACROAREA CHECK ( NOME_MACROAREA IN ('NORDEUROPE', 'SOUTH EUROPE', 'CENTRAL EUROPE', 'EST EUROPE', 'OVEST EUROPE', 
            'NORD AMERICA', 'CENTRAL AMERICA', 'SUD AMERICA', 'NORTH ASIA', 'CENTRAL ASIA', 
            'SUD ASIA', 'AFRICA', 'OCEANIA'))
);

CREATE TABLE SOTTOCATEGORIA (
ID_SOTTOCATEGORIA INT PRIMARY KEY,
ETA_CONSIGLIATA TINYINT NOT NULL);

CREATE TABLE NAZIONE (
ID_NAZIONE INT PRIMARY KEY,
NOME_NAZIONE VARCHAR(128) NOT NULL,
ID_MACROAREA INT NOT NULL,
FOREIGN KEY (ID_MACROAREA) REFERENCES MACROAREA(ID_MACROAREA)
);

CREATE TABLE SALES (
ID_ORD INT PRIMARY KEY,
CODICEBARRE BIGINT,
DATA_ORD DATE NOT NULL,
QUANTITA_ORD INT NOT NULL,
ID_NAZIONE INT NOT NULL,
FOREIGN KEY (ID_NAZIONE) REFERENCES NAZIONE(ID_NAZIONE)
);

CREATE TABLE CATEGORIA (
ID_CATEGORIA INT PRIMARY KEY,
TIPOLOGIA VARCHAR(25) NOT NULL,
TAGLIA CHAR(1) NOT NULL,
UNIVERSO_TOYS VARCHAR(25) NOT NULL,
ID_SOTTOCATEGORIA INT NOT NULL,
FOREIGN KEY (ID_SOTTOCATEGORIA) REFERENCES SOTTOCATEGORIA(ID_SOTTOCATEGORIA)
);

CREATE TABLE PRODOTTO (
CODICEBARRE BIGINT PRIMARY KEY,
CONSTRAINT CODICEBARRE CHECK (CODICEBARRE  BETWEEN 100000000000 AND  999999999999 ),
NOME VARCHAR(50) NOT NULL,
COSTO DECIMAL(6,2) NOT NULL,
ID_MODELLO INT UNIQUE NOT NULL,
ID_CATEGORIA INT NOT NULL,
FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA));




INSERT INTO MACROAREA (ID_MACROAREA, NOME_MACROAREA) VALUES
(1, 'NORDEUROPE'), (2, 'SOUTH EUROPE'), (3, 'CENTRAL EUROPE'),
(4, 'EST EUROPE'), (5, 'OVEST EUROPE'), (6, 'NORD AMERICA'),
(7, 'CENTRAL AMERICA'), (8, 'SUD AMERICA'), (9, 'NORTH ASIA'),
(10, 'CENTRAL ASIA'), (11, 'SUD ASIA'), (12, 'AFRICA'), (13, 'OCEANIA');

INSERT INTO SOTTOCATEGORIA (ID_SOTTOCATEGORIA, ETA_CONSIGLIATA) VALUES
(1, 3),
(2, 6),
(3, 8),
(4, 12),
(5, 15),
(6, 18);

INSERT INTO NAZIONE (ID_NAZIONE, NOME_NAZIONE, ID_MACROAREA) VALUES
(1, 'Italia', 2), (2, 'Francia', 2), (3, 'Germania', 3), (4, 'Spagna', 2), (5, 'Portogallo', 2),
(6, 'Svezia', 1), (7, 'Norvegia', 1), (8, 'Danimarca', 1), (9, 'Stati Uniti', 6), (10, 'Canada', 6),
(11, 'Messico', 7), (12, 'Brasile', 8), (13, 'Argentina', 8), (14, 'Russia', 9), (15, 'Cina', 9),
(16, 'Giappone', 9), (17, 'Corea del Sud', 9), (18, 'India', 11), (19, 'Australia', 13), (20, 'Nuova Zelanda', 13),
(21, 'Regno Unito', 2), (22, 'Irlanda', 1), (23, 'Paesi Bassi', 3), (24, 'Belgio', 3), (25, 'Svizzera', 3),
(26, 'Austria', 3), (27, 'Polonia', 4), (28, 'Repubblica Ceca', 4), (29, 'Ungheria', 4), (30, 'Romania', 4),
(31, 'Turchia', 9), (32, 'Egitto', 12), (33, 'Sudafrica', 12), (34, 'Marocco', 12), (35, 'Nigeria', 12),
(36, 'Kenya', 12), (37, 'Arabia Saudita', 12), (38, 'Emirati Arabi Uniti', 12), (39, 'Israele', 9), (40, 'Vietnam', 11),
(41, 'Thailandia', 11), (42, 'Indonesia', 11), (43, 'Filippine', 11), (44, 'Pakistan', 11), (45, 'Bangladesh', 11),
(46, 'Sri Lanka', 11), (47, 'Nepal', 11), (48, 'Iran', 10), (49, 'Kazakhstan', 10), (50, 'Uzbekistan', 10),
(51, 'Afghanistan', 10), (52, 'Iraq', 12), (53, 'Siria', 12), (54, 'Libano', 12), (55, 'Giordania', 12),
(56, 'Algeria', 12), (57, 'Tunisia', 12), (58, 'Cile', 8), (59, 'Perù', 8), (60, 'Colombia', 8),
(61, 'Venezuela', 8), (62, 'Uruguay', 8), (63, 'Paraguay', 8), (64, 'Bolivia', 8), (65, 'Ecuador', 8),
(66, 'Cuba', 7), (67, 'Honduras', 7), (68, 'Guatemala', 7), (69, 'Costa Rica', 7), (70, 'Panama', 7),
(71, 'El Salvador', 7), (72, 'Nicaragua', 7), (73, 'Giamaica', 7), (74, 'Repubblica Dominicana', 7),
(75, 'Haiti', 7), (76, 'Bahamas', 7), (77, 'Islanda', 1), (78, 'Finlandia', 1), (79, 'Estonia', 1),
(80, 'Lettonia', 1), (81, 'Lituania', 1), (82, 'Bulgaria', 4), (83, 'Grecia', 2), (84, 'Serbia', 4),
(85, 'Croazia', 4), (86, 'Slovenia', 4), (87, 'Slovacchia', 4), (88, 'Bosnia', 4), (89, 'Macedonia del Nord', 4),
(90, 'Albania', 4), (91, 'Montenegro', 4), (92, 'Moldavia', 4), (93, 'Cipro', 2), (94, 'Malta', 2),
(95, 'Singapore', 11), (96, 'Malesia', 11), (97, 'Cambogia', 11), (98, 'Myanmar', 11), (99, 'Laos', 11),
(100, 'Brunei', 11);

INSERT INTO SALES (ID_ORD, CODICEBARRE, DATA_ORD, QUANTITA_ORD, ID_NAZIONE) VALUES
(1, 100000000001, '2023-01-15', 10, 1), (2, 100000000002, '2023-02-20', 5, 2),
(3, 100000000003, '2023-03-12', 8, 3), (4, 100000000004, '2023-04-18', 15, 4),
(5, 100000000005, '2023-05-25', 7, 5), (6, 100000000006, '2023-06-10', 9, 6),
(7, 100000000007, '2023-07-14', 11, 7), (8, 100000000008, '2023-08-22', 4, 8),
(9, 100000000009, '2023-09-10', 3, 9), (10, 100000000010, '2023-10-15', 6, 10),
(11, 100000000011, '2023-11-11', 10, 11), (12, 100000000012, '2023-12-24', 12, 12),
(13, 100000000013, '2023-12-30', 8, 13), (14, 100000000014, '2024-01-10', 5, 14),
(15, 100000000015, '2024-02-14', 7, 15), (16, 100000000016, '2024-03-02', 9, 16),
(17, 100000000017, '2024-04-21', 6, 17), (18, 100000000018, '2024-05-13', 5, 18),
(19, 100000000019, '2024-06-18', 11, 19), (20, 100000000020, '2024-07-10', 8, 20),
(21, 100000000021, '2024-08-25', 9, 1), (22, 100000000022, '2024-09-12', 6, 2),
(23, 100000000023, '2024-10-05', 5, 3), (24, 100000000024, '2024-11-18', 10, 4),
(25, 100000000025, '2024-12-02', 7, 5), (26, 100000000026, '2025-01-10', 6, 6),
(27, 100000000027, '2025-02-15', 8, 7), (28, 100000000028, '2025-03-05', 12, 8),
(29, 100000000029, '2025-04-11', 9, 9), (30, 100000000030, '2025-05-19', 7, 10),
(31, 100000000001, '2024-01-20', 10, 1), (32, 100000000001, '2024-02-20', 10, 1),
(33, 100000000001, '2024-03-22', 10, 1), (34, 100000000002, '2024-01-22', 5, 2),
(35, 100000000002, '2024-02-23', 5, 2), (36, 100000000002, '2024-03-24', 5, 2),
(37, 100000000003, '2024-01-25', 8, 3), (38, 100000000003, '2024-02-26', 8, 3),
(39, 100000000003, '2024-03-27', 8, 3), (40, 100000000004, '2024-01-28', 15, 4),
(41, 100000000004, '2024-02-29', 15, 4), (42, 100000000004, '2024-03-30', 15, 4),
(43, 100000000005, '2024-01-30', 7, 5), (44, 100000000005, '2024-03-01', 7, 5),
(45, 100000000005, '2024-03-31', 7, 5), (46, 100000000006, '2024-02-01', 9, 6),
(47, 100000000006, '2024-03-05', 9, 6), (48, 100000000006, '2024-04-10', 9, 6),
(49, 100000000007, '2024-02-10', 11, 7), (50, 100000000007, '2024-03-12', 11, 7),
(51, 100000000007, '2024-04-15', 11, 7), (52, 100000000008, '2024-02-20', 4, 8),
(53, 100000000008, '2024-03-18', 4, 8), (54, 100000000008, '2024-04-22', 4, 8),
(55, 100000000009, '2024-02-25', 3, 9), (56, 100000000009, '2024-03-30', 3, 9),
(57, 100000000009, '2024-04-05', 3, 9), (58, 100000000010, '2024-03-02', 6, 10),
(59, 100000000010, '2024-04-15', 6, 10), (60, 100000000010, '2024-05-20', 6, 10),
(61, 100000000011, '2024-03-10', 10, 11), (62, 100000000011, '2024-04-12', 10, 11),
(63, 100000000011, '2024-05-15', 10, 11), (64, 100000000012, '2024-03-15', 12, 12),
(65, 100000000012, '2024-04-20', 12, 12), (66, 100000000012, '2024-05-25', 12, 12),
(67, 100000000013, '2024-03-22', 8, 13), (68, 100000000013, '2024-04-25', 8, 13),
(69, 100000000013, '2024-05-30', 8, 13), (70, 100000000014, '2024-03-30', 5, 14),
(71, 100000000014, '2024-05-01', 5, 14), (72, 100000000014, '2024-06-05', 5, 14),
(73, 100000000015, '2024-04-02', 7, 15), (74, 100000000015, '2024-05-10', 7, 15),
(75, 100000000015, '2024-06-15', 7, 15), (76, 100000000016, '2024-04-12', 9, 16),
(77, 100000000016, '2024-05-15', 9, 16), (78, 100000000016, '2024-06-20', 9, 16),
(79, 100000000017, '2024-04-22', 6, 17), (80, 100000000017, '2024-05-20', 6, 17),
(81, 100000000017, '2024-06-25', 6, 17), (82, 100000000018, '2024-04-30', 5, 18),
(83, 100000000018, '2024-06-01', 5, 18), (84, 100000000018, '2024-07-05', 5, 18),
(85, 100000000019, '2024-05-05', 11, 19), (86, 100000000019, '2024-06-05', 11, 19),
(87, 100000000019, '2024-07-10', 11, 19), (88, 100000000020, '2024-05-15', 8, 20),
(89, 100000000020, '2024-06-10', 8, 20), (90, 100000000020, '2024-07-15', 8, 20),
(91, 100000000021, '2024-06-20', 9, 1), (92, 100000000021, '2024-07-01', 9, 1),
(93, 100000000021, '2024-08-05', 9, 1), (94, 100000000022, '2024-06-25', 6, 2),
(95, 100000000022, '2024-07-10', 6, 2), (96, 100000000022, '2024-08-15', 6, 2),
(97, 100000000023, '2024-06-30', 5, 3), (98, 100000000023, '2024-07-15', 5, 3),
(99, 100000000023, '2024-08-20', 5, 3), (100, 100000000024, '2024-07-05', 10, 4),
(101, 100000000024, '2024-08-01', 10, 4), (102, 100000000024, '2024-09-05', 10, 4),
(103, 100000000025, '2024-07-10', 7, 5), (104, 100000000025, '2024-08-05', 7, 5),
(105, 100000000025, '2024-09-10', 7, 5), (106, 100000000026, '2024-08-15', 6, 6),
(107, 100000000026, '2024-09-10', 6, 6), (108, 100000000026, '2024-10-15', 6, 6),
(109, 100000000027, '2024-08-20', 8, 7), (110, 100000000027, '2024-09-15', 8, 7),
(111, 100000000027, '2024-10-20', 8, 7), (112, 100000000028, '2024-08-30', 12, 8),
(113, 100000000028, '2024-09-20', 12, 8), (114, 100000000028, '2024-10-25', 12, 8),
(115, 100000000029, '2024-09-05', 9, 9), (116, 100000000029, '2024-10-01', 9, 9),
(117, 100000000029, '2024-11-05', 9, 9), (118, 100000000030, '2024-09-15', 7, 10),
(119, 100000000030, '2024-10-05', 7, 10), (120, 100000000030, '2024-11-10', 7, 10);


INSERT INTO CATEGORIA (ID_CATEGORIA, TIPOLOGIA, TAGLIA, UNIVERSO_TOYS, ID_SOTTOCATEGORIA) VALUES
(1, 'Action Figures', 'M', 'Supereroi', 1), (2, 'Bambole', 'S', 'Fantasy', 4), (3, 'Educativi', 'M', 'STEM', 3),
(4, 'Veicoli', 'L', 'Corsa', 3), (5, 'Giochi da Tavolo', 'L', 'Famiglia', 3),
(6, 'Costruzioni', 'M', 'Creativi', 2), (7, 'Peluches', 'S', 'Animali', 4), (8, 'Puzzles', 'M', 'Logica', 2),
(9, 'Giochi Musicali', 'S', 'Suono', 4), (10, 'Videogiochi', 'L', 'Digitale', 2),
(11, 'Giochi di Carte', 'M', 'Strategia', 5), (12, 'Modelli 3D', 'L', 'Tecnologia', 1),
(13, 'Figure da Collezione', 'S', 'Vintage', 5), (14, 'Giocattoli Interattivi', 'M', 'Elettronica', 4),
(15, 'Piste da Corsa', 'L', 'Velocità', 2), (16, 'Accessori Giocattolo', 'S', 'Complementi', 1),
(17, 'Giochi di Ruolo', 'M', 'Immaginazione', 2), (18, 'Set di Magia', 'S', 'Trucco', 3),
(19, 'Giocattoli Sportivi', 'L', 'Attività', 4), (20, 'Giochi di Società', 'M', 'Gruppo', 6);


INSERT INTO PRODOTTO (CODICEBARRE, NOME, COSTO, ID_MODELLO, ID_CATEGORIA) VALUES
(100000000001, 'Superman Action Figure', 19.99, 101, 1), (100000000002, 'Barbie Dreamhouse', 99.99, 102, 2),
(100000000003, 'Lego Robotics Kit', 79.99, 103, 3), (100000000004, 'Hot Wheels Car', 4.99, 104, 4),
(100000000005, 'Monopoly Board Game', 29.99, 105, 5), (100000000006, 'Teddy Bear', 15.99, 106, 7),
(100000000007, 'Rubik\'s Cube', 12.49, 107, 8), (100000000008, 'Toy Guitar', 25.00, 108, 9),
(100000000009, 'Nintendo Switch', 299.99, 109, 10), (100000000010, 'Uno Card Game', 9.99, 110, 11),
(100000000011, 'Action Figures Avengers', 24.99, 111, 1), (100000000012, 'Frozen Elsa Doll', 35.99, 112, 2),
(100000000013, 'Lego Star Wars', 89.99, 113, 3), (100000000014, 'Matchbox Track Set', 39.99, 114, 4),
(100000000015, 'Catan Board Game', 49.99, 115, 5), (100000000016, 'Pikachu Plush', 18.99, 116, 7),
(100000000017, 'Jigsaw Puzzle 1000pcs', 14.49, 117, 8), (100000000018, 'Karaoke Machine', 79.99, 118, 9),
(100000000019, 'PlayStation 5', 499.99, 119, 10), (100000000020, 'Magic: The Gathering Cards', 19.99, 120, 11),
(100000000021, 'Spiderman Action Figure', 22.99, 121, 1), (100000000022, 'Bratz Doll', 34.99, 122, 2),
(100000000023, 'Lego Technic Car', 69.99, 123, 3), (100000000024, 'RC Car', 44.99, 124, 4),
(100000000025, 'Risk Board Game', 29.99, 125, 5), (100000000026, 'Stuffed Panda', 20.99, 126, 7),
(100000000027, '3D Puzzle Eiffel Tower', 32.49, 127, 8), (100000000028, 'Drum Set Toy', 49.99, 128, 9),
(100000000029, 'Xbox Series X', 499.99, 129, 10), (100000000030, 'Pokemon Card Set', 24.99, 130, 11),
(100000000031, 'Batman Action Figure', 19.99, 131, 1), (100000000032, 'American Girl Doll', 99.99, 132, 2),
(100000000033, 'Lego Architecture Set', 119.99, 133, 3), (100000000034, 'Hot Wheels Loop Track', 45.99, 134, 4),
(100000000035, 'Clue Board Game', 29.99, 135, 5), (100000000036, 'Teddy Bear Giant', 59.99, 136, 7),
(100000000037, '1000pc Landscape Puzzle', 17.49, 137, 8), (100000000038, 'Electric Keyboard Toy', 69.99, 138, 9),
(100000000039, 'Nintendo Switch Lite', 199.99, 139, 10), (100000000040, 'Yu-Gi-Oh Cards', 15.99, 140, 11),
(100000000041, 'Hulk Action Figure', 21.99, 141, 1), (100000000042, 'Baby Alive Doll', 29.99, 142, 2),
(100000000043, 'Lego Ninjago Set', 89.99, 143, 3), (100000000044, 'Monster Truck RC', 54.99, 144, 4),
(100000000045, 'Pandemic Board Game', 34.99, 145, 5), (100000000046, 'Fluffy Cat Plush', 18.99, 146, 7),
(100000000047, 'Solar System Puzzle', 24.49, 147, 8), (100000000048, 'Microscope Toy', 55.00, 148, 9),
(100000000049, 'Wii Console', 149.99, 149, 10), (100000000050, 'Digimon Card Set', 19.99, 150, 11),
(100000000051, 'Thor Action Figure', 19.99, 151, 1), (100000000052, 'Chelsea Doll', 25.99, 152, 2),
(100000000053, 'Lego Friends Set', 74.99, 153, 3), (100000000054, 'Race Car Set', 39.99, 154, 4),
(100000000055, 'Chess Board Game', 19.99, 155, 5), (100000000056, 'Lion Plush', 16.99, 156, 7),
(100000000057, 'World Map Puzzle', 20.99, 157, 8), (100000000058, 'Singing Bird Toy', 45.00, 158, 9),
(100000000059, 'Oculus VR Headset', 399.99, 159, 10), (100000000060, 'Playing Cards', 7.99, 160, 11);



/*
Task 1 Per verificare che ogni campo PK sia unico procedo alla selezione della tabella
destinata alla registrazione dei record contenenti le PK e verifico le righe esistenti,
infine con una query di count + distinct per verificare che il n di righe distinte corrisponda al n di righe totali
anche senza la funzione distinct 
Procedere poi,allo stesso modo per ogni altra tabella presente nel DB */

SELECT COUNT(ID_ORD)
FROM SALES;

SELECT COUNT(DISTINCT ID_ORD) AS ID_CONTA
FROM SALES;

/*Task 2 */
SELECT 
    SALES.ID_ORD, 
    SALES.DATA_ORD,
    NAZIONE.ID_NAZIONE, 
    SALES.QUANTITA_ORD,
    MACROAREA.NOME_MACROAREA,
    CASE 
        WHEN DATEDIFF(NOW(), SALES.DATA_ORD) > 180 THEN 'TRUE'
        ELSE 'FALSE'
    END AS ORDINE_SCADUTO
FROM SALES 
INNER JOIN NAZIONE ON NAZIONE.ID_NAZIONE = SALES.ID_NAZIONE
INNER JOIN MACROAREA ON NAZIONE.ID_MACROAREA = MACROAREA.ID_MACROAREA
;

/* Task 3*/
SELECT (QUANTITA_ORD),ID_ORD
FROM SALES
WHERE QUANTITA_ORD >(
SELECT SUM(QUANTITA_ORD)/COUNT(QUANTITA_ORD) AS MEDIA_VENDUTO
FROM SALES
WHERE YEAR(DATA_ORD) = 2025) AND YEAR(DATA_ORD)= 2025
;

/* Task 4 */
SELECT 
    PRODOTTO.CODICEBARRE, 
    YEAR(SALES.DATA_ORD) AS ANNO,
    SUM(PRODOTTO.COSTO * SALES.QUANTITA_ORD) AS FATTURATO_TOTALE
FROM 
    SALES
INNER JOIN 
    PRODOTTO ON PRODOTTO.CODICEBARRE = SALES.CODICEBARRE
GROUP BY 
    PRODOTTO.CODICEBARRE, 
    YEAR(SALES.DATA_ORD)
ORDER BY 
    PRODOTTO.CODICEBARRE, 
    ANNO;
/* Task 5 */
SELECT 
    NAZIONE.NOME_NAZIONE,
    YEAR(SALES.DATA_ORD) AS ANNO,
    SUM(PRODOTTO.COSTO * SALES.QUANTITA_ORD) AS FATTURATO_TOTALE
FROM 
    SALES
INNER JOIN
    PRODOTTO ON PRODOTTO.CODICEBARRE = SALES.CODICEBARRE
INNER JOIN 
    NAZIONE ON NAZIONE.ID_NAZIONE = SALES.ID_NAZIONE
GROUP BY 
    NAZIONE.NOME_NAZIONE, 
    YEAR(SALES.DATA_ORD)
ORDER BY 
     ANNO DESC,
     FATTURATO_TOTALE DESC;

/* Task 6 */
SELECT CATEGORIA.TIPOLOGIA, SUM(SALES.QUANTITA_ORD) AS TOTALE_VENDITE
FROM SALES
INNER JOIN PRODOTTO ON SALES.CODICEBARRE = PRODOTTO.CODICEBARRE
INNER JOIN CATEGORIA ON PRODOTTO.ID_CATEGORIA = CATEGORIA.ID_CATEGORIA
GROUP BY CATEGORIA.TIPOLOGIA
ORDER BY TOTALE_VENDITE DESC
LIMIT 1;

/* Task 8 */
CREATE VIEW VISTA_INFO_GEOGRAFICHE AS
SELECT 
    NAZIONE.ID_NAZIONE,
    NAZIONE.NOME_NAZIONE,
    MACROAREA.NOME_MACROAREA
FROM NAZIONE
INNER JOIN MACROAREA ON NAZIONE.ID_MACROAREA = MACROAREA.ID_MACROAREA;

/*Task 9 */
CREATE VIEW VISTA_PRODOTTI_TIPOLOGIA AS
SELECT 
    PRODOTTO.CODICEBARRE,
    PRODOTTO.NOME AS NOME_PRODOTTO,
    CATEGORIA.TIPOLOGIA
FROM PRODOTTO
INNER JOIN CATEGORIA ON PRODOTTO.ID_CATEGORIA = CATEGORIA.ID_CATEGORIA;

/* Task 7  */

SELECT PRODOTTO.CODICEBARRE AS Prodotto ,SALES.CODICEBARRE AS Vendita
FROM PRODOTTO
LEFT OUTER JOIN SALES ON PRODOTTO.CODICEBARRE=SALES.CODICEBARRE
WHERE PRODOTTO.CODICEBARRE IS NULL;

























