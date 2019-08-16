-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2018 a las 00:06:21
-- Versión del servidor: 5.7.21-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `serv_inter`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_delete_zona` (IN `inIdZona` INT)  MODIFIES SQL DATA
DELETE FROM Zona WHERE IDZONA = inIdZona$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_insert_zona` (IN `inIDZONA` INT, IN `inLocalizacion` VARCHAR(255), IN `inCiudad` INT, IN `inIDCOMERCIO` INT)  MODIFIES SQL DATA
INSERT INTO Zona (IDZONA, Localizacion, Ciudad, IDCOMERCIO) VALUES (inIDZONA, inLocalizacion, inCiudad, inIDCOMERCIO)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_show_zona` ()  READS SQL DATA
SELECT * FROM Zona$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_update_zona` (IN `inIDZONA` INT, IN `inLocalizacion` VARCHAR(255), IN `inCiudad` INT, IN `inIDCOMERCIO` INT)  MODIFIES SQL DATA
UPDATE Zona SET IDZONA= inIDZONA, Localizacion= inLocalizacion, Ciudad= inCiudad, IDCOMERCIO=inIDCOMERCIO WHERE IDZONA = inIDZONA OR Localizacion= inLocalizacion$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fuction_enmascarar_rfc` (`rfc` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET latin1 RETURN CONCAT(SUBSTRING(rfc ,1 ,4), '-', SUBSTRING(rfc ,5 ,6), '-', SUBSTRING(rfc ,11,4))$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fuction_format_date` (`Fecha` DATE) RETURNS VARCHAR(255) CHARSET latin1 RETURN CONCAT(YEAR(Fecha), '/', MONTH(Fecha), '/', Day(Fecha))$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudad`
--

CREATE TABLE `Ciudad` (
  `IDCIUDAD` int(11) NOT NULL,
  `NombreCiudad` varchar(255) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Ciudad`
--

INSERT INTO `Ciudad` (`IDCIUDAD`, `NombreCiudad`, `Estado`) VALUES
(200, 'Guanajuato', 109),
(201, 'Leon', 109),
(202, 'Celaya', 109),
(203, 'Acambaro', 109),
(204, 'Morelia', 301),
(205, 'Patzcuaro', 301),
(206, 'La Piedad', 301),
(207, 'Quiroga', 301),
(208, 'Queretaro', 102),
(209, 'Corregidora', 102),
(210, 'Tequisquiapan', 102),
(211, 'San Juan del Rio', 102),
(212, 'Guadalajara', 103),
(213, 'Zapopan', 103),
(214, 'Puerto Vallarta', 103),
(215, 'Ocotlan', 103),
(216, 'Monterrey', 214),
(217, 'Santa Catarina', 214),
(218, 'Guadalupe', 214),
(219, 'San Pedro Garza', 214);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ClienteMov`
--

CREATE TABLE `ClienteMov` (
  `IDMOVIMIENTOCLIENTE` int(11) NOT NULL,
  `NoContrato` int(11) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `NoContrato` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `ApellidoP` varchar(255) NOT NULL,
  `ApellidoM` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `IDEMPRESA` int(11) NOT NULL,
  `IDCOMERCIO` int(11) DEFAULT NULL,
  `Comercio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`NoContrato`, `Nombre`, `ApellidoP`, `ApellidoM`, `Direccion`, `Status`, `IDEMPRESA`, `IDCOMERCIO`, `Comercio`) VALUES
(1000, 'Kaden', 'Key', 'Bartlett', '6580 Egestas Avenue', 'Activo', 502, 608, 'Samsung Engineering'),
(1001, 'Janna', 'Marks', 'Harding', 'Ap #380-4910 Senectus Ave', 'Cortado', 504, 612, 'Sabritas'),
(1002, 'Lucas', 'Larsen', 'Mullins', '265 Id Rd.', 'Baja', 501, 604, 'Estrella Azul'),
(1003, 'Jacqueline', 'Alvarez', 'Waters', '838-391 Iaculis Rd.', 'Activo', 504, 613, 'Gatorade'),
(1004, 'Kevyn', 'Stafford', 'Kennedy', '1905 Donec Ave', 'Baja', 501, 605, 'Oxxo'),
(1005, 'Preston', 'Fitzpatrick', 'Wilson', 'P.O. Box 431, 6405 Dictum Rd.', 'Baja', 504, 613, 'Gatorade'),
(1006, 'Montana', 'Valenzuela', 'Pratt', '7238 Turpis. Av.', 'Activo', 500, 602, 'GMC'),
(1007, 'Jenna', 'Faulkner', 'Colon', 'P.O. Box 128, 8252 Ad St.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1008, 'Zoe', 'Frederick', 'Kirk', 'Ap #397-4118 Aenean Rd.', 'Activo', 504, 612, 'Sabritas'),
(1009, 'Jermaine', 'Thornton', 'Duke', 'Ap #834-8121 Arcu. Ave', 'Cortado', 500, 602, 'GMC'),
(1010, 'Dane', 'Valenzuela', 'Witt', '7902 Cras Street', 'Activo', 500, 601, 'Opel'),
(1011, 'Pearl', 'Lynn', 'Patton', '4795 Quis Rd.', 'Cortado', 500, 600, 'Chevrolet'),
(1012, 'Travis', 'Cote', 'Henderson', 'Ap #780-5758 Tempor St.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1013, 'Lesley', 'Mann', 'Ramirez', 'Ap #853-6336 Ullamcorper, Ave', 'Cortado', 503, 611, 'Procemex'),
(1014, 'Theodore', 'Glenn', 'Black', 'Ap #346-3410 Torquent Av.', 'Baja', 500, 601, 'Opel'),
(1015, 'Pandora', 'Gilbert', 'Barlow', 'Ap #414-2864 Eu Av.', 'Activo', 502, 608, 'Samsung Engineering'),
(1016, 'Leroy', 'Rich', 'Solomon', '3600 Purus Av.', 'Baja', 502, 606, 'Samsung Electronics'),
(1017, 'Jessamine', 'Schroeder', 'Todd', 'Ap #342-4380 Dui. Ave', 'Cortado', 503, 611, 'Procemex'),
(1018, 'Buckminster', 'Oneal', 'George', 'Ap #234-4991 Eleifend. St.', 'Cortado', 502, 608, 'Samsung Engineering'),
(1019, 'Lucy', 'Wise', 'Allison', 'Ap #561-4998 Tellus Av.', 'Baja', 503, 609, 'Cervezas Modelo'),
(1020, 'Allistair', 'Chen', 'Crosby', '902-1058 Arcu. St.', 'Activo', 502, 606, 'Samsung Electronics'),
(1021, 'Colin', 'Mercado', 'Nixon', '8347 Vivamus St.', 'Baja', 500, 601, 'Opel'),
(1022, 'Winter', 'Rosa', 'Manning', 'Ap #463-7606 Ut St.', 'Baja', 501, 603, 'Coca Cola'),
(1023, 'Risa', 'Weber', 'Young', '549-2975 Vulputate, Avenue', 'Cortado', 504, 613, 'Gatorade'),
(1024, 'Graham', 'Pollard', 'Day', 'Ap #458-4207 In Avenue', 'Cortado', 502, 606, 'Samsung Electronics'),
(1025, 'Matthew', 'Chandler', 'Sosa', '738 Eget Street', 'Baja', 502, 607, 'Samsung SDI'),
(1026, 'Elvis', 'Rush', 'Hardin', '8874 Purus. Ave', 'Activo', 503, 610, 'Extra'),
(1027, 'Rina', 'Chavez', 'Blevins', 'Ap #157-2489 Donec Street', 'Baja', 502, 606, 'Samsung Electronics'),
(1028, 'Declan', 'Faulkner', 'Perry', 'P.O. Box 747, 2793 Lorem St.', 'Cortado', 500, 602, 'GMC'),
(1029, 'Lester', 'Estrada', 'Cantu', 'P.O. Box 239, 4679 Montes, Av.', 'Activo', 503, 611, 'Procemex'),
(1030, 'Hunter', 'Gibbs', 'Pacheco', '133-1982 Non, Ave', 'Activo', 504, 613, 'Gatorade'),
(1031, 'Casey', 'Huffman', 'Wall', 'Ap #236-773 Suspendisse St.', 'Activo', 504, 612, 'Sabritas'),
(1032, 'Bethany', 'Gray', 'Soto', 'P.O. Box 681, 7795 Neque. Street', 'Cortado', 500, 601, 'Opel'),
(1033, 'Gavin', 'Ware', 'Hodges', '747-2229 Cras Street', 'Baja', 500, 602, 'GMC'),
(1034, 'Tyrone', 'Morin', 'Gomez', '747-8703 Ultricies Street', 'Baja', 502, 607, 'Samsung SDI'),
(1035, 'Illana', 'English', 'Chen', 'Ap #211-7188 Viverra. St.', 'Baja', 504, 613, 'Gatorade'),
(1036, 'Karen', 'Melton', 'Vargas', '812-7064 Dolor, Road', 'Cortado', 503, 610, 'Extra'),
(1037, 'Keefe', 'Burke', 'Tran', '985-5271 Laoreet Street', 'Cortado', 502, 608, 'Samsung Engineering'),
(1038, 'Thaddeus', 'Wallace', 'Mendoza', '912-9896 Nec Ave', 'Baja', 501, 604, 'Estrella Azul'),
(1039, 'Cecilia', 'Rios', 'Wiggins', 'Ap #670-1252 Lacus. Street', 'Baja', 500, 602, 'GMC'),
(1040, 'Ira', 'Mcgee', 'Bell', '9049 Auctor, Street', 'Cortado', 502, 606, 'Samsung Electronics'),
(1041, 'Amity', 'Colon', 'Montoya', 'P.O. Box 544, 9098 Aliquam Rd.', 'Activo', 500, 601, 'Opel'),
(1042, 'Dominic', 'Meadows', 'Weiss', '9088 Non Rd.', 'Activo', 503, 611, 'Procemex'),
(1043, 'Lila', 'Adams', 'Mendez', '5199 Molestie Av.', 'Cortado', 500, 600, 'Chevrolet'),
(1044, 'Dante', 'Reed', 'Arnold', '2023 Elit, Street', 'Activo', 502, 606, 'Samsung Electronics'),
(1045, 'Griffin', 'Park', 'Hendricks', 'Ap #909-4738 Ipsum Rd.', 'Baja', 500, 601, 'Opel'),
(1046, 'Charlotte', 'Rutledge', 'Mcgee', 'Ap #500-960 Quisque Rd.', 'Cortado', 500, 600, 'Chevrolet'),
(1047, 'Harlan', 'Brock', 'Byers', '3364 Commodo Ave', 'Cortado', 502, 607, 'Samsung SDI'),
(1048, 'Elliott', 'Weeks', 'Lopez', '8838 Elit, St.', 'Cortado', 500, 600, 'Chevrolet'),
(1049, 'Eve', 'Frazier', 'Crane', '8774 Amet, St.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1050, 'Zahir', 'Santana', 'Hoover', 'Ap #336-8067 Justo. Ave', 'Baja', 502, 606, 'Samsung Electronics'),
(1051, 'Thaddeus', 'Morrison', 'Howell', 'P.O. Box 558, 1259 Velit. Avenue', 'Activo', 504, 614, 'Desconocido'),
(1052, 'Morgan', 'Sims', 'Bean', 'Ap #971-4238 Donec St.', 'Cortado', 500, 601, 'Opel'),
(1053, 'Jerome', 'Snyder', 'Berger', '4310 Senectus Street', 'Activo', 502, 608, 'Samsung Engineering'),
(1054, 'Cain', 'Fuentes', 'Combs', 'Ap #670-2637 Varius Rd.', 'Baja', 504, 614, 'Desconocido'),
(1055, 'Thor', 'Ellison', 'Davidson', 'P.O. Box 937, 114 Erat Av.', 'Activo', 503, 611, 'Procemex'),
(1056, 'Charles', 'Neal', 'Bishop', 'P.O. Box 208, 1823 Blandit St.', 'Baja', 504, 614, 'Desconocido'),
(1057, 'Beverly', 'Lee', 'Clay', '741-8433 Proin Street', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1058, 'Nolan', 'Rojas', 'Olsen', '3751 Vehicula Av.', 'Cortado', 503, 610, 'Extra'),
(1059, 'Colette', 'Nixon', 'Myers', 'Ap #998-7239 Feugiat Road', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1060, 'Giacomo', 'Mcintyre', 'Tillman', 'Ap #209-4141 Leo St.', 'Cortado', 503, 610, 'Extra'),
(1061, 'Kirsten', 'Spencer', 'Farrell', '5398 Accumsan Ave', 'Activo', 500, 600, 'Chevrolet'),
(1062, 'Chava', 'Goodman', 'Wiggins', '326-7131 Magna, Av.', 'Activo', 500, 601, 'Opel'),
(1063, 'Dorian', 'Pitts', 'Nielsen', 'P.O. Box 821, 1248 Ornare, Av.', 'Cortado', 502, 608, 'Samsung Engineering'),
(1064, 'Cora', 'Hurst', 'Mcdowell', 'P.O. Box 649, 7749 Elementum St.', 'Activo', 500, 601, 'Opel'),
(1065, 'Sydnee', 'Reilly', 'Clayton', 'Ap #158-228 Et St.', 'Activo', 504, 614, 'Desconocido'),
(1066, 'Olivia', 'Mclaughlin', 'Leblanc', 'P.O. Box 566, 6805 Semper, Road', 'Activo', 502, 606, 'Samsung Electronics'),
(1067, 'Allistair', 'Holt', 'Skinner', 'P.O. Box 301, 9193 Ornare Av.', 'Cortado', 504, 613, 'Gatorade'),
(1068, 'Samuel', 'Buckley', 'Hull', 'Ap #643-3256 Scelerisque Rd.', 'Cortado', 500, 602, 'GMC'),
(1069, 'Duncan', 'Jones', 'Hoffman', '614-1111 At Rd.', 'Baja', 502, 606, 'Samsung Electronics'),
(1070, 'Tanek', 'Herman', 'Bush', 'P.O. Box 932, 6467 Et Av.', 'Baja', 504, 612, 'Sabritas'),
(1071, 'Felicia', 'Dudley', 'Espinoza', '238-9483 Quisque Av.', 'Baja', 500, 601, 'Opel'),
(1072, 'Desiree', 'Nicholson', 'Morrow', '3120 Eu St.', 'Activo', 500, 601, 'Opel'),
(1073, 'Pascale', 'Mejia', 'Mejia', 'Ap #649-5188 Massa Av.', 'Baja', 502, 608, 'Samsung Engineering'),
(1074, 'Dante', 'Hebert', 'Jennings', 'P.O. Box 184, 4230 Risus. Street', 'Baja', 504, 612, 'Sabritas'),
(1075, 'Avye', 'Nash', 'Acevedo', '641-4131 Phasellus Rd.', 'Baja', 501, 605, 'Oxxo'),
(1076, 'Dorian', 'Brewer', 'Hendricks', '922-4806 A Street', 'Baja', 504, 612, 'Sabritas'),
(1077, 'Burke', 'Chavez', 'Moran', 'Ap #904-5665 Ac Street', 'Activo', 500, 602, 'GMC'),
(1078, 'Ifeoma', 'Lara', 'Perkins', '960-5281 Diam. Rd.', 'Baja', 504, 613, 'Gatorade'),
(1079, 'Conan', 'Johns', 'Neal', '841-4820 Quam. Av.', 'Baja', 504, 613, 'Gatorade'),
(1080, 'Barry', 'Ruiz', 'Kirkland', '8714 Ac Avenue', 'Baja', 503, 609, 'Cervezas Modelo'),
(1081, 'Driscoll', 'Orr', 'Fernandez', 'P.O. Box 911, 6148 Dictum Av.', 'Cortado', 500, 601, 'Opel'),
(1082, 'Graiden', 'Osborne', 'Farrell', 'P.O. Box 181, 5135 Libero Ave', 'Cortado', 501, 603, 'Coca Cola'),
(1083, 'Vladimir', 'Mcneil', 'Perez', '6747 Enim, Rd.', 'Baja', 503, 609, 'Cervezas Modelo'),
(1084, 'Matthew', 'Barlow', 'Alvarado', '2722 Eu Street', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1085, 'Zeus', 'Willis', 'Maddox', '786-5263 Mollis St.', 'Activo', 503, 610, 'Extra'),
(1086, 'Gary', 'Britt', 'Hardin', 'P.O. Box 879, 846 Fames Rd.', 'Cortado', 501, 605, 'Oxxo'),
(1087, 'Quail', 'Gardner', 'Rasmussen', '748-186 Vel Rd.', 'Cortado', 502, 606, 'Samsung Electronics'),
(1088, 'Ivory', 'Merritt', 'Nixon', '7471 Turpis Av.', 'Baja', 503, 609, 'Cervezas Modelo'),
(1089, 'Dustin', 'Sweet', 'Armstrong', 'P.O. Box 440, 1421 Bibendum Ave', 'Activo', 500, 600, 'Chevrolet'),
(1090, 'Paloma', 'Bailey', 'Osborn', 'Ap #367-9783 Enim, Rd.', 'Baja', 500, 601, 'Opel'),
(1091, 'Pascale', 'Head', 'Clayton', '297-3929 Mauris Rd.', 'Baja', 500, 601, 'Opel'),
(1092, 'Zia', 'Banks', 'Ramirez', '767-8103 Ut St.', 'Baja', 504, 613, 'Gatorade'),
(1093, 'Gavin', 'Estrada', 'Hickman', 'P.O. Box 967, 7633 Tristique Avenue', 'Activo', 504, 613, 'Gatorade'),
(1094, 'Clark', 'Rivers', 'Phelps', 'P.O. Box 355, 5099 Lectus St.', 'Activo', 500, 600, 'Chevrolet'),
(1095, 'Anika', 'Whitfield', 'Aguirre', 'Ap #870-7118 Quam. Road', 'Activo', 502, 608, 'Samsung Engineering'),
(1096, 'Autumn', 'Miranda', 'Joseph', '810-1313 Consectetuer Street', 'Activo', 501, 603, 'Coca Cola'),
(1097, 'Yoshio', 'Tillman', 'Buck', '235-6037 Egestas Street', 'Cortado', 503, 611, 'Procemex'),
(1098, 'Craig', 'Wolfe', 'Cook', 'Ap #366-4784 Malesuada. Avenue', 'Cortado', 504, 612, 'Sabritas'),
(1099, 'Charles', 'Riggs', 'Wade', 'P.O. Box 748, 6768 Mauris Rd.', 'Activo', 500, 600, 'Chevrolet'),
(1100, 'Hoyt', 'Dean', 'Whitaker', 'Ap #581-9525 Nulla. Ave', 'Cortado', 501, 604, 'Estrella Azul'),
(1101, 'Hyatt', 'Jimenez', 'Livingston', '531-9074 Eget, St.', 'Baja', 504, 612, 'Sabritas'),
(1102, 'Robert', 'Mack', 'Kramer', '467-1940 Dui, Avenue', 'Baja', 501, 605, 'Oxxo'),
(1103, 'Madeson', 'Cantrell', 'Pierce', '811-4539 Eu, Av.', 'Activo', 503, 610, 'Extra'),
(1104, 'May', 'Livingston', 'Johns', '2864 Ullamcorper St.', 'Cortado', 504, 614, 'Desconocido'),
(1105, 'Ignatius', 'Lee', 'Anderson', 'P.O. Box 411, 3448 In Rd.', 'Cortado', 501, 605, 'Oxxo'),
(1106, 'Rowan', 'Wyatt', 'Neal', 'P.O. Box 272, 462 Elit, St.', 'Activo', 501, 604, 'Estrella Azul'),
(1107, 'Nora', 'Odonnell', 'England', 'Ap #991-4695 Posuere Avenue', 'Cortado', 501, 603, 'Coca Cola'),
(1108, 'Allen', 'Turner', 'Mercer', 'P.O. Box 798, 7824 Hendrerit. St.', 'Cortado', 500, 601, 'Opel'),
(1109, 'Fitzgerald', 'Sweeney', 'Pearson', 'P.O. Box 181, 1693 Rhoncus Avenue', 'Activo', 501, 605, 'Oxxo'),
(1110, 'Ignatius', 'Blanchard', 'Weber', '2042 Nunc Rd.', 'Activo', 502, 606, 'Samsung Electronics'),
(1111, 'Benedict', 'Underwood', 'Richardson', '8253 Eget Ave', 'Activo', 501, 604, 'Estrella Azul'),
(1112, 'Laura', 'Booker', 'May', '1578 Elit St.', 'Baja', 500, 600, 'Chevrolet'),
(1113, 'Brett', 'Hayes', 'Santiago', 'Ap #362-1038 Ante Road', 'Baja', 502, 606, 'Samsung Electronics'),
(1114, 'Palmer', 'Norris', 'Strong', '7374 Metus Av.', 'Cortado', 500, 601, 'Opel'),
(1115, 'Indira', 'Hubbard', 'Davis', '494-6028 Id, St.', 'Cortado', 504, 612, 'Sabritas'),
(1116, 'Veronica', 'Nielsen', 'Morrow', 'Ap #668-9611 Vitae St.', 'Cortado', 500, 600, 'Chevrolet'),
(1117, 'Desirae', 'Britt', 'Branch', 'Ap #777-6587 Dolor St.', 'Activo', 504, 612, 'Sabritas'),
(1118, 'Maia', 'Wilkins', 'Gibbs', '570-2741 Mus. Rd.', 'Cortado', 500, 601, 'Opel'),
(1119, 'Orli', 'Rosario', 'Rosales', '444-5396 Nisi Ave', 'Activo', 503, 609, 'Cervezas Modelo'),
(1120, 'Shoshana', 'Browning', 'Weber', '4395 Ultrices Av.', 'Activo', 503, 610, 'Extra'),
(1121, 'Donovan', 'Daugherty', 'Blankenship', '962-186 Non Avenue', 'Activo', 500, 602, 'GMC'),
(1122, 'Zahir', 'Todd', 'Beard', 'Ap #814-8448 Vivamus St.', 'Baja', 501, 603, 'Coca Cola'),
(1123, 'Sloane', 'Potts', 'Nixon', 'Ap #574-984 Dui Av.', 'Baja', 500, 602, 'GMC'),
(1124, 'Isabelle', 'Bowman', 'Valentine', 'Ap #147-555 Sit Ave', 'Cortado', 502, 606, 'Samsung Electronics'),
(1125, 'Geraldine', 'Kane', 'Patrick', 'Ap #130-1834 Ornare, Ave', 'Baja', 502, 608, 'Samsung Engineering'),
(1126, 'Dalton', 'Oconnor', 'Valentine', '114-8037 Velit Rd.', 'Cortado', 502, 607, 'Samsung SDI'),
(1127, 'Nadine', 'Goodwin', 'Hooper', '143-7090 Dictum Avenue', 'Cortado', 502, 608, 'Samsung Engineering'),
(1128, 'Connor', 'Frank', 'Bray', 'Ap #897-5745 Est. Road', 'Cortado', 504, 612, 'Sabritas'),
(1129, 'Jameson', 'Dillard', 'Wilkerson', '3897 Tortor. Rd.', 'Cortado', 501, 603, 'Coca Cola'),
(1130, 'Inez', 'Ferguson', 'Shepherd', 'Ap #256-6311 Ac Av.', 'Cortado', 502, 607, 'Samsung SDI'),
(1131, 'Conan', 'Vega', 'Powers', 'P.O. Box 519, 3831 Mollis Avenue', 'Baja', 504, 613, 'Gatorade'),
(1132, 'Amaya', 'Pratt', 'Pratt', '1623 Commodo Av.', 'Cortado', 504, 612, 'Sabritas'),
(1133, 'Janna', 'Vaughan', 'Velez', '6503 Fringilla Avenue', 'Activo', 501, 604, 'Estrella Azul'),
(1134, 'Moana', 'Irwin', 'Nelson', '7074 Nunc, Rd.', 'Cortado', 500, 602, 'GMC'),
(1135, 'Gavin', 'Moss', 'Reynolds', '518 Class Avenue', 'Activo', 500, 601, 'Opel'),
(1136, 'Mary', 'Harrell', 'Crosby', '506-4834 Ipsum. Road', 'Baja', 500, 602, 'GMC'),
(1137, 'Wayne', 'Townsend', 'Jennings', 'P.O. Box 511, 2845 Aliquam Av.', 'Activo', 500, 601, 'Opel'),
(1138, 'Gillian', 'Bradley', 'Bonner', '7696 Non, Avenue', 'Cortado', 500, 601, 'Opel'),
(1139, 'Jameson', 'Burns', 'Workman', '879-2155 Ac Av.', 'Cortado', 502, 607, 'Samsung SDI'),
(1140, 'Rhea', 'Byers', 'Villarreal', '293-439 In Rd.', 'Baja', 503, 611, 'Procemex'),
(1141, 'Kyla', 'Brady', 'Schroeder', 'Ap #445-7189 Mi, Rd.', 'Cortado', 501, 603, 'Coca Cola'),
(1142, 'Brett', 'Dillon', 'Ayala', '3159 Nonummy Rd.', 'Baja', 504, 612, 'Sabritas'),
(1143, 'Carter', 'Whitney', 'Small', 'P.O. Box 758, 9663 Aliquet Street', 'Baja', 501, 603, 'Coca Cola'),
(1144, 'Aubrey', 'Castro', 'Faulkner', 'P.O. Box 806, 7217 Sodales. St.', 'Activo', 504, 614, 'Desconocido'),
(1145, 'Isaiah', 'Middleton', 'Nielsen', 'Ap #414-986 Mauris Ave', 'Baja', 503, 610, 'Extra'),
(1146, 'Elvis', 'Morrison', 'Gilbert', '805-2874 Convallis St.', 'Baja', 503, 611, 'Procemex'),
(1147, 'Justina', 'Simpson', 'Wright', 'Ap #877-9665 Orci. Street', 'Baja', 500, 601, 'Opel'),
(1148, 'Gage', 'Suarez', 'Romero', '221-815 Dictum Rd.', 'Cortado', 500, 602, 'GMC'),
(1149, 'Wade', 'Arnold', 'Osborne', 'Ap #823-7130 Ac Ave', 'Activo', 504, 613, 'Gatorade'),
(1150, 'Tiger', 'Gibson', 'Cooke', '233-5344 Pede. Avenue', 'Baja', 500, 600, 'Chevrolet'),
(1151, 'Hall', 'Mcknight', 'Prince', 'Ap #742-1383 Adipiscing Street', 'Baja', 501, 603, 'Coca Cola'),
(1152, 'Summer', 'Bean', 'Holloway', 'P.O. Box 877, 2609 Ut, Rd.', 'Activo', 501, 604, 'Estrella Azul'),
(1153, 'Amir', 'Battle', 'Alford', 'Ap #772-1374 Rhoncus. Avenue', 'Activo', 503, 610, 'Extra'),
(1154, 'Chelsea', 'Huffman', 'Livingston', 'P.O. Box 475, 7568 Risus Avenue', 'Activo', 504, 614, 'Desconocido'),
(1155, 'Cassidy', 'Sheppard', 'Freeman', 'P.O. Box 964, 7524 Nam St.', 'Baja', 503, 610, 'Extra'),
(1156, 'Hoyt', 'Kaufman', 'Dunlap', 'Ap #922-9099 Arcu Road', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1157, 'Ishmael', 'Harmon', 'Combs', '683-3979 A Street', 'Baja', 501, 605, 'Oxxo'),
(1158, 'India', 'Potter', 'Atkins', '906-7395 Nam Rd.', 'Activo', 503, 611, 'Procemex'),
(1159, 'Keaton', 'Pollard', 'Church', '8640 Iaculis Avenue', 'Baja', 503, 611, 'Procemex'),
(1160, 'Brenda', 'Guzman', 'Pickett', '6178 Ante Road', 'Activo', 504, 614, 'Desconocido'),
(1161, 'Hector', 'Ortega', 'Yang', 'P.O. Box 636, 5087 In Ave', 'Baja', 500, 600, 'Chevrolet'),
(1162, 'Hop', 'Buck', 'Strickland', '914-1312 Massa. Road', 'Baja', 501, 605, 'Oxxo'),
(1163, 'Seth', 'Savage', 'Erickson', 'Ap #376-1182 Odio Street', 'Cortado', 500, 602, 'GMC'),
(1164, 'Julian', 'Williams', 'Gibbs', '158-5732 Luctus Road', 'Baja', 500, 602, 'GMC'),
(1165, 'Pascale', 'Garcia', 'Best', 'P.O. Box 308, 5100 Scelerisque Rd.', 'Activo', 500, 600, 'Chevrolet'),
(1166, 'Ahmed', 'Barry', 'Lindsey', 'Ap #828-2219 Maecenas Avenue', 'Cortado', 500, 600, 'Chevrolet'),
(1167, 'Carissa', 'Mckinney', 'Woods', '922-9634 Pellentesque St.', 'Activo', 504, 614, 'Desconocido'),
(1168, 'Winter', 'Rice', 'Joyce', '9375 Ut St.', 'Activo', 501, 605, 'Oxxo'),
(1169, 'Leo', 'Hubbard', 'Bender', 'Ap #559-9579 Sit St.', 'Baja', 504, 614, 'Desconocido'),
(1170, 'Peter', 'Mcmahon', 'Duran', 'Ap #934-5243 Diam Avenue', 'Cortado', 504, 614, 'Desconocido'),
(1171, 'Renee', 'Potts', 'Valdez', 'Ap #314-7303 Vestibulum St.', 'Cortado', 503, 611, 'Procemex'),
(1172, 'Raymond', 'Hahn', 'Blankenship', 'P.O. Box 914, 5921 Vel Ave', 'Cortado', 504, 614, 'Desconocido'),
(1173, 'Ulla', 'Guthrie', 'Hampton', 'P.O. Box 696, 3693 Libero Avenue', 'Activo', 504, 614, 'Desconocido'),
(1174, 'Chelsea', 'Byers', 'Parker', '710-8357 Ac, St.', 'Baja', 501, 603, 'Coca Cola'),
(1175, 'Jarrod', 'Mclaughlin', 'Miles', 'Ap #259-9565 Suscipit, Av.', 'Cortado', 504, 614, 'Desconocido'),
(1176, 'Charity', 'Kennedy', 'Hodges', '1558 Vestibulum Rd.', 'Cortado', 504, 612, 'Sabritas'),
(1177, 'Charles', 'Sparks', 'Houston', 'P.O. Box 733, 9809 Aliquet St.', 'Activo', 501, 604, 'Estrella Azul'),
(1178, 'Reuben', 'Robinson', 'Abbott', '5864 Vitae, Road', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1179, 'Leo', 'Hardin', 'Barr', 'Ap #576-5543 Nec Rd.', 'Baja', 503, 609, 'Cervezas Modelo'),
(1180, 'Camilla', 'Hodge', 'Molina', 'Ap #408-6271 Varius Av.', 'Baja', 501, 604, 'Estrella Azul'),
(1181, 'George', 'Howe', 'Bradley', 'P.O. Box 621, 6263 Pede, Ave', 'Baja', 502, 606, 'Samsung Electronics'),
(1182, 'Kaseem', 'Cabrera', 'Hyde', '866-7872 At, St.', 'Cortado', 504, 612, 'Sabritas'),
(1183, 'Francis', 'Thomas', 'Benson', '537-8747 Fames St.', 'Activo', 503, 610, 'Extra'),
(1184, 'Hayden', 'Pitts', 'Willis', '365-9311 Adipiscing Av.', 'Activo', 500, 602, 'GMC'),
(1185, 'Jason', 'Rodriquez', 'Carroll', 'P.O. Box 512, 4231 Est, Street', 'Baja', 501, 605, 'Oxxo'),
(1186, 'Fallon', 'Dean', 'Compton', '964-4169 Lectus Avenue', 'Activo', 501, 605, 'Oxxo'),
(1187, 'Jaime', 'Carlson', 'Brady', '125-3160 Laoreet Road', 'Cortado', 502, 606, 'Samsung Electronics'),
(1188, 'Rajah', 'Caldwell', 'Casey', 'Ap #132-1424 Blandit. Street', 'Cortado', 504, 614, 'Desconocido'),
(1189, 'Robin', 'Sanford', 'Ramirez', 'P.O. Box 900, 4274 Cras St.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1190, 'Damon', 'Carver', 'Burns', '322-972 Sed Street', 'Baja', 501, 605, 'Oxxo'),
(1191, 'Donna', 'Lawson', 'Pearson', 'Ap #345-2316 Eget, Av.', 'Baja', 501, 604, 'Estrella Azul'),
(1192, 'Vivian', 'Mcguire', 'Carpenter', 'P.O. Box 121, 9194 Suspendisse St.', 'Activo', 501, 604, 'Estrella Azul'),
(1193, 'Clare', 'Rollins', 'Mccoy', 'P.O. Box 138, 1054 Mus. Rd.', 'Baja', 500, 600, 'Chevrolet'),
(1194, 'Merritt', 'Harrison', 'Lynn', '5802 Tincidunt Av.', 'Baja', 501, 604, 'Estrella Azul'),
(1195, 'Daniel', 'Kim', 'Estes', 'P.O. Box 254, 8415 Curabitur Av.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1196, 'Axel', 'Spears', 'Gross', '153-6014 Dolor. St.', 'Activo', 500, 601, 'Opel'),
(1197, 'Dieter', 'Banks', 'Ball', 'P.O. Box 753, 3387 Enim Avenue', 'Activo', 500, 600, 'Chevrolet'),
(1198, 'Latifah', 'Henry', 'Thompson', '3508 Semper. Av.', 'Baja', 504, 614, 'Desconocido'),
(1199, 'Karina', 'Reyes', 'Washington', 'P.O. Box 832, 1544 Pede, Rd.', 'Cortado', 503, 610, 'Extra'),
(1200, 'Sawyer', 'Evans', 'Dudley', 'Ap #797-8559 Euismod St.', 'Baja', 500, 602, 'GMC'),
(1201, 'Keefe', 'Ellison', 'Santos', '9360 Phasellus Rd.', 'Activo', 502, 608, 'Samsung Engineering'),
(1202, 'Lara', 'Cannon', 'Clarke', 'P.O. Box 730, 9814 Mauris Street', 'Activo', 503, 611, 'Procemex'),
(1203, 'Rooney', 'Stevens', 'Joseph', 'P.O. Box 857, 3958 Enim. Rd.', 'Baja', 501, 605, 'Oxxo'),
(1204, 'Aimee', 'Patel', 'Rhodes', 'Ap #169-7080 Dis Street', 'Cortado', 500, 600, 'Chevrolet'),
(1205, 'Dakota', 'David', 'Griffin', '5177 Gravida. St.', 'Activo', 500, 602, 'GMC'),
(1206, 'Harding', 'Curry', 'Yang', 'Ap #587-1594 Eget Rd.', 'Baja', 501, 605, 'Oxxo'),
(1207, 'Mia', 'Marks', 'Kelly', '576-4305 Donec Rd.', 'Baja', 501, 604, 'Estrella Azul'),
(1208, 'Portia', 'Acevedo', 'Bryan', 'Ap #349-2296 Augue Avenue', 'Baja', 502, 606, 'Samsung Electronics'),
(1209, 'Martena', 'Galloway', 'Hall', '3383 Orci Rd.', 'Cortado', 502, 607, 'Samsung SDI'),
(1210, 'Carolyn', 'Benson', 'Harvey', '5345 Risus, Avenue', 'Activo', 501, 605, 'Oxxo'),
(1211, 'Jada', 'Stone', 'Sandoval', 'Ap #850-9952 Orci. Av.', 'Baja', 501, 604, 'Estrella Azul'),
(1212, 'Marcia', 'Franco', 'Rosa', '992-7782 Curabitur St.', 'Cortado', 504, 612, 'Sabritas'),
(1213, 'Hakeem', 'Berry', 'Clayton', '928-5034 Iaculis Av.', 'Cortado', 504, 614, 'Desconocido'),
(1214, 'Lane', 'Heath', 'Gibbs', '965-6171 Proin St.', 'Baja', 502, 608, 'Samsung Engineering'),
(1215, 'Xantha', 'Potts', 'Dodson', 'Ap #535-9202 Donec Road', 'Activo', 502, 608, 'Samsung Engineering'),
(1216, 'Tyler', 'Bass', 'Moon', 'Ap #241-4973 Varius Av.', 'Activo', 504, 614, 'Desconocido'),
(1217, 'Baxter', 'Delaney', 'Hancock', '466-119 Magna. St.', 'Baja', 502, 608, 'Samsung Engineering'),
(1218, 'Jakeem', 'Park', 'Wolfe', 'Ap #622-298 Montes, Rd.', 'Cortado', 504, 614, 'Desconocido'),
(1219, 'Amaya', 'Puckett', 'Forbes', '109-9501 Accumsan Avenue', 'Cortado', 500, 601, 'Opel'),
(1220, 'Lance', 'Richmond', 'Grant', '803-1490 Tincidunt Rd.', 'Baja', 502, 606, 'Samsung Electronics'),
(1221, 'Donna', 'Yang', 'Wright', '5785 Mus. Rd.', 'Cortado', 502, 608, 'Samsung Engineering'),
(1222, 'Mannix', 'Blair', 'Perez', 'P.O. Box 322, 4206 Tincidunt Av.', 'Activo', 504, 612, 'Sabritas'),
(1223, 'Lionel', 'Kirby', 'Hubbard', 'Ap #548-1497 Enim. Avenue', 'Baja', 500, 602, 'GMC'),
(1224, 'Tarik', 'White', 'Tanner', '3519 Non, Avenue', 'Baja', 502, 608, 'Samsung Engineering'),
(1225, 'Adrian', 'Barron', 'Mann', 'P.O. Box 993, 4844 Fermentum St.', 'Cortado', 504, 614, 'Desconocido'),
(1226, 'Sandra', 'Horton', 'Powers', '954-9796 Nec, Street', 'Cortado', 504, 614, 'Desconocido'),
(1227, 'Lunea', 'Lopez', 'Bean', '593-5159 Ante Street', 'Activo', 504, 612, 'Sabritas'),
(1228, 'Cairo', 'Joyner', 'Dominguez', 'Ap #535-5662 Turpis Street', 'Activo', 501, 603, 'Coca Cola'),
(1229, 'Ryan', 'Brady', 'Klein', 'P.O. Box 486, 3782 A Street', 'Cortado', 502, 607, 'Samsung SDI'),
(1230, 'Unity', 'Vang', 'Hester', '2340 Sed St.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1231, 'Myles', 'Haley', 'Hudson', '9488 Molestie. St.', 'Activo', 503, 610, 'Extra'),
(1232, 'Keely', 'Hinton', 'Hardin', '810-1734 Quam. Av.', 'Activo', 500, 600, 'Chevrolet'),
(1233, 'Medge', 'Espinoza', 'Rivers', 'Ap #698-5921 Scelerisque St.', 'Cortado', 502, 606, 'Samsung Electronics'),
(1234, 'Carol', 'Flowers', 'Wilder', '108-3707 Ullamcorper. Av.', 'Baja', 500, 601, 'Opel'),
(1235, 'Mary', 'Farrell', 'Dudley', '781-5321 Rhoncus. St.', 'Cortado', 504, 613, 'Gatorade'),
(1236, 'Abigail', 'Calhoun', 'Berg', 'P.O. Box 451, 1428 Orci, Rd.', 'Activo', 501, 605, 'Oxxo'),
(1237, 'Heather', 'Dawson', 'Mcfadden', 'Ap #809-1118 Nunc Rd.', 'Activo', 503, 610, 'Extra'),
(1238, 'Janna', 'Singleton', 'Stewart', '539-5064 Aliquam Rd.', 'Activo', 502, 606, 'Samsung Electronics'),
(1239, 'Phoebe', 'Mcconnell', 'Riley', 'P.O. Box 754, 6266 Massa. Ave', 'Cortado', 501, 604, 'Estrella Azul'),
(1240, 'Declan', 'Coffey', 'Mercado', '8907 Aliquam, Ave', 'Activo', 500, 600, 'Chevrolet'),
(1241, 'Jolene', 'Holt', 'Gregory', 'Ap #630-5487 Consectetuer St.', 'Cortado', 502, 606, 'Samsung Electronics'),
(1242, 'Sawyer', 'Walton', 'Mullen', '769-9414 Tincidunt Street', 'Cortado', 501, 605, 'Oxxo'),
(1243, 'Shelley', 'Baxter', 'Glenn', '744-2920 Suspendisse St.', 'Activo', 501, 603, 'Coca Cola'),
(1244, 'Jaquelyn', 'Steele', 'William', 'P.O. Box 391, 4203 Posuere St.', 'Cortado', 500, 602, 'GMC'),
(1245, 'Denton', 'Huff', 'Best', '235-3169 A, Ave', 'Baja', 504, 612, 'Sabritas'),
(1246, 'Tatyana', 'Potts', 'Cooke', 'Ap #431-1914 Aliquet. Rd.', 'Cortado', 500, 602, 'GMC'),
(1247, 'Iona', 'Morrison', 'Mejia', 'Ap #894-2085 Tincidunt. Ave', 'Baja', 500, 600, 'Chevrolet'),
(1248, 'Adrian', 'Zamora', 'Summers', '7588 Dictum Road', 'Activo', 500, 600, 'Chevrolet'),
(1249, 'Cyrus', 'Donaldson', 'Ramos', '6008 Nullam Road', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1250, 'Patricia', 'Brock', 'Dominguez', 'P.O. Box 747, 3599 Sem Ave', 'Baja', 501, 603, 'Coca Cola'),
(1251, 'Emerson', 'Pierce', 'Baldwin', 'P.O. Box 437, 9679 Magna. St.', 'Activo', 500, 601, 'Opel'),
(1252, 'Xyla', 'Pruitt', 'Newton', '185-6105 Cursus Street', 'Cortado', 504, 614, 'Desconocido'),
(1253, 'Preston', 'Mcintyre', 'Mccarthy', '724-934 Felis. St.', 'Activo', 504, 612, 'Sabritas'),
(1254, 'Aretha', 'Carver', 'Nguyen', 'P.O. Box 969, 9513 Nisi Rd.', 'Cortado', 502, 607, 'Samsung SDI'),
(1255, 'Hunter', 'Hernandez', 'Tyler', 'P.O. Box 128, 9994 Curabitur St.', 'Activo', 502, 607, 'Samsung SDI'),
(1256, 'Nita', 'Fowler', 'Alston', 'P.O. Box 731, 3608 Curabitur Avenue', 'Baja', 503, 610, 'Extra'),
(1257, 'Nero', 'Lynch', 'Bradley', 'Ap #440-9624 Feugiat Av.', 'Baja', 503, 610, 'Extra'),
(1258, 'Xaviera', 'Branch', 'Giles', '750-9281 Fringilla Avenue', 'Baja', 504, 614, 'Desconocido'),
(1259, 'Chaney', 'Frost', 'Summers', 'P.O. Box 601, 1179 Ac Ave', 'Cortado', 500, 601, 'Opel'),
(1260, 'Arden', 'Duke', 'Maddox', 'P.O. Box 910, 4546 Vitae Avenue', 'Activo', 501, 605, 'Oxxo'),
(1261, 'Erica', 'Garrison', 'Horton', '669-1735 Mauris. Rd.', 'Activo', 503, 610, 'Extra'),
(1262, 'Kamal', 'Golden', 'Farley', '4246 Natoque Av.', 'Activo', 501, 604, 'Estrella Azul'),
(1263, 'Alexandra', 'Moreno', 'Mccarty', '2950 Ultrices Av.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1264, 'Wayne', 'Vincent', 'George', 'P.O. Box 127, 1659 Vehicula St.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1265, 'Brett', 'Chambers', 'Nieves', 'P.O. Box 255, 2204 Vulputate St.', 'Baja', 504, 614, 'Desconocido'),
(1266, 'Melodie', 'Ashley', 'House', 'Ap #133-1599 Donec Street', 'Baja', 502, 608, 'Samsung Engineering'),
(1267, 'Robert', 'Roy', 'Baird', '8955 Tempus Road', 'Activo', 503, 611, 'Procemex'),
(1268, 'Victoria', 'Wood', 'Hester', 'P.O. Box 950, 4240 Tellus Rd.', 'Cortado', 502, 608, 'Samsung Engineering'),
(1269, 'Jocelyn', 'Hood', 'Henson', '270-222 Tortor. Avenue', 'Activo', 503, 610, 'Extra'),
(1270, 'Jacob', 'Ramirez', 'Flores', 'Ap #479-6649 Tortor Rd.', 'Activo', 504, 613, 'Gatorade'),
(1271, 'Kay', 'Velez', 'Chase', '669-7751 Lorem, Road', 'Activo', 502, 607, 'Samsung SDI'),
(1272, 'Orlando', 'Summers', 'Prince', 'Ap #190-8529 Fermentum St.', 'Activo', 503, 610, 'Extra'),
(1273, 'Reece', 'Keith', 'Hammond', '441 Natoque St.', 'Baja', 503, 611, 'Procemex'),
(1274, 'Amos', 'Wilder', 'Christensen', '4686 Parturient Rd.', 'Activo', 500, 602, 'GMC'),
(1275, 'Summer', 'Hood', 'Mathews', 'Ap #382-217 Lectus Ave', 'Baja', 501, 603, 'Coca Cola'),
(1276, 'Lester', 'Hopper', 'Nieves', '685-2723 Nam Rd.', 'Activo', 502, 608, 'Samsung Engineering'),
(1277, 'Amethyst', 'Fox', 'Yates', '600-8247 Diam Street', 'Baja', 502, 606, 'Samsung Electronics'),
(1278, 'Orlando', 'Brooks', 'Martinez', '618-2707 Nunc Rd.', 'Baja', 501, 605, 'Oxxo'),
(1279, 'Quyn', 'Rogers', 'Ashley', 'P.O. Box 557, 1490 Neque St.', 'Activo', 502, 608, 'Samsung Engineering'),
(1280, 'Judah', 'Pickett', 'Wilkinson', 'P.O. Box 841, 1575 Urna St.', 'Baja', 504, 614, 'Desconocido'),
(1281, 'Cherokee', 'Barnett', 'Mcfarland', 'P.O. Box 749, 1608 Erat Ave', 'Activo', 503, 611, 'Procemex'),
(1282, 'Laura', 'Brock', 'Bryant', 'P.O. Box 686, 9672 Nibh. Avenue', 'Baja', 502, 608, 'Samsung Engineering'),
(1283, 'Mira', 'Compton', 'Park', '960-1803 Ridiculus Av.', 'Activo', 503, 610, 'Extra'),
(1284, 'Alexis', 'Phelps', 'Hines', 'Ap #146-8181 Molestie St.', 'Activo', 503, 611, 'Procemex'),
(1285, 'Zeus', 'Hester', 'Schroeder', '1840 Diam St.', 'Activo', 500, 602, 'GMC'),
(1286, 'Gage', 'Jefferson', 'Hays', '317-8819 Dictum Road', 'Baja', 500, 600, 'Chevrolet'),
(1287, 'Autumn', 'Ware', 'Brady', '1536 Non, St.', 'Baja', 500, 600, 'Chevrolet'),
(1288, 'Serena', 'Hayes', 'Good', 'Ap #294-3044 Venenatis St.', 'Baja', 503, 610, 'Extra'),
(1289, 'Linus', 'Cantrell', 'Floyd', '8069 Et Street', 'Activo', 504, 613, 'Gatorade'),
(1290, 'Blythe', 'Avila', 'Cervantes', 'P.O. Box 646, 2266 Tristique Av.', 'Activo', 502, 608, 'Samsung Engineering'),
(1291, 'Adam', 'Workman', 'Britt', '440-7541 Ac Road', 'Baja', 503, 610, 'Extra'),
(1292, 'Chaney', 'Fisher', 'Ruiz', 'P.O. Box 688, 8916 Auctor St.', 'Activo', 500, 602, 'GMC'),
(1293, 'Jaquelyn', 'Graves', 'Holder', 'Ap #597-9751 Et, Rd.', 'Activo', 501, 603, 'Coca Cola'),
(1294, 'Erica', 'Owens', 'Crosby', '182-8645 A Rd.', 'Cortado', 501, 605, 'Oxxo'),
(1295, 'Sade', 'Glenn', 'Emerson', 'Ap #199-4786 Suspendisse Rd.', 'Cortado', 502, 606, 'Samsung Electronics'),
(1296, 'Quynn', 'Witt', 'Hansen', 'P.O. Box 141, 6758 Nisi. St.', 'Cortado', 500, 602, 'GMC'),
(1297, 'Adrienne', 'Brock', 'Knowles', 'P.O. Box 895, 1941 Dictum Rd.', 'Activo', 500, 600, 'Chevrolet'),
(1298, 'Dieter', 'Garza', 'Terrell', '399-6561 Aliquet Av.', 'Activo', 500, 602, 'GMC'),
(1299, 'Rashad', 'White', 'Alvarado', '152-3032 Nunc Av.', 'Baja', 500, 600, 'Chevrolet'),
(1300, 'Caesar', 'Mcknight', 'Knight', 'P.O. Box 675, 4495 Tellus. St.', 'Baja', 502, 608, 'Samsung Engineering'),
(1301, 'Inez', 'Baird', 'Hendrix', 'P.O. Box 241, 7583 Nulla St.', 'Cortado', 504, 613, 'Gatorade'),
(1302, 'Castor', 'Christian', 'Gould', '2240 Ut St.', 'Activo', 500, 602, 'GMC'),
(1303, 'Forrest', 'Kim', 'Chapman', 'P.O. Box 766, 1842 Etiam Road', 'Activo', 501, 603, 'Coca Cola'),
(1304, 'Paul', 'Dorsey', 'Edwards', '221 Imperdiet Rd.', 'Cortado', 501, 605, 'Oxxo'),
(1305, 'Sandra', 'Jensen', 'Garner', 'Ap #320-1049 Quisque Rd.', 'Activo', 502, 607, 'Samsung SDI'),
(1306, 'Amelia', 'Lancaster', 'Dyer', '5278 Mauris St.', 'Cortado', 500, 602, 'GMC'),
(1307, 'Adrienne', 'Hood', 'Reed', '2661 At, Avenue', 'Cortado', 504, 613, 'Gatorade'),
(1308, 'Ora', 'Davis', 'Ross', '8631 Vitae Rd.', 'Cortado', 501, 603, 'Coca Cola'),
(1309, 'Eugenia', 'Jennings', 'Gillespie', 'P.O. Box 954, 9368 Nulla Rd.', 'Cortado', 504, 614, 'Desconocido'),
(1310, 'Owen', 'Poole', 'Gamble', '835-7242 Egestas. Street', 'Cortado', 504, 612, 'Sabritas'),
(1311, 'Halee', 'Kirby', 'Wilson', '176-434 Fringilla St.', 'Activo', 500, 600, 'Chevrolet'),
(1312, 'Aaron', 'Monroe', 'Puckett', 'Ap #839-2353 Tempor Rd.', 'Baja', 502, 606, 'Samsung Electronics'),
(1313, 'Fritz', 'Leach', 'Lindsey', '545-4222 Risus. Avenue', 'Cortado', 502, 606, 'Samsung Electronics'),
(1314, 'Galvin', 'Rivas', 'Richmond', 'P.O. Box 972, 129 Ipsum. Av.', 'Activo', 501, 603, 'Coca Cola'),
(1315, 'Sophia', 'Justice', 'Mitchell', 'Ap #163-8472 Auctor Street', 'Cortado', 504, 612, 'Sabritas'),
(1316, 'Rebecca', 'Lane', 'Warren', '1153 Ullamcorper Ave', 'Baja', 504, 613, 'Gatorade'),
(1317, 'Barrett', 'Adkins', 'Sweet', '925-9207 Hendrerit. Street', 'Baja', 503, 610, 'Extra'),
(1318, 'Lucian', 'Campbell', 'Dickson', 'Ap #571-3775 Sed Avenue', 'Baja', 503, 611, 'Procemex'),
(1319, 'Bell', 'Bennett', 'Foster', 'Ap #136-6051 Felis Road', 'Cortado', 500, 600, 'Chevrolet'),
(1320, 'Xandra', 'Valdez', 'Walton', '330-5390 Quis Avenue', 'Activo', 500, 601, 'Opel'),
(1321, 'Noelle', 'Stout', 'Barlow', 'P.O. Box 952, 9326 Aliquet Avenue', 'Baja', 500, 600, 'Chevrolet'),
(1322, 'Cadman', 'Walsh', 'Knapp', '4551 Duis Avenue', 'Activo', 503, 611, 'Procemex'),
(1323, 'Gemma', 'Boone', 'Richard', '933-6095 Enim. Ave', 'Baja', 502, 606, 'Samsung Electronics'),
(1324, 'Olga', 'Wynn', 'Wilson', '7533 Nonummy Ave', 'Activo', 502, 606, 'Samsung Electronics'),
(1325, 'Alisa', 'Kramer', 'Hurley', 'Ap #463-9658 Purus Rd.', 'Cortado', 502, 606, 'Samsung Electronics'),
(1326, 'Lesley', 'Martin', 'Velez', 'Ap #180-2042 Vulputate St.', 'Activo', 500, 601, 'Opel'),
(1327, 'Mufutau', 'Alston', 'Robles', '1905 Adipiscing St.', 'Baja', 503, 610, 'Extra'),
(1328, 'Myra', 'Meadows', 'Kirk', 'P.O. Box 639, 6348 Fermentum St.', 'Cortado', 502, 608, 'Samsung Engineering'),
(1329, 'Jacob', 'Fry', 'Wagner', '6489 Lorem, St.', 'Baja', 500, 602, 'GMC'),
(1330, 'Holly', 'Lyons', 'Key', '9921 Donec Avenue', 'Activo', 503, 609, 'Cervezas Modelo'),
(1331, 'Jenna', 'Tyson', 'Hatfield', 'P.O. Box 276, 7664 Dolor. Ave', 'Activo', 503, 611, 'Procemex'),
(1332, 'Warren', 'Campos', 'Sanchez', '998-4685 In Rd.', 'Baja', 500, 600, 'Chevrolet'),
(1333, 'Tatyana', 'Hall', 'Andrews', 'P.O. Box 839, 9797 Donec Rd.', 'Cortado', 502, 606, 'Samsung Electronics'),
(1334, 'Gabriel', 'Pickett', 'Goodman', '238-8199 Nec, Rd.', 'Activo', 500, 602, 'GMC'),
(1335, 'Elmo', 'Scott', 'Saunders', 'Ap #672-175 Maecenas Av.', 'Cortado', 503, 610, 'Extra'),
(1336, 'Omar', 'Vasquez', 'Kinney', 'Ap #498-3562 Scelerisque Rd.', 'Baja', 500, 600, 'Chevrolet'),
(1337, 'Gemma', 'May', 'Robinson', '3552 Mus. Avenue', 'Cortado', 501, 604, 'Estrella Azul'),
(1338, 'Tad', 'Blair', 'Daugherty', 'Ap #320-4919 Duis St.', 'Cortado', 502, 608, 'Samsung Engineering'),
(1339, 'Hu', 'Huber', 'Burgess', '730-981 Sollicitudin St.', 'Baja', 502, 607, 'Samsung SDI'),
(1340, 'Dolan', 'George', 'French', 'Ap #437-5318 Auctor Av.', 'Activo', 502, 606, 'Samsung Electronics'),
(1341, 'Ima', 'Swanson', 'Payne', '8119 Mauris Avenue', 'Cortado', 500, 602, 'GMC'),
(1342, 'MacKenzie', 'Jacobs', 'Chambers', 'P.O. Box 396, 8656 Tellus. Road', 'Cortado', 504, 614, 'Desconocido'),
(1343, 'Rebecca', 'Peters', 'Cox', 'Ap #383-4178 Aliquam, Street', 'Activo', 504, 614, 'Desconocido'),
(1344, 'Regina', 'Roth', 'Rosa', '582-7493 Gravida St.', 'Activo', 502, 606, 'Samsung Electronics'),
(1345, 'Shaeleigh', 'Soto', 'Dillon', '5310 Pede Street', 'Cortado', 501, 603, 'Coca Cola'),
(1346, 'Eve', 'Cooley', 'Atkins', '127-5456 Nunc Avenue', 'Baja', 501, 605, 'Oxxo'),
(1347, 'Alea', 'Vaughn', 'Velasquez', 'Ap #847-2203 Amet St.', 'Baja', 504, 614, 'Desconocido'),
(1348, 'Cheyenne', 'Hayden', 'Shaffer', 'P.O. Box 119, 7536 Etiam Street', 'Activo', 502, 608, 'Samsung Engineering'),
(1349, 'Sebastian', 'Pennington', 'Henry', 'Ap #563-2774 Tincidunt Rd.', 'Activo', 504, 614, 'Desconocido'),
(1350, 'Colleen', 'Robertson', 'Mcmillan', 'Ap #492-3264 Ac Rd.', 'Activo', 500, 600, 'Chevrolet'),
(1351, 'Amos', 'Robbins', 'Le', 'Ap #940-1606 Pede. Rd.', 'Activo', 500, 600, 'Chevrolet'),
(1352, 'Cherokee', 'Key', 'Roy', '361-2210 Sociis St.', 'Cortado', 503, 610, 'Extra'),
(1353, 'Stephen', 'Roy', 'Blackwell', '481-3901 Parturient Ave', 'Cortado', 504, 613, 'Gatorade'),
(1354, 'Risa', 'Ashley', 'Medina', '9877 Ante. St.', 'Activo', 501, 604, 'Estrella Azul'),
(1355, 'Abdul', 'Lang', 'Curry', '968-8854 Id, Avenue', 'Baja', 502, 607, 'Samsung SDI'),
(1356, 'Keefe', 'Summers', 'Hyde', '6270 In Rd.', 'Activo', 501, 603, 'Coca Cola'),
(1357, 'Tatyana', 'Maxwell', 'Riley', 'P.O. Box 403, 4768 Neque. St.', 'Cortado', 502, 608, 'Samsung Engineering'),
(1358, 'Dana', 'Taylor', 'Roach', 'Ap #530-4231 Mi Avenue', 'Baja', 501, 603, 'Coca Cola'),
(1359, 'Eliana', 'Middleton', 'Baldwin', 'Ap #187-3434 Massa. Av.', 'Activo', 503, 611, 'Procemex'),
(1360, 'Lilah', 'Mercer', 'Tate', '383-511 Lorem St.', 'Activo', 504, 613, 'Gatorade'),
(1361, 'Hayden', 'Carson', 'Hess', '750-8794 Nec St.', 'Baja', 501, 605, 'Oxxo'),
(1362, 'Wade', 'Mccoy', 'Howell', '1808 Eget St.', 'Baja', 502, 606, 'Samsung Electronics'),
(1363, 'Otto', 'Rosario', 'Eaton', 'P.O. Box 273, 7222 Sem St.', 'Cortado', 502, 607, 'Samsung SDI'),
(1364, 'Cairo', 'York', 'Sims', 'P.O. Box 878, 8226 Eros Street', 'Baja', 503, 611, 'Procemex'),
(1365, 'Patrick', 'Anthony', 'Patton', '380-5217 Eget Street', 'Cortado', 502, 607, 'Samsung SDI'),
(1366, 'Fleur', 'Mcmillan', 'Vega', 'P.O. Box 322, 2779 Dui Street', 'Baja', 504, 612, 'Sabritas'),
(1367, 'Harper', 'Ayers', 'Hull', 'P.O. Box 830, 189 Dictum. Av.', 'Baja', 502, 606, 'Samsung Electronics'),
(1368, 'Ebony', 'Fischer', 'Bryant', '743-6507 Aliquam St.', 'Activo', 503, 609, 'Cervezas Modelo'),
(1369, 'Herrod', 'Swanson', 'Turner', 'P.O. Box 859, 1754 Accumsan St.', 'Activo', 501, 605, 'Oxxo'),
(1370, 'Elizabeth', 'Greene', 'Witt', 'P.O. Box 102, 1046 Dis Avenue', 'Activo', 502, 606, 'Samsung Electronics'),
(1371, 'Todd', 'Marks', 'Ferrell', '5414 Natoque St.', 'Baja', 501, 603, 'Coca Cola'),
(1372, 'Sebastian', 'Odonnell', 'Daniel', 'Ap #714-4652 Luctus Rd.', 'Baja', 504, 613, 'Gatorade'),
(1373, 'Eliana', 'Nunez', 'Page', '1329 Diam Avenue', 'Baja', 501, 604, 'Estrella Azul'),
(1374, 'Charles', 'Newman', 'Austin', '8191 Mi, Road', 'Activo', 502, 607, 'Samsung SDI'),
(1375, 'Brett', 'Rutledge', 'Booth', 'Ap #197-4310 Ut Rd.', 'Activo', 501, 604, 'Estrella Azul'),
(1376, 'Raymond', 'Peters', 'Cobb', '523-7551 Nunc Ave', 'Activo', 503, 611, 'Procemex'),
(1377, 'Elton', 'Cotton', 'Garcia', 'P.O. Box 296, 5091 Sodales St.', 'Cortado', 503, 611, 'Procemex'),
(1378, 'Rose', 'Schneider', 'Hensley', 'P.O. Box 990, 427 Integer Rd.', 'Cortado', 500, 600, 'Chevrolet'),
(1379, 'Adara', 'Mooney', 'Hancock', '4432 Et Avenue', 'Cortado', 500, 600, 'Chevrolet'),
(1380, 'Ria', 'Butler', 'Baldwin', 'Ap #516-5200 Volutpat St.', 'Activo', 503, 611, 'Procemex'),
(1381, 'Kirsten', 'Mclaughlin', 'Sampson', '884-8316 Nulla St.', 'Cortado', 501, 603, 'Coca Cola'),
(1382, 'Hanae', 'Frederick', 'Rosario', '673-8567 Eget Road', 'Cortado', 501, 604, 'Estrella Azul'),
(1383, 'Dale', 'Lloyd', 'Burgess', 'P.O. Box 183, 1789 Eu, Road', 'Cortado', 502, 608, 'Samsung Engineering'),
(1384, 'Shannon', 'Norris', 'Rowland', 'Ap #346-9009 Eu, Rd.', 'Baja', 504, 613, 'Gatorade'),
(1385, 'Gavin', 'Richards', 'Mayo', 'Ap #539-8171 Tellus St.', 'Cortado', 504, 612, 'Sabritas'),
(1386, 'Hedley', 'Garcia', 'Bentley', 'Ap #287-3434 Libero Av.', 'Cortado', 501, 605, 'Oxxo'),
(1387, 'Dorian', 'Kline', 'Byrd', 'P.O. Box 245, 1860 Nisl St.', 'Activo', 504, 614, 'Desconocido'),
(1388, 'Karleigh', 'Carlson', 'Pittman', '529-7276 Sapien. Ave', 'Activo', 500, 600, 'Chevrolet'),
(1389, 'Reagan', 'Gray', 'Leonard', '6155 Urna. Rd.', 'Cortado', 503, 610, 'Extra'),
(1390, 'Alika', 'Marquez', 'Griffith', 'P.O. Box 107, 8710 Mollis Rd.', 'Activo', 501, 604, 'Estrella Azul'),
(1391, 'Amelia', 'Mueller', 'Sampson', '320-1308 Ante Street', 'Activo', 503, 611, 'Procemex'),
(1392, 'Nyssa', 'Bullock', 'Compton', '4223 Cursus Ave', 'Activo', 504, 613, 'Gatorade'),
(1393, 'Kane', 'Bolton', 'Prince', '840 Vestibulum Avenue', 'Cortado', 502, 607, 'Samsung SDI'),
(1394, 'Melissa', 'Higgins', 'Norris', 'Ap #907-3657 Nunc Av.', 'Activo', 504, 613, 'Gatorade'),
(1395, 'Gabriel', 'Wilkerson', 'Mercado', '6817 Ut Ave', 'Baja', 503, 610, 'Extra'),
(1396, 'Cruz', 'Maxwell', 'Clarke', '149-878 Scelerisque, St.', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1397, 'Sonia', 'Pearson', 'Reese', 'Ap #762-4689 Leo. Road', 'Baja', 504, 612, 'Sabritas'),
(1398, 'Keiko', 'Ashley', 'Mcclure', 'Ap #684-7646 Lectus Rd.', 'Baja', 503, 611, 'Procemex'),
(1399, 'Neve', 'Gallegos', 'Osborne', 'P.O. Box 533, 8180 Justo Ave', 'Activo', 500, 601, 'Opel'),
(1400, 'Ivy', 'Mays', 'Marshall', '975-4433 Ut Rd.', 'Cortado', 500, 601, 'Opel'),
(1401, 'Rahim', 'Dale', 'Collins', 'P.O. Box 551, 6537 Mus. Rd.', 'Activo', 501, 604, 'Estrella Azul'),
(1402, 'Logan', 'Potter', 'Cabrera', 'Ap #152-9415 Et Street', 'Cortado', 500, 602, 'GMC'),
(1403, 'Joy', 'Shields', 'Grant', 'P.O. Box 961, 2416 Varius Street', 'Activo', 500, 601, 'Opel'),
(1404, 'Camille', 'Day', 'Hurst', '499-7699 Ut Rd.', 'Baja', 503, 611, 'Procemex'),
(1405, 'Brett', 'Herman', 'Mullen', 'Ap #267-9401 Ac St.', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1406, 'Akeem', 'Mcleod', 'Rodriguez', '293-8000 Libero St.', 'Activo', 503, 610, 'Extra'),
(1407, 'Cally', 'Bright', 'Watkins', '1171 Eu Rd.', 'Baja', 504, 614, 'Desconocido'),
(1408, 'August', 'Chen', 'Zamora', 'P.O. Box 532, 467 Adipiscing Rd.', 'Activo', 500, 600, 'Chevrolet'),
(1409, 'Beverly', 'Olsen', 'May', 'P.O. Box 430, 8010 Magna. St.', 'Baja', 503, 610, 'Extra'),
(1410, 'Fiona', 'Woodward', 'Carson', '404-3484 Tristique Road', 'Baja', 504, 612, 'Sabritas'),
(1411, 'Leilani', 'Clemons', 'Bird', '867-548 Blandit Ave', 'Cortado', 503, 611, 'Procemex'),
(1412, 'Malachi', 'Wall', 'Burton', '639-6764 Nulla. Rd.', 'Activo', 501, 604, 'Estrella Azul'),
(1413, 'Forrest', 'Allen', 'Howell', '782-5088 Fringilla, Av.', 'Activo', 500, 602, 'GMC'),
(1414, 'Declan', 'Arnold', 'Cohen', '3748 Donec Ave', 'Baja', 500, 601, 'Opel'),
(1415, 'Martin', 'Crosby', 'Brock', '2484 Mus. St.', 'Activo', 500, 601, 'Opel'),
(1416, 'Denton', 'Spence', 'Thornton', 'P.O. Box 413, 1688 Libero Av.', 'Cortado', 501, 604, 'Estrella Azul'),
(1417, 'Carla', 'Chen', 'Blankenship', '765-8365 Tincidunt Rd.', 'Activo', 503, 611, 'Procemex'),
(1418, 'Martena', 'Mcgowan', 'Neal', '1763 Enim. St.', 'Baja', 502, 608, 'Samsung Engineering'),
(1419, 'Conan', 'Gibbs', 'Vazquez', 'P.O. Box 533, 2123 Cras Avenue', 'Cortado', 503, 610, 'Extra'),
(1420, 'Tashya', 'Gallegos', 'Oconnor', '4890 Non Ave', 'Activo', 500, 601, 'Opel'),
(1421, 'Katell', 'Morris', 'Cooper', 'P.O. Box 354, 1262 Dolor. Rd.', 'Cortado', 501, 604, 'Estrella Azul'),
(1422, 'Mary', 'Rowland', 'Atkins', '4832 Duis St.', 'Cortado', 504, 613, 'Gatorade'),
(1423, 'Darryl', 'Moore', 'Bonner', '987-2369 Amet Road', 'Baja', 502, 608, 'Samsung Engineering'),
(1424, 'Ashely', 'Callahan', 'Ward', 'Ap #190-7698 Neque St.', 'Activo', 502, 608, 'Samsung Engineering'),
(1425, 'Raphael', 'Mcintyre', 'Neal', '2578 Eget Road', 'Cortado', 503, 611, 'Procemex'),
(1426, 'Wyoming', 'Valentine', 'Knight', '9511 Ante Av.', 'Cortado', 503, 609, 'Cervezas Modelo'),
(1427, 'Veda', 'Sexton', 'Osborn', 'P.O. Box 122, 6166 Diam. Rd.', 'Cortado', 502, 607, 'Samsung SDI'),
(1428, 'Aidan', 'Head', 'Gentry', 'P.O. Box 565, 3323 Augue St.', 'Baja', 502, 606, 'Samsung Electronics'),
(1429, 'Sade', 'Beach', 'Carr', '3140 Odio Road', 'Cortado', 503, 611, 'Procemex'),
(1430, 'Alexander', 'Rice', 'Levine', 'Ap #153-8131 Nisl. Rd.', 'Baja', 502, 607, 'Samsung SDI'),
(1431, 'Emery', 'Morse', 'Lamb', 'Ap #467-1922 Vitae Av.', 'Baja', 502, 607, 'Samsung SDI'),
(1432, 'Jerry', 'Rogers', 'Peterson', 'Ap #252-9418 In Road', 'Baja', 501, 605, 'Oxxo'),
(1433, 'Farrah', 'Craft', 'Fitzgerald', 'P.O. Box 451, 4773 In Road', 'Cortado', 503, 610, 'Extra'),
(1434, 'Maya', 'Jackson', 'Harmon', '3501 Eu Av.', 'Baja', 500, 601, 'Opel'),
(1435, 'Herrod', 'Combs', 'Boyd', 'P.O. Box 393, 8429 In, Ave', 'Baja', 504, 613, 'Gatorade'),
(1436, 'Miranda', 'Pickett', 'Fields', '877-8781 Id St.', 'Baja', 501, 604, 'Estrella Azul'),
(1437, 'Shelby', 'Bailey', 'Dominguez', '9408 Nascetur Avenue', 'Activo', 503, 609, 'Cervezas Modelo'),
(1438, 'Libby', 'Alston', 'Ashley', '799-4583 Pede. Avenue', 'Baja', 501, 605, 'Oxxo'),
(1439, 'Trevor', 'Prince', 'Dale', '2108 Lacinia Road', 'Cortado', 500, 601, 'Opel'),
(1440, 'Nola', 'Bishop', 'Wilkerson', 'P.O. Box 988, 9434 Id Avenue', 'Activo', 501, 604, 'Estrella Azul'),
(1441, 'Renee', 'Burt', 'Mcneil', 'Ap #351-1333 Vehicula Road', 'Baja', 501, 605, 'Oxxo'),
(1442, 'Timothy', 'Harrington', 'Wilson', 'P.O. Box 259, 3765 Congue, Ave', 'Baja', 501, 604, 'Estrella Azul'),
(1443, 'Dalton', 'Cotton', 'Mendoza', '188-7453 Varius. Rd.', 'Activo', 501, 603, 'Coca Cola'),
(1444, 'Jack', 'Pennington', 'Powell', '3283 Est, Street', 'Cortado', 500, 601, 'Opel'),
(1445, 'Samuel', 'Williamson', 'Rose', 'Ap #303-573 Magna, Av.', 'Cortado', 503, 611, 'Procemex'),
(1446, 'Chase', 'Hart', 'Schroeder', '648-809 Porttitor Road', 'Cortado', 501, 604, 'Estrella Azul'),
(1447, 'Xandra', 'Hodges', 'Whitley', 'P.O. Box 758, 693 In Av.', 'Baja', 501, 604, 'Estrella Azul'),
(1448, 'Gisela', 'Conley', 'Bell', '213-8960 Fermentum Rd.', 'Baja', 501, 603, 'Coca Cola'),
(1449, 'Isabella', 'Shields', 'Boyer', 'Ap #420-269 Pharetra. St.', 'Cortado', 504, 614, 'Desconocido'),
(1450, 'Shay', 'Rowland', 'Perry', 'P.O. Box 816, 4936 Fames Av.', 'Baja', 503, 610, 'Extra'),
(1451, 'Mark', 'Franklin', 'Taylor', 'P.O. Box 356, 4111 Sit Street', 'Cortado', 502, 607, 'Samsung SDI'),
(1452, 'Uriel', 'Velez', 'Snow', '6059 Interdum. Rd.', 'Baja', 500, 602, 'GMC'),
(1453, 'Fatima', 'Welch', 'Clemons', '3908 Dolor. Street', 'Cortado', 504, 613, 'Gatorade'),
(1454, 'Rajah', 'Patton', 'Thornton', '678 Quam. Rd.', 'Activo', 504, 614, 'Desconocido'),
(1455, 'Mark', 'Blackburn', 'Horn', 'P.O. Box 892, 6859 Magna. Road', 'Activo', 500, 602, 'GMC'),
(1456, 'Griffin', 'Christian', 'Harper', '920-5154 Vulputate Ave', 'Activo', 502, 608, 'Samsung Engineering'),
(1457, 'Josiah', 'Henry', 'Rodgers', 'P.O. Box 768, 6260 A Av.', 'Activo', 501, 605, 'Oxxo'),
(1458, 'Indigo', 'Ortiz', 'Williams', 'Ap #165-7255 Scelerisque, Rd.', 'Activo', 504, 614, 'Desconocido'),
(1459, 'Lunea', 'Barton', 'Mason', 'P.O. Box 704, 3603 Vestibulum St.', 'Activo', 501, 605, 'Oxxo'),
(1460, 'Fallon', 'Huff', 'Becker', 'Ap #821-6662 Sed Av.', 'Cortado', 500, 601, 'Opel'),
(1461, 'Hayley', 'Haley', 'Mcpherson', 'Ap #646-4731 Dolor. Rd.', 'Activo', 502, 606, 'Samsung Electronics'),
(1462, 'Orlando', 'French', 'Robertson', '967-2117 Neque. Avenue', 'Cortado', 503, 610, 'Extra'),
(1463, 'Giacomo', 'Bishop', 'Foreman', 'P.O. Box 126, 1937 Lorem Rd.', 'Baja', 504, 613, 'Gatorade'),
(1464, 'Len', 'Nicholson', 'Strong', 'Ap #509-7094 Malesuada St.', 'Baja', 502, 608, 'Samsung Engineering'),
(1465, 'Drake', 'Orr', 'Forbes', '6572 Ornare Ave', 'Activo', 500, 601, 'Opel'),
(1466, 'Heidi', 'Jarvis', 'Hooper', 'P.O. Box 321, 180 Sit Rd.', 'Activo', 501, 604, 'Estrella Azul'),
(1467, 'Leslie', 'Thornton', 'Hudson', 'P.O. Box 814, 8253 Scelerisque Ave', 'Baja', 500, 602, 'GMC'),
(1468, 'Paul', 'Rivera', 'Brennan', 'Ap #340-8629 Dui. Rd.', 'Cortado', 500, 600, 'Chevrolet'),
(1469, 'Paul', 'Peck', 'Frye', '215-8197 Sit Road', 'Activo', 501, 604, 'Estrella Azul'),
(1470, 'Quon', 'Reeves', 'Mills', '1057 Phasellus Rd.', 'Activo', 502, 606, 'Samsung Electronics'),
(1471, 'Blaine', 'Atkinson', 'Garza', '2518 Nec Avenue', 'Baja', 502, 606, 'Samsung Electronics'),
(1472, 'Aiko', 'Allison', 'Watts', '995-9219 Interdum Rd.', 'Cortado', 500, 601, 'Opel'),
(1473, 'Kibo', 'Frost', 'Baird', '730-3216 Arcu Road', 'Cortado', 500, 602, 'GMC'),
(1474, 'Ira', 'Cline', 'Henderson', 'P.O. Box 192, 6469 Dictum Rd.', 'Cortado', 502, 607, 'Samsung SDI'),
(1475, 'Aquila', 'Boyd', 'Mcfarland', 'P.O. Box 658, 3229 Enim. Rd.', 'Baja', 501, 605, 'Oxxo'),
(1476, 'Ariel', 'Knowles', 'Howard', 'Ap #895-8649 Sociis Road', 'Cortado', 501, 603, 'Coca Cola'),
(1477, 'Stewart', 'Castillo', 'Holt', 'P.O. Box 988, 5304 Ac Ave', 'Baja', 500, 600, 'Chevrolet'),
(1478, 'Elvis', 'Stokes', 'Rodriquez', '905-4570 Aliquet. Street', 'Baja', 501, 605, 'Oxxo'),
(1479, 'Venus', 'Parks', 'Quinn', '9210 Donec Av.', 'Baja', 501, 603, 'Coca Cola'),
(1480, 'Paloma', 'Randolph', 'Galloway', 'Ap #797-1376 Adipiscing Avenue', 'Cortado', 502, 606, 'Samsung Electronics'),
(1481, 'Hall', 'Howell', 'Tillman', 'Ap #300-1235 Eu, St.', 'Activo', 503, 611, 'Procemex'),
(1482, 'Travis', 'Sanford', 'Riddle', '353 Ac Rd.', 'Baja', 502, 606, 'Samsung Electronics'),
(1483, 'Lunea', 'Terrell', 'Cole', '490-2607 Consectetuer Street', 'Cortado', 503, 611, 'Procemex'),
(1484, 'Teegan', 'Harrell', 'Schultz', '9214 Quis St.', 'Baja', 501, 604, 'Estrella Azul'),
(1485, 'Mallory', 'Stein', 'Bryan', '3688 Donec St.', 'Cortado', 500, 600, 'Chevrolet'),
(1486, 'Julie', 'Velazquez', 'Hewitt', '9974 Diam. St.', 'Cortado', 504, 613, 'Gatorade'),
(1487, 'Colby', 'Carver', 'Aguilar', 'P.O. Box 175, 1722 Non Avenue', 'Cortado', 503, 611, 'Procemex'),
(1488, 'Cooper', 'Valentine', 'Mcpherson', 'P.O. Box 759, 2117 In Ave', 'Baja', 503, 611, 'Procemex'),
(1489, 'Odysseus', 'Stephenson', 'Stanley', '525-7290 Lorem Avenue', 'Baja', 501, 605, 'Oxxo'),
(1490, 'Karen', 'Oconnor', 'Marks', '6697 Hendrerit. Road', 'Activo', 503, 611, 'Procemex'),
(1491, 'Molly', 'Chapman', 'Nunez', '5878 Libero Av.', 'Baja', 502, 606, 'Samsung Electronics'),
(1492, 'Keith', 'Snow', 'Wong', 'Ap #452-9723 Suspendisse Av.', 'Activo', 500, 600, 'Chevrolet'),
(1493, 'Ryan', 'Barker', 'Conner', 'Ap #738-7529 Libero Ave', 'Activo', 504, 612, 'Sabritas'),
(1494, 'Ivy', 'Valencia', 'Zimmerman', '507-8376 Convallis St.', 'Activo', 501, 605, 'Oxxo'),
(1495, 'Hillary', 'Evans', 'Fernandez', '9317 Lectus Rd.', 'Cortado', 501, 605, 'Oxxo'),
(1496, 'Noble', 'Potts', 'Fernandez', '310-390 Est, Street', 'Cortado', 504, 613, 'Gatorade'),
(1497, 'Gwendolyn', 'Clemons', 'Rutledge', '608-6441 Tincidunt Ave', 'Cortado', 500, 602, 'GMC'),
(1498, 'Lunea', 'Turner', 'French', 'P.O. Box 624, 1737 Nec, Avenue', 'Baja', 501, 604, 'Estrella Azul'),
(1499, 'Abbot', 'Hopper', 'Camacho', '8224 Volutpat. Street', 'Baja', 503, 611, 'Procemex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comercio`
--

CREATE TABLE `Comercio` (
  `IDCOMERCIO` int(11) NOT NULL,
  `NombreComercial` varchar(255) NOT NULL,
  `IdEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Comercio`
--

INSERT INTO `Comercio` (`IDCOMERCIO`, `NombreComercial`, `IdEmpresa`) VALUES
(600, 'Chevrolet', 500),
(601, 'Opel', 500),
(602, 'GMC', 500),
(603, 'Coca Cola', 501),
(604, 'Estrella Azul', 501),
(605, 'Oxxo', 501),
(606, 'Samsung Electronics', 502),
(607, 'Sammsung SDI', 502),
(608, 'Samsung Engineering', 502),
(609, 'Cervezas Modelo', 503),
(610, 'Extra', 503),
(611, 'Procermex', 503),
(612, 'Sabritas', 504),
(613, 'Gatorade', 504),
(614, 'Gamesa', 504);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empresa`
--

CREATE TABLE `Empresa` (
  `IDEMPRESA` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `RFC` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Empresa`
--

INSERT INTO `Empresa` (`IDEMPRESA`, `Nombre`, `RFC`) VALUES
(10, 'ITM', 'TECN-2018-ISC'),
(11, 'CRONIC', 'CRON-7854-CEL'),
(15, 'AVG', 'AVAG-6759-HBHB'),
(18, 'TEC', 'AAAA-123456-ACB'),
(500, 'General Motors', 'SWHN-4975-QZB'),
(501, 'FEMSA', 'VXBT-2644-BTL'),
(502, 'Samsung', 'ZKRY-3532-LBY'),
(503, 'Modelo', 'SQVS-7747-GWK'),
(504, 'PEPSICO', 'SPKH-3982-BYD');

--
-- Disparadores `Empresa`
--
DELIMITER $$
CREATE TRIGGER `triger_delete_movimientos_empresa` BEFORE DELETE ON `Empresa` FOR EACH ROW INSERT INTO Movimientos_Empresa(Fecha, Usuario, Accion) VALUES (NOW(), USER(), 'DELETE')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `triger_update_movimientos_empresa` AFTER UPDATE ON `Empresa` FOR EACH ROW INSERT INTO Movimientos_Empresa(Fecha, Usuario, Accion) VALUES (NOW(), USER(), 'UPDATE')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_insert_mov_empresa` AFTER INSERT ON `Empresa` FOR EACH ROW INSERT INTO Movimientos_Empresa(Fecha, Usuario, Accion) VALUES (NOW(), USER(), 'INSERT')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Equipo`
--

CREATE TABLE `Equipo` (
  `NoSERIE` int(11) NOT NULL,
  `DireccionMAC` varchar(17) NOT NULL,
  `Modelo` varchar(255) NOT NULL,
  `EstadoFun` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Equipo`
--

INSERT INTO `Equipo` (`NoSERIE`, `DireccionMAC`, `Modelo`, `EstadoFun`) VALUES
(100600, 'b6:15:9d:3d:e5:46', 'D1Y 2X4', 'Funcional'),
(100601, '7a:f5:61:0c:fa:d7', 'M1X 1K2', 'Funcional'),
(100602, '6c:65:e8:0e:67:98', 'Z9Z 8C8', 'Funcional'),
(100603, 'c1:12:a4:52:bc:e8', 'T2K 9X9', 'Danado'),
(100604, 'f2:83:45:b8:85:12', 'Q6I 2I9', 'Danado'),
(100605, 'f6:5e:f4:d3:7c:d5', 'P3X 3D3', 'Funcional'),
(100606, 'fa:d5:13:9c:20:23', 'R9P 5Z7', 'Funcional'),
(100607, '3d:3a:bf:a1:d6:bb', 'S0N 8K5', 'Danado'),
(100608, 'ae:a4:c9:e3:e5:35', 'E2S 2W6', 'Funcional'),
(100609, '2b:d9:b2:4e:27:b3', 'G0F 0A2', 'Danado'),
(100610, '6e:86:17:4a:2b:3a', 'X1M 5I2', 'Funcional'),
(100611, 'd3:55:e3:1d:05:83', 'G8B 3J8', 'Funcional'),
(100612, '87:5e:de:2a:a2:64', 'P1J 6E1', 'Funcional'),
(100613, '1b:2c:ef:6c:69:48', 'E1R 3D0', 'Funcional'),
(100614, '4c:2f:5d:21:36:bc', 'F8C 8Q2', 'Danado'),
(100615, '46:59:65:c8:3b:d6', 'A4U 1C1', 'Funcional'),
(100616, '13:c0:0b:2e:09:0d', 'M4F 3I1', 'Funcional'),
(100617, '7e:3f:e8:1c:af:1e', 'C8S 6S8', 'Funcional'),
(100618, '03:2e:20:22:0c:86', 'Q1D 9X7', 'Danado'),
(100619, '3e:4c:d6:35:dd:2a', 'G3Z 8H6', 'Funcional'),
(100620, '97:07:ea:1f:18:3f', 'L5E 1Z1', 'Danado'),
(100621, '2b:8d:57:d8:97:19', 'Z0J 9M1', 'Danado'),
(100622, '72:52:6c:1c:6a:24', 'G9S 0F4', 'Danado'),
(100623, '50:21:1d:69:ec:4e', 'S4C 5A5', 'Danado'),
(100624, '08:91:9a:0e:0c:5d', 'V2J 7V2', 'Funcional'),
(100625, '41:d4:cb:bb:87:cc', 'B0P 2Z7', 'Funcional'),
(100626, '89:d5:c8:dc:a1:27', 'B8V 3G9', 'Danado'),
(100627, '3d:ca:dd:ca:9b:c0', 'A0Z 4I3', 'Danado'),
(100628, 'f3:1e:06:0e:81:20', 'S1A 5Y3', 'Funcional'),
(100629, 'd2:a5:ba:49:81:17', 'K7U 7K8', 'Funcional'),
(100630, '52:4f:4f:6d:69:89', 'I0N 8Y7', 'Danado'),
(100631, 'c2:d2:95:7d:c6:72', 'A0B 8A9', 'Danado'),
(100632, 'cd:02:a0:0e:05:18', 'Q7W 5T9', 'Funcional'),
(100633, '27:01:a2:4b:84:9c', 'O7C 2T9', 'Funcional'),
(100634, '1c:59:dc:9f:4a:93', 'E9X 5C9', 'Danado'),
(100635, '2e:7e:ef:56:ba:bc', 'E1C 2G9', 'Danado'),
(100636, '4f:5b:01:df:d1:a6', 'U2F 9N5', 'Danado'),
(100637, '97:e5:79:3f:d7:4b', 'K8E 6B5', 'Funcional'),
(100638, '87:f8:3b:0b:21:40', 'G8P 3M5', 'Danado'),
(100639, '9b:7f:f9:4b:ba:98', 'F2W 7F7', 'Funcional'),
(100640, '60:92:47:8c:29:cf', 'V8P 4S6', 'Funcional'),
(100641, 'bf:50:ea:08:2d:0e', 'C7S 2F3', 'Danado'),
(100642, '02:60:3b:b6:c7:04', 'Y3Y 5M2', 'Funcional'),
(100643, 'd5:9c:5a:3d:c9:93', 'A9G 5J5', 'Danado'),
(100644, '22:1e:dd:0c:29:1b', 'L8B 6L7', 'Danado'),
(100645, '50:a5:7f:7c:9b:22', 'B1Q 9V0', 'Danado'),
(100646, '98:1c:f5:0c:44:1b', 'P3J 1A9', 'Danado'),
(100647, '05:87:08:71:8d:1a', 'H5D 4V4', 'Danado'),
(100648, '4a:8d:9d:14:96:04', 'B4M 6T7', 'Funcional'),
(100649, '07:d5:e6:a2:a5:b5', 'B1A 3P0', 'Funcional'),
(100650, 'e8:9a:90:38:f1:5d', 'N1T 1W9', 'Danado'),
(100651, '2d:22:ce:21:d7:b2', 'A3P 6O2', 'Danado'),
(100652, '62:45:87:1c:d9:d1', 'K4O 3A5', 'Danado'),
(100653, 'e2:40:c5:b7:25:8c', 'T8P 5L6', 'Danado'),
(100654, '2b:96:34:65:a0:29', 'S7Z 6B5', 'Danado'),
(100655, '84:4c:35:b0:25:59', 'E5W 7R0', 'Danado'),
(100656, 'd2:13:bc:3d:ed:f4', 'K8W 0L1', 'Danado'),
(100657, 'da:d9:67:96:42:86', 'P5L 1B6', 'Danado'),
(100658, '95:39:1d:30:cd:e3', 'U0V 4V2', 'Funcional'),
(100659, '77:6f:28:c9:92:2b', 'H6Y 1D2', 'Danado'),
(100660, 'd0:e2:c0:09:af:d9', 'O6I 5L2', 'Danado'),
(100661, '99:a2:77:bd:02:2b', 'J2O 4F5', 'Danado'),
(100662, '7e:ac:cd:f9:71:fe', 'E7R 4Y9', 'Danado'),
(100663, '76:89:77:98:c5:49', 'G1P 5K5', 'Funcional'),
(100664, '2d:a2:a1:1e:f2:fc', 'V3G 8T7', 'Danado'),
(100665, 'ab:26:20:ae:32:06', 'E2P 9O3', 'Danado'),
(100666, '60:0f:3f:18:19:19', 'U7P 0J3', 'Danado'),
(100667, '79:93:78:1a:a2:65', 'W2L 9K5', 'Danado'),
(100668, '36:28:7b:da:24:f7', 'L7M 2Y1', 'Funcional'),
(100669, '2e:7f:17:d9:1a:1d', 'L2S 9C8', 'Danado'),
(100670, '5a:2d:d5:19:85:e4', 'U7R 7A8', 'Danado'),
(100671, '0a:84:56:10:71:12', 'Q1I 6P8', 'Funcional'),
(100672, 'a4:ef:aa:83:06:21', 'F4Z 2Y4', 'Danado'),
(100673, '04:ca:9b:ca:2c:90', 'R1A 1J1', 'Danado'),
(100674, '2a:e2:a3:75:bf:f8', 'Y2N 3M4', 'Danado'),
(100675, '7f:8a:0e:ad:97:44', 'D0K 0L8', 'Danado'),
(100676, '05:59:49:94:00:19', 'Q8C 6Y0', 'Danado'),
(100677, '65:8d:0d:43:81:ed', 'F8J 9E5', 'Funcional'),
(100678, 'dd:9c:fc:be:08:29', 'Z5J 1R1', 'Funcional'),
(100679, 'df:67:3d:8e:28:61', 'E8W 0L2', 'Danado'),
(100680, '0d:ce:82:85:f8:90', 'Q6K 0W3', 'Funcional'),
(100681, 'd7:59:45:35:88:cf', 'U5S 3P7', 'Funcional'),
(100682, '20:05:94:1e:39:3e', 'C2Y 4N2', 'Funcional'),
(100683, 'f0:25:8c:43:af:3c', 'M8P 7O9', 'Funcional'),
(100684, '66:46:c0:3c:76:fb', 'X3G 6F3', 'Danado'),
(100685, '45:bc:2a:db:ac:e8', 'W2V 0S3', 'Funcional'),
(100686, 'a7:f1:5e:c1:82:aa', 'A3L 3A5', 'Funcional'),
(100687, '5e:5d:4e:1f:96:20', 'G6C 7F2', 'Danado'),
(100688, '7f:1f:46:be:b6:44', 'B3T 3M4', 'Funcional'),
(100689, '0d:15:34:8c:be:a9', 'M5V 5K0', 'Funcional'),
(100690, 'a4:67:30:15:0f:75', 'Y8S 3S6', 'Danado'),
(100691, 'b5:50:95:d5:80:98', 'J2E 2U0', 'Danado'),
(100692, 'b6:04:28:86:a2:84', 'B8P 6W0', 'Funcional'),
(100693, '70:89:b1:c3:8e:d9', 'S9N 4U7', 'Danado'),
(100694, '4c:db:bd:15:c5:ae', 'K8Q 4K5', 'Danado'),
(100695, '1a:5f:93:8f:f6:df', 'Z3I 8C8', 'Danado'),
(100696, 'c0:72:e4:df:a6:ae', 'T8E 8K3', 'Funcional'),
(100697, 'ec:ba:2d:b7:a0:58', 'I9M 2V0', 'Danado'),
(100698, 'c1:4e:0e:14:73:f6', 'A4Q 4Z8', 'Funcional'),
(100699, '9d:00:47:74:fe:70', 'J4Q 3B6', 'Funcional'),
(100700, '81:04:eb:0d:a1:35', 'C3A 3K', 'Funcional'),
(100701, '8b:0b:c3:1f:91:1e', 'V7F 4L', 'Danado'),
(100702, 'ca:a4:07:ef:0f:d8', 'P3I 1D', 'Funcional'),
(100703, '13:54:b5:a8:39:5d', 'V2D 8Z', 'Funcional'),
(100704, 'de:5d:9f:cc:b0:81', 'O4I 6P', 'Funcional'),
(100705, '72:44:81:cf:b9:8f', 'S9I 3M', 'Danado'),
(100706, 'ed:26:fd:b5:4f:f4', 'Y5P 2B', 'Funcional'),
(100707, 'cf:54:18:be:9a:a7', 'V2C 5A', 'Funcional'),
(100708, '09:20:4b:af:6d:ce', 'N4T 0U', 'Funcional'),
(100709, '69:ca:ee:77:17:06', 'E3K 7N', 'Funcional'),
(100710, '41:e1:6a:77:10:fc', 'M5G 8B', 'Danado'),
(100711, 'ed:f9:61:01:e3:47', 'F4K 2R', 'Funcional'),
(100712, '04:5c:56:44:53:8a', 'H4J 1N', 'Funcional'),
(100713, '7e:ae:05:cd:35:f7', 'P8R 6P', 'Funcional'),
(100714, 'b2:98:27:81:b5:51', 'H1A 0X', 'Danado'),
(100715, '0b:60:d6:62:c2:dc', 'G7S 3R', 'Danado'),
(100716, '29:b8:18:19:c3:8a', 'C6R 0R', 'Funcional'),
(100717, '34:c3:59:75:fe:c1', 'F6L 4T', 'Danado'),
(100718, '45:cb:34:2c:6d:05', 'U4F 0N', 'Danado'),
(100719, '84:c3:34:d8:58:a5', 'Y2M 8N', 'Funcional'),
(100720, '5e:e1:f6:e4:96:27', 'C9E 5S', 'Funcional'),
(100721, '6f:1f:6a:13:b7:96', 'V2U 5X', 'Danado'),
(100722, '16:65:4c:68:d8:7c', 'J1P 2H', 'Funcional'),
(100723, 'd6:28:b3:01:92:4a', 'L0K 0G', 'Funcional'),
(100724, '23:6b:18:f4:8a:f3', 'R1X 9O', 'Danado'),
(100725, 'be:f2:a2:63:d3:92', 'K9O 0N', 'Danado'),
(100726, 'b3:d1:4b:c5:d2:45', 'I3Y 0D', 'Danado'),
(100727, '6a:00:96:8c:a0:9e', 'E3U 3X', 'Danado'),
(100728, '7f:a5:b4:48:85:77', 'H5I 2F', 'Funcional'),
(100729, 'a3:f2:19:7c:de:59', 'U3J 5O', 'Funcional'),
(100730, 'fc:28:e1:4b:3c:81', 'J9V 2Q', 'Danado'),
(100731, '1e:fc:07:7b:1d:7f', 'K8N 7C', 'Funcional'),
(100732, '1b:bd:a8:40:5d:86', 'O0Q 1S', 'Funcional'),
(100733, '07:d7:80:5a:4e:96', 'X9X 9K', 'Funcional'),
(100734, '44:33:db:d4:ee:b0', 'B2I 2T', 'Danado'),
(100735, 'e1:20:1b:3c:54:31', 'B4F 7R', 'Funcional'),
(100736, '6e:fd:7a:68:f5:5d', 'M2J 3U', 'Funcional'),
(100737, '47:af:30:0c:1e:dd', 'H8O 4I', 'Danado'),
(100738, 'fa:08:3a:4f:bf:08', 'M8T 4K', 'Danado'),
(100739, '73:c2:6b:6c:14:eb', 'W4T 1V', 'Funcional'),
(100740, '53:27:66:60:04:ef', 'Z9O 5R', 'Danado'),
(100741, 'ea:86:84:0e:b2:d7', 'T1C 9J', 'Funcional'),
(100742, 'bc:10:fe:33:8a:3d', 'D2J 4L', 'Funcional'),
(100743, '7d:7a:fd:29:e6:8d', 'J0Z 2M', 'Danado'),
(100744, '22:27:e0:c6:5c:fe', 'E8F 1R', 'Danado'),
(100745, '97:8e:99:08:f6:0a', 'J2G 9T', 'Danado'),
(100746, '40:1f:44:27:dd:c8', 'X3F 3A', 'Funcional'),
(100747, 'bc:c9:da:28:d5:8a', 'G7B 1G', 'Funcional'),
(100748, 'f6:3d:9d:7d:3f:b3', 'M3Z 7A', 'Danado'),
(100749, 'be:9d:06:0a:3a:25', 'V3T 7H', 'Funcional'),
(100750, '42:d2:64:64:72:df', 'T2F 6K', 'Danado'),
(100751, '66:6a:c3:70:61:03', 'U9U 2N', 'Funcional'),
(100752, 'ba:1d:7b:ec:6d:fd', 'G8X 6U', 'Danado'),
(100753, '5b:1e:d6:7d:1a:56', 'C9F 8P', 'Danado'),
(100754, '56:1f:ce:f5:41:13', 'C8M 4V', 'Danado'),
(100755, '61:bc:30:e0:44:ad', 'N4W 3S', 'Funcional'),
(100756, '37:85:fd:ae:94:aa', 'D5G 4D', 'Funcional'),
(100757, '62:50:07:52:b2:eb', 'R3C 5F', 'Funcional'),
(100758, '3b:6a:25:5b:87:f5', 'S5Y 1Z', 'Danado'),
(100759, 'a4:e9:fd:13:08:37', 'C9W 0R', 'Danado'),
(100760, '8e:ee:e8:d6:59:81', 'N6D 4F', 'Danado'),
(100761, '27:06:3a:c3:c8:c2', 'G2J 0N', 'Danado'),
(100762, 'd5:f8:05:e9:48:a0', 'A7S 7M', 'Funcional'),
(100763, '4f:8a:04:fd:dc:f6', 'U8I 0W', 'Funcional'),
(100764, '87:d1:fb:ef:a7:57', 'D4C 5K', 'Funcional'),
(100765, 'c3:83:df:b4:67:95', 'Z7X 9X', 'Funcional'),
(100766, '53:a7:af:38:e4:7a', 'E3D 2D', 'Funcional'),
(100767, '2c:5b:07:40:f8:d8', 'U4Y 0L', 'Danado'),
(100768, 'ea:f2:12:da:5f:46', 'S7L 8Y', 'Funcional'),
(100769, 'fa:d6:01:69:4c:77', 'N1Y 6J', 'Funcional'),
(100770, 'f0:fe:ef:bc:b0:a9', 'H8V 0T', 'Danado'),
(100771, '93:d4:9a:3b:32:33', 'G9U 0U', 'Funcional'),
(100772, 'c7:4c:ad:b8:51:de', 'O4N 3G', 'Funcional'),
(100773, '7b:22:3a:87:be:01', 'C6K 9A', 'Funcional'),
(100774, 'c3:2f:9c:67:fa:c1', 'B7I 3P', 'Funcional'),
(100775, 'db:fd:6a:62:53:65', 'K1F 3O', 'Funcional'),
(100776, '6c:f4:9f:87:49:19', 'C0B 4M', 'Funcional'),
(100777, '9f:51:b0:94:6b:56', 'N3P 7A', 'Funcional'),
(100778, '35:95:d8:6f:5d:9e', 'K1X 6U', 'Funcional'),
(100779, '05:72:1b:c9:7b:d4', 'E2D 2O', 'Danado'),
(100780, '0a:b4:33:68:93:f5', 'L0V 2V', 'Funcional'),
(100781, '91:3e:cc:48:c8:cd', 'X8Z 9D', 'Funcional'),
(100782, '60:b0:3f:60:57:ac', 'C2H 0G', 'Funcional'),
(100783, '14:d5:75:7b:1c:3a', 'P4E 6Z', 'Funcional'),
(100784, '27:e2:26:d0:b2:da', 'G7A 8J', 'Funcional'),
(100785, 'c0:66:3e:84:8b:69', 'Z6C 0N', 'Danado'),
(100786, '90:8c:bf:53:6c:ec', 'P3C 3U', 'Funcional'),
(100787, '58:a4:2b:c5:15:77', 'B5C 5H', 'Funcional'),
(100788, 'd3:50:54:ac:d9:fb', 'I0X 9Y', 'Danado'),
(100789, '61:fd:32:ef:b1:16', 'J6U 9M', 'Danado'),
(100790, '94:8d:fb:a0:f7:90', 'B3K 8J', 'Funcional'),
(100791, '79:74:08:c8:12:71', 'O4Y 9F', 'Funcional'),
(100792, '95:80:0f:48:33:14', 'C2I 6A', 'Danado'),
(100793, '6e:47:ce:60:22:b4', 'S1G 9H', 'Funcional'),
(100794, '84:cc:a2:ca:82:bc', 'S0Y 0O', 'Funcional'),
(100795, 'a8:46:29:a5:99:54', 'D8C 2H', 'Funcional'),
(100796, '32:12:25:99:aa:e3', 'W9O 7S', 'Funcional'),
(100797, '75:72:d0:a8:27:d2', 'H5I 7F', 'Danado'),
(100798, '40:b8:96:15:84:49', 'N8V 8H', 'Funcional'),
(100799, '10:e9:b4:32:39:7b', 'Z4Z 0C', 'Danado'),
(100800, '1e:01:13:5b:3b:d6', 'X8D 5S6 K8N', 'Funcional'),
(100801, 'c0:ec:90:02:5e:2d', 'H8O 1C3 O1H', 'Danado'),
(100802, '3b:19:a8:3a:74:d9', 'K7C 7U1 X6U', 'Danado'),
(100803, 'c4:26:57:72:71:6d', 'R3F 2B7 B7O', 'Danado'),
(100804, '73:bb:28:f7:af:f9', 'O0B 6Q0 F6W', 'Funcional'),
(100805, '9c:98:89:d3:20:77', 'C8H 8D8 Q0U', 'Danado'),
(100806, '12:53:c5:9b:81:7f', 'P6B 7S5 O4M', 'Funcional'),
(100807, 'ed:7e:7b:1e:ca:35', 'H9T 8L8 Y8W', 'Danado'),
(100808, 'bc:ca:44:c6:e0:e3', 'S4B 1Z1 P6K', 'Danado'),
(100809, '70:63:87:8a:5d:13', 'G1A 6C4 U8Q', 'Danado'),
(100810, '92:99:a4:07:46:93', 'T8Z 9N0 T3I', 'Funcional'),
(100811, '6b:76:55:a2:e7:a8', 'A2M 7D1 E9X', 'Funcional'),
(100812, 'ae:23:c5:04:ea:98', 'W7F 1E9 L2V', 'Danado'),
(100813, '9e:43:0a:72:bd:a7', 'L3T 6U7 F8O', 'Danado'),
(100814, 'af:82:35:be:3a:05', 'X5F 6I1 D1S', 'Funcional'),
(100815, 'f0:4d:b0:b1:20:42', 'O2H 8R2 A9O', 'Danado'),
(100816, '4d:6f:aa:2c:8f:97', 'Y8K 4M4 S5C', 'Funcional'),
(100817, '22:d8:69:69:ba:55', 'N5M 3K8 N5Y', 'Funcional'),
(100818, 'd7:34:71:55:57:16', 'H7R 1P2 O1G', 'Danado'),
(100819, '2d:3b:aa:2c:69:d7', 'X8U 7N4 D3H', 'Danado'),
(100820, '12:e8:e6:ce:34:79', 'W9T 7F0 V3A', 'Funcional'),
(100821, '9e:72:d2:b6:87:f6', 'H9B 7V7 I4G', 'Danado'),
(100822, '86:f3:6a:a3:42:60', 'Q8P 4Y0 G5V', 'Danado'),
(100823, 'db:7f:bc:9b:09:bf', 'U1U 2E2 I2G', 'Danado'),
(100824, '3f:bd:4b:67:0c:7b', 'M9O 8B9 Q0U', 'Danado'),
(100825, '17:46:43:24:bf:1e', 'S2B 1I8 S9R', 'Funcional'),
(100826, '60:25:c4:84:d2:bc', 'I4H 2V3 K8Z', 'Funcional'),
(100827, 'bb:46:61:9e:8b:34', 'B7A 7B6 L2M', 'Funcional'),
(100828, 'd3:ab:83:d8:28:d2', 'O7D 8P0 V2H', 'Danado'),
(100829, '94:e2:79:c6:bd:c8', 'J8G 8M7 C5L', 'Funcional'),
(100830, 'cc:30:37:63:a9:1c', 'Q2Y 2C2 A4E', 'Danado'),
(100831, '50:e4:c0:79:f6:05', 'V2N 2P5 O2U', 'Danado'),
(100832, 'ce:38:0f:a1:a0:75', 'M7K 4U7 B9W', 'Funcional'),
(100833, '6e:a3:6b:17:c0:9b', 'H2D 4T0 V6L', 'Funcional'),
(100834, 'e5:8b:ba:bf:e9:40', 'O1D 3H8 R6O', 'Funcional'),
(100835, 'cc:4c:bf:03:59:1f', 'W4N 9Y5 O4C', 'Funcional'),
(100836, '76:7e:12:76:48:c6', 'E8H 2F6 E0N', 'Danado'),
(100837, 'fc:6e:6c:f8:aa:5e', 'S9W 2P1 Y5D', 'Danado'),
(100838, 'ac:4a:2e:5a:07:29', 'Q2G 2X9 Z1H', 'Danado'),
(100839, '33:75:3f:d7:c7:0b', 'L9F 6E8 B5U', 'Funcional'),
(100840, 'a5:d5:d3:e6:6c:38', 'J1P 9J2 K2X', 'Funcional'),
(100841, '88:45:93:9f:40:6f', 'L2U 9J8 C7P', 'Funcional'),
(100842, 'e7:9d:78:79:fd:bb', 'W4O 4Z3 M1Y', 'Funcional'),
(100843, '88:8e:71:bc:d0:66', 'J3Z 8C7 C2G', 'Danado'),
(100844, '99:af:b1:97:c1:0c', 'A1N 0Q4 Z7M', 'Danado'),
(100845, 'a1:db:d6:97:68:8b', 'O6Z 1T3 U3J', 'Danado'),
(100846, 'd6:23:5b:37:95:dd', 'S0C 3C6 I7S', 'Danado'),
(100847, '43:7d:f0:d4:99:b2', 'Y6H 8D4 Z3G', 'Danado'),
(100848, '50:46:28:71:48:f9', 'N1N 1D1 W5R', 'Funcional'),
(100849, 'e5:15:cd:92:7d:72', 'R1D 5W5 P7E', 'Danado'),
(100850, '29:72:19:4c:47:42', 'V9E 6U0 D0K', 'Funcional'),
(100851, '3a:48:f1:7f:06:70', 'N8N 0A3 M1A', 'Danado'),
(100852, '57:8b:0e:64:2d:83', 'L4Y 7V9 F9M', 'Funcional'),
(100853, 'bc:4c:93:1a:62:1e', 'W3K 5W1 D1L', 'Funcional'),
(100854, 'f4:f4:9b:e6:b3:27', 'F1C 0K0 I3X', 'Danado'),
(100855, 'a4:50:08:6e:24:dc', 'R8S 0X7 P5J', 'Danado'),
(100856, 'de:f2:2f:25:97:a9', 'J8Y 5X5 C0K', 'Funcional'),
(100857, 'fc:64:78:4f:a6:65', 'R6K 5O6 G0I', 'Danado'),
(100858, '51:a4:60:57:f2:b1', 'E9H 2B5 W6T', 'Funcional'),
(100859, '65:cd:d1:8d:d2:53', 'Q5O 0M9 J1D', 'Danado'),
(100860, 'e6:ac:5d:82:50:3c', 'P7Z 3U1 X1O', 'Danado'),
(100861, '1c:f7:1f:a3:b7:22', 'N2V 3X6 G4Z', 'Funcional'),
(100862, '93:40:40:84:4f:a7', 'V8L 6Z1 A2G', 'Danado'),
(100863, '52:04:d9:24:0a:64', 'U5I 2H5 A5P', 'Danado'),
(100864, '54:82:ca:1f:08:8a', 'S6Z 8W1 N9C', 'Danado'),
(100865, '9b:91:91:25:f2:69', 'J7E 1N2 T6L', 'Funcional'),
(100866, 'f7:f8:f1:00:fe:fe', 'S0E 1M8 J5B', 'Funcional'),
(100867, 'c5:af:d3:9b:65:b4', 'K1I 7P8 F3R', 'Funcional'),
(100868, '39:ac:41:10:28:f4', 'N3A 9A6 R2O', 'Danado'),
(100869, 'b8:ce:30:6d:2b:01', 'X2R 5R5 A4Q', 'Danado'),
(100870, '39:8a:54:61:71:f8', 'A4X 2L4 S2G', 'Danado'),
(100871, '8d:b4:53:9e:49:6f', 'C2L 3W0 R9Y', 'Danado'),
(100872, '03:02:a1:4a:65:6a', 'W9U 8A9 W9Y', 'Danado'),
(100873, '95:07:db:fc:86:1d', 'O4H 9Q3 Q8O', 'Funcional'),
(100874, 'c8:b0:89:32:ef:d0', 'W4V 8M3 T8J', 'Danado'),
(100875, 'a2:79:6b:5d:b4:83', 'L1O 5T8 Q6X', 'Danado'),
(100876, '18:d5:94:9c:86:79', 'Y8W 6A7 C0X', 'Danado'),
(100877, '7e:52:c6:a4:12:61', 'F0T 4B2 H2N', 'Danado'),
(100878, '03:fb:cc:b9:a1:67', 'K0D 5Q7 S2D', 'Danado'),
(100879, '57:be:b5:78:af:34', 'Q3P 1I5 F3Z', 'Funcional'),
(100880, '6b:6c:03:99:7c:da', 'N7H 3H9 J4C', 'Danado'),
(100881, 'e9:9d:10:10:72:f4', 'C2M 7N4 P1S', 'Danado'),
(100882, 'bc:39:3b:81:8e:95', 'Q8J 5O8 D8C', 'Danado'),
(100883, '3e:00:ca:34:81:de', 'F3E 9L5 D4Z', 'Danado'),
(100884, '5f:8c:63:50:56:bb', 'H0J 6P2 B7S', 'Funcional'),
(100885, '37:e1:54:99:c6:c2', 'N2K 8V4 E5L', 'Danado'),
(100886, '2d:55:e9:95:81:f5', 'X8D 3J3 J3S', 'Danado'),
(100887, '9d:76:8a:c7:ab:fe', 'L7X 6A1 T8M', 'Funcional'),
(100888, '58:6b:ed:68:98:ac', 'C0Z 2K2 Q4A', 'Danado'),
(100889, '36:77:32:b7:8a:d4', 'S5N 7B6 I6B', 'Funcional'),
(100890, 'eb:b9:a9:c3:b8:97', 'I2P 2Z4 F1M', 'Danado'),
(100891, '56:7a:65:a7:fc:11', 'L9S 9S5 F6H', 'Funcional'),
(100892, 'c6:a4:4f:4a:bd:90', 'K9D 3P3 T9D', 'Danado'),
(100893, 'e3:ac:c9:e1:20:04', 'R9Y 2Y7 H0M', 'Funcional'),
(100894, '26:06:74:0b:2f:26', 'S0N 4J7 C4Q', 'Danado'),
(100895, 'b2:d4:e3:5b:ee:ee', 'K4E 9L3 P3J', 'Funcional'),
(100896, 'da:8c:68:a3:cb:d7', 'P0U 0X9 G3Q', 'Danado'),
(100897, '15:57:c1:ee:8f:0a', 'V0A 9E5 R0Z', 'Danado'),
(100898, '49:07:09:c7:64:af', 'W9D 3U0 O3C', 'Danado'),
(100899, 'c6:35:9a:f0:d1:92', 'H4O 2H8 Q0B', 'Danado'),
(100900, 'a3:19:8a:18:7b:d1', 'JU 140', 'Danado'),
(100901, '95:1f:83:7e:a2:7a', 'DQ 022', 'Funcional'),
(100902, '23:85:30:e5:9a:56', 'TU 409', 'Danado'),
(100903, '02:a5:6c:6d:f3:3b', 'NC 711', 'Funcional'),
(100904, '4c:96:0d:3c:e7:51', 'RN 804', 'Funcional'),
(100905, '87:20:9e:5a:36:2c', 'XO 042', 'Funcional'),
(100906, '81:3e:9a:8b:0a:10', 'DB 992', 'Danado'),
(100907, 'be:0d:ab:7c:72:03', 'GF 047', 'Danado'),
(100908, '46:5f:38:c4:e2:51', 'JG 088', 'Funcional'),
(100909, 'c1:6d:a1:84:a5:ad', 'RR 739', 'Danado'),
(100910, '7c:1d:82:11:f0:60', 'GX 540', 'Danado'),
(100911, '60:0d:98:88:c3:23', 'RF 755', 'Danado'),
(100912, '24:fb:da:7c:76:e2', 'PY 214', 'Funcional'),
(100913, '25:fe:85:04:98:b8', 'RR 221', 'Danado'),
(100914, 'a0:96:de:60:7a:57', 'QD 581', 'Funcional'),
(100915, '3c:8f:51:44:43:be', 'RS 835', 'Danado'),
(100916, 'fb:83:49:41:86:1f', 'BH 654', 'Danado'),
(100917, '98:4a:34:16:67:44', 'YI 755', 'Danado'),
(100918, '54:9e:8b:ec:6b:71', 'TP 344', 'Danado'),
(100919, 'bd:18:5c:46:0a:a2', 'DO 509', 'Funcional'),
(100920, '03:2c:1f:f1:ba:ee', 'JV 991', 'Danado'),
(100921, 'fe:c9:2c:2a:d4:f9', 'SC 853', 'Danado'),
(100922, '58:83:e7:3f:5e:5d', 'WT 898', 'Danado'),
(100923, '05:ec:4d:01:10:a6', 'MO 562', 'Funcional'),
(100924, 'd5:e0:2b:ba:bc:2c', 'XX 570', 'Danado'),
(100925, 'd0:df:1a:50:29:ce', 'WB 561', 'Danado'),
(100926, 'f2:75:63:08:0e:d1', 'AK 739', 'Funcional'),
(100927, '45:a2:b8:f9:8e:98', 'PB 568', 'Funcional'),
(100928, '6c:59:d4:f4:5a:d6', 'LY 652', 'Funcional'),
(100929, '95:17:e9:45:4b:49', 'DK 910', 'Funcional'),
(100930, '31:19:a6:20:f1:a4', 'EW 941', 'Danado'),
(100931, 'd8:d9:6c:75:58:27', 'YF 389', 'Funcional'),
(100932, '98:a1:52:f6:c5:c7', 'RZ 704', 'Danado'),
(100933, '31:02:df:5f:9e:a9', 'FZ 491', 'Danado'),
(100934, '47:11:82:c2:0e:69', 'JF 611', 'Funcional'),
(100935, '8f:6a:68:94:cb:bf', 'SG 839', 'Funcional'),
(100936, 'bb:4e:62:e3:8b:d7', 'PL 823', 'Funcional'),
(100937, 'bd:6a:80:7c:2d:ce', 'ZO 841', 'Funcional'),
(100938, '7c:06:2f:0b:20:e6', 'ED 328', 'Danado'),
(100939, 'c1:54:8a:68:d5:e0', 'YO 392', 'Funcional'),
(100940, '7b:a0:8f:33:e0:dd', 'OS 136', 'Danado'),
(100941, '0c:8c:40:d9:06:31', 'TQ 897', 'Danado'),
(100942, '53:03:02:e2:0b:95', 'FG 710', 'Funcional'),
(100943, '8a:b2:7a:30:bb:e8', 'DT 022', 'Funcional'),
(100944, '92:da:d5:e2:25:66', 'MR 506', 'Funcional'),
(100945, '11:cb:cf:ed:47:68', 'WK 149', 'Funcional'),
(100946, 'a2:36:a0:8e:fb:d6', 'QY 953', 'Funcional'),
(100947, '5b:3e:19:05:db:06', 'ZF 725', 'Funcional'),
(100948, 'f6:7d:4b:9a:c0:49', 'OB 661', 'Danado'),
(100949, 'aa:48:8e:d1:8b:a1', 'ZC 534', 'Funcional'),
(100950, '38:7b:c7:b2:cd:31', 'CQ 307', 'Danado'),
(100951, '17:d5:c3:cc:48:dc', 'CK 395', 'Danado'),
(100952, 'f8:22:f5:b9:f8:9a', 'UF 215', 'Funcional'),
(100953, 'de:f4:f4:5f:d9:7b', 'NU 311', 'Funcional'),
(100954, '46:be:a4:e9:84:aa', 'FI 719', 'Funcional'),
(100955, '07:34:9f:0e:87:c8', 'ZF 087', 'Danado'),
(100956, '59:87:fd:62:67:40', 'JF 509', 'Funcional'),
(100957, '19:fc:00:bf:8d:76', 'FS 470', 'Funcional'),
(100958, '07:d2:14:f6:8f:fa', 'AK 195', 'Danado'),
(100959, 'b6:2d:cb:7c:61:ad', 'PU 113', 'Funcional'),
(100960, '1d:0a:71:62:da:14', 'DT 499', 'Danado'),
(100961, '04:83:68:f0:23:42', 'ES 931', 'Funcional'),
(100962, '9c:09:2f:d2:99:11', 'DN 538', 'Funcional'),
(100963, '14:a3:f3:f5:cb:25', 'HT 434', 'Danado'),
(100964, 'a0:d4:a9:0a:c9:ef', 'ZJ 139', 'Funcional'),
(100965, 'e9:08:63:53:da:c3', 'EB 087', 'Funcional'),
(100966, 'c9:ec:10:22:ea:e0', 'VC 523', 'Funcional'),
(100967, '5f:ab:04:39:65:0c', 'LQ 875', 'Danado'),
(100968, '10:e4:ee:5d:c5:92', 'FD 990', 'Funcional'),
(100969, '47:0a:00:74:bb:2c', 'ES 080', 'Danado'),
(100970, '85:85:8d:44:4e:41', 'XA 529', 'Funcional'),
(100971, 'e5:02:6f:d7:c3:5d', 'WT 035', 'Danado'),
(100972, '24:12:45:c8:f5:a1', 'VQ 804', 'Funcional'),
(100973, '35:37:f9:d5:9e:6d', 'QC 576', 'Danado'),
(100974, 'ec:07:a0:90:67:03', 'ZO 278', 'Funcional'),
(100975, '58:f0:26:5c:96:dd', 'TY 297', 'Danado'),
(100976, '26:73:d0:73:73:e4', 'MM 115', 'Funcional'),
(100977, 'ef:72:53:c9:8b:4d', 'UA 268', 'Funcional'),
(100978, '27:da:ca:94:9a:ec', 'PU 881', 'Funcional'),
(100979, '8d:64:b9:04:18:f4', 'HX 650', 'Funcional'),
(100980, 'af:25:de:da:3b:e2', 'AO 483', 'Danado'),
(100981, '05:a5:b9:46:1e:a6', 'AE 474', 'Funcional'),
(100982, '45:99:c2:13:2e:a4', 'HU 557', 'Funcional'),
(100983, '2d:5e:d1:d0:05:7d', 'DE 969', 'Funcional'),
(100984, '08:0e:ee:c6:75:4e', 'NR 543', 'Funcional'),
(100985, 'fa:be:14:02:af:c9', 'QO 777', 'Danado'),
(100986, 'e6:24:d2:85:5d:3b', 'NQ 218', 'Danado'),
(100987, 'a6:87:3a:37:b2:8d', 'LT 703', 'Danado'),
(100988, 'eb:58:d8:45:5f:7c', 'XB 921', 'Funcional'),
(100989, '42:8c:62:13:2a:3e', 'QL 503', 'Danado'),
(100990, 'dc:4f:63:49:5e:77', 'CC 108', 'Funcional'),
(100991, 'b3:fd:d8:71:a1:aa', 'CY 542', 'Danado'),
(100992, 'f6:cb:5d:af:79:e3', 'IZ 387', 'Danado'),
(100993, 'ec:14:73:2a:ac:e1', 'IH 047', 'Funcional'),
(100994, 'cf:4d:da:a4:da:b6', 'OJ 275', 'Funcional'),
(100995, 'ef:e7:79:9d:12:fd', 'PR 119', 'Danado'),
(100996, 'd5:cd:13:91:3f:f4', 'BX 742', 'Danado'),
(100997, 'b4:5f:ae:5f:93:6d', 'AH 905', 'Danado'),
(100998, 'f2:e3:d6:b1:a2:67', 'SQ 785', 'Funcional'),
(100999, '04:9f:cc:73:f5:fe', 'OH 665', 'Funcional'),
(101000, '7c:a3:ac:e4:2a:ab', 'BLD54', 'Danado'),
(101001, '5e:c9:34:f6:e4:89', 'YAR52', 'Danado'),
(101002, 'dd:01:b2:91:7e:2f', 'FCN76', 'Funcional'),
(101003, '4c:09:a9:61:fa:be', 'JYB06', 'Danado'),
(101004, 'de:19:60:29:56:42', 'VHU85', 'Danado'),
(101005, '88:ac:c5:bd:db:bf', 'TMH94', 'Funcional'),
(101006, '38:04:97:4a:7d:d0', 'TVI81', 'Funcional'),
(101007, '26:39:cb:6d:7a:ae', 'NFU85', 'Funcional'),
(101008, 'c8:3d:be:2d:1c:c7', 'FPU64', 'Funcional'),
(101009, 'a8:d6:73:29:0e:81', 'HWB73', 'Danado'),
(101010, '76:bc:01:15:8c:77', 'KCR48', 'Danado'),
(101011, '7f:48:28:4a:fa:15', 'BFI95', 'Danado'),
(101012, '50:bf:16:0f:e9:21', 'IEQ20', 'Danado'),
(101013, 'b5:04:07:81:6d:3e', 'GER19', 'Danado'),
(101014, 'cf:aa:fc:54:46:91', 'ZLI48', 'Funcional'),
(101015, 'e9:ea:24:2b:cf:97', 'NBG27', 'Danado'),
(101016, '3f:ba:90:16:5d:3b', 'ESJ81', 'Funcional'),
(101017, '53:7b:72:83:e1:12', 'NVA96', 'Funcional'),
(101018, 'b2:60:be:31:b5:65', 'ACN26', 'Danado'),
(101019, '39:05:b7:b0:88:aa', 'DQD95', 'Funcional'),
(101020, '08:81:d4:c3:55:d8', 'CRC92', 'Danado'),
(101021, '07:cb:30:51:5e:27', 'PPA86', 'Funcional'),
(101022, '9c:f8:12:09:61:16', 'TDS74', 'Danado'),
(101023, '3b:86:21:fb:58:4a', 'XZR82', 'Funcional'),
(101024, '78:1f:6c:ca:4f:48', 'RVH76', 'Funcional'),
(101025, 'a7:72:95:06:92:65', 'HFQ82', 'Danado'),
(101026, '32:0e:e5:5a:c3:f4', 'VXZ06', 'Danado'),
(101027, 'd0:e8:e8:5a:bd:cc', 'CPO66', 'Funcional'),
(101028, 'c6:dd:53:45:89:ad', 'IMD39', 'Danado'),
(101029, '9a:1d:40:67:4f:f7', 'TNX98', 'Danado'),
(101030, '4d:70:6f:c7:36:57', 'XDN39', 'Funcional'),
(101031, 'fd:37:cd:45:b8:00', 'WIF52', 'Funcional'),
(101032, '49:24:f6:7a:f1:6b', 'DZC06', 'Funcional'),
(101033, '93:c6:78:7c:a0:9e', 'MME96', 'Funcional'),
(101034, 'f0:e8:30:18:64:e7', 'EWO23', 'Funcional'),
(101035, '65:44:e0:32:47:13', 'MRL22', 'Funcional'),
(101036, '73:a2:6e:f7:cc:d0', 'OOE72', 'Danado'),
(101037, 'd1:24:4a:7b:9c:4a', 'ATP37', 'Funcional'),
(101038, '4c:4b:b8:bc:39:74', 'QSD85', 'Danado'),
(101039, '72:c3:4a:38:02:71', 'LYZ14', 'Funcional'),
(101040, 'aa:76:8a:e4:b7:40', 'HNK00', 'Funcional'),
(101041, '97:1a:b1:3a:01:b2', 'DVD51', 'Funcional'),
(101042, '58:9b:6a:e9:1a:f9', 'IKI26', 'Danado'),
(101043, 'ee:e3:cb:5b:e3:95', 'WKS31', 'Danado'),
(101044, 'd5:10:b8:46:a4:dc', 'WFI12', 'Funcional'),
(101045, '11:1d:6a:20:b3:4a', 'XOG12', 'Funcional'),
(101046, '81:a8:c0:91:7f:d2', 'EJB26', 'Funcional'),
(101047, 'f0:ab:a9:69:a0:2e', 'ZEG26', 'Danado'),
(101048, '71:3d:69:b5:1f:3b', 'NYD04', 'Funcional'),
(101049, '4e:49:e1:98:6b:1c', 'KCG84', 'Funcional'),
(101050, '76:fe:08:00:67:03', 'WZG04', 'Danado'),
(101051, '8f:cd:15:a8:cb:b8', 'BED86', 'Danado'),
(101052, '8f:ae:78:35:f9:4c', 'LGG86', 'Danado'),
(101053, '8b:2c:21:e3:89:86', 'XCS14', 'Funcional'),
(101054, 'd7:d3:64:6b:b7:e2', 'TDT88', 'Funcional'),
(101055, '65:7c:dc:39:c8:50', 'KAX85', 'Funcional'),
(101056, '88:90:7b:2e:24:f7', 'SBL29', 'Danado'),
(101057, '04:92:40:e2:f8:0a', 'DLY32', 'Danado'),
(101058, 'eb:d1:ad:d0:46:73', 'FLL36', 'Danado'),
(101059, 'be:42:82:2d:e8:65', 'LYO02', 'Funcional'),
(101060, 'bd:80:fe:20:00:41', 'WVB57', 'Funcional'),
(101061, 'e2:c2:f2:2c:21:9c', 'LJF03', 'Funcional'),
(101062, '30:e1:d9:56:22:48', 'OGJ42', 'Funcional'),
(101063, 'd5:6f:d5:d1:a1:20', 'WZG92', 'Danado'),
(101064, 'dd:4e:0e:6b:51:06', 'PTN18', 'Funcional'),
(101065, 'd7:8f:f6:90:5b:1a', 'GAU23', 'Danado'),
(101066, 'a6:ce:6e:6b:0d:9d', 'RHB73', 'Funcional'),
(101067, 'c6:16:cc:37:d0:67', 'HIU50', 'Funcional'),
(101068, '04:d8:06:dd:b9:c2', 'QLE94', 'Funcional'),
(101069, '7f:0b:d5:28:94:1c', 'XEL42', 'Funcional'),
(101070, '3c:29:b7:e3:cc:06', 'GML80', 'Danado'),
(101071, '69:8a:6b:4d:13:5c', 'GVY59', 'Funcional'),
(101072, '5c:68:ca:df:3a:52', 'DWG59', 'Funcional'),
(101073, '3e:e6:ef:97:3f:f8', 'IXE29', 'Danado'),
(101074, '96:6c:54:d4:d0:0b', 'LTM11', 'Funcional'),
(101075, '0b:97:4d:14:b9:6a', 'DQL20', 'Funcional'),
(101076, 'b2:9d:96:bd:bf:56', 'KZQ05', 'Danado'),
(101077, '22:34:37:01:54:0a', 'SMZ93', 'Funcional'),
(101078, '8b:80:ab:81:c9:02', 'HBH03', 'Funcional'),
(101079, '73:bf:4b:d7:7e:5d', 'VZM98', 'Funcional'),
(101080, '0d:bf:51:12:73:0e', 'NXU98', 'Funcional'),
(101081, '3d:a0:01:66:e3:bc', 'WJO93', 'Danado'),
(101082, '46:f9:4a:65:d3:25', 'DLL79', 'Funcional'),
(101083, 'e5:e0:1d:27:9b:71', 'OIF64', 'Funcional'),
(101084, '44:77:fb:90:38:b6', 'TBI86', 'Funcional'),
(101085, '53:28:d9:56:94:be', 'OPL10', 'Danado'),
(101086, '62:df:98:73:aa:77', 'PEQ56', 'Funcional'),
(101087, '36:61:4e:15:7a:80', 'DNL85', 'Funcional'),
(101088, '39:e2:38:eb:61:21', 'PIV79', 'Funcional'),
(101089, '1b:e8:23:97:3d:96', 'YXM39', 'Funcional'),
(101090, '96:b3:96:39:b3:5f', 'PIR12', 'Funcional'),
(101091, '5d:ba:b5:16:d8:ee', 'IIX38', 'Funcional'),
(101092, 'e2:03:49:94:53:ea', 'RTD63', 'Funcional'),
(101093, 'c4:1f:ba:a9:32:37', 'KOB59', 'Danado'),
(101094, '2b:b9:fd:75:e0:5f', 'CWD84', 'Funcional'),
(101095, 'ba:0b:e3:41:5b:16', 'CQV15', 'Danado'),
(101096, '6a:a7:59:c6:66:74', 'GRM75', 'Danado'),
(101097, '58:c0:ee:79:bc:69', 'ZVM42', 'Danado'),
(101098, 'eb:36:d4:fa:13:f0', 'UQZ81', 'Funcional'),
(101099, '8d:a3:ae:95:a3:d3', 'ZJV89', 'Danado'),
(101100, '29:d2:5f:bd:a6:4c', 'KSA73MEG', 'Funcional'),
(101101, '82:59:44:b4:83:e9', 'PEA08EBR', 'Funcional'),
(101102, '6b:2f:f3:e1:90:3d', 'DNB08ZNY', 'Funcional'),
(101103, '3f:17:2b:e1:c9:25', 'CFM04KKI', 'Funcional'),
(101104, '2e:5b:9a:55:61:1d', 'BMN26XNS', 'Funcional'),
(101105, 'f8:94:fd:ef:5a:a0', 'FAK84PCI', 'Funcional'),
(101106, '9e:df:31:b4:e2:0c', 'PCP25OOB', 'Funcional'),
(101107, 'd6:10:c9:5c:b5:99', 'JRN72TNU', 'Danado'),
(101108, '84:c2:38:e2:ba:a1', 'WZU84HBY', 'Danado'),
(101109, '36:8b:6b:d0:a8:49', 'SFO20XAG', 'Funcional'),
(101110, 'b0:41:da:a6:db:6e', 'IWR46CVN', 'Funcional'),
(101111, 'f2:54:d7:ae:50:ac', 'VYQ06OGL', 'Funcional'),
(101112, 'c9:9d:58:52:f0:8c', 'JZY74LQS', 'Funcional'),
(101113, '1c:bd:08:9f:df:4f', 'EDP51XOR', 'Funcional'),
(101114, '81:94:47:6f:d1:93', 'KFS41USA', 'Danado'),
(101115, '2e:6d:24:46:0f:7f', 'XYB95LRL', 'Funcional'),
(101116, 'f7:04:82:af:10:da', 'IPH99LQI', 'Funcional'),
(101117, 'a0:6d:bd:8f:f6:3f', 'YBV94GYI', 'Funcional'),
(101118, '02:a7:9b:7f:0b:f3', 'YUI03JXB', 'Danado'),
(101119, 'fd:d6:a4:a7:bb:5a', 'HDP33RZF', 'Funcional'),
(101120, '03:58:04:00:c5:cd', 'WHL76GNV', 'Danado'),
(101121, '67:1e:5e:7d:63:bd', 'VYY50ONZ', 'Funcional'),
(101122, '25:a5:9a:15:f6:45', 'WUU02BGJ', 'Funcional'),
(101123, '0a:fa:81:47:91:9d', 'NAA76IPS', 'Danado'),
(101124, '1a:36:3a:46:28:f7', 'PRZ50FFA', 'Funcional'),
(101125, 'fc:5d:53:b5:ca:2b', 'FQG03FUE', 'Funcional'),
(101126, '86:94:82:85:22:f5', 'PTX76JDN', 'Funcional'),
(101127, '9c:6d:3e:fb:81:58', 'XCE37GLE', 'Danado'),
(101128, 'f7:4a:00:d8:eb:67', 'URI47RCV', 'Danado'),
(101129, '07:a8:5a:90:fe:bf', 'ZPU98TBY', 'Danado'),
(101130, '30:4a:77:7f:28:b6', 'MVM51GIJ', 'Funcional'),
(101131, '48:83:7d:a7:1d:15', 'AYF39GRP', 'Danado'),
(101132, '95:73:79:1d:d5:f2', 'YIP06UOF', 'Danado'),
(101133, '26:a8:f9:74:e1:6a', 'XZC51VAX', 'Danado'),
(101134, '3a:f2:f4:08:20:f4', 'LGV01UTV', 'Funcional'),
(101135, '61:b3:94:ac:91:e8', 'UFU99MQV', 'Danado'),
(101136, 'a9:01:a7:1e:c9:98', 'HKQ30VRJ', 'Danado'),
(101137, '2b:26:36:cc:34:12', 'ZOL35UIL', 'Funcional'),
(101138, 'c9:33:a7:fd:c1:1f', 'WCH86LVR', 'Funcional'),
(101139, 'bf:ea:e1:89:fa:f3', 'UXY07GPT', 'Danado'),
(101140, 'ac:97:88:be:73:d4', 'DDW26XHS', 'Danado'),
(101141, '7e:15:e0:61:e0:b5', 'HWA97SLJ', 'Danado'),
(101142, 'c2:b7:63:f2:0b:88', 'RWZ81QII', 'Funcional'),
(101143, 'ca:c7:29:a8:d8:32', 'ATN88AGM', 'Funcional'),
(101144, '1b:03:e5:0f:5a:87', 'HSX89PUC', 'Danado'),
(101145, '48:ee:de:d7:ba:51', 'FPA12TXP', 'Funcional'),
(101146, '1f:27:91:df:3f:be', 'VEL43CVI', 'Funcional'),
(101147, '58:ec:77:b4:f8:a6', 'BBH29EDU', 'Funcional'),
(101148, '3c:96:10:80:27:3d', 'QSA92WXU', 'Funcional'),
(101149, '51:3e:20:3d:87:29', 'GEE34XTJ', 'Funcional'),
(101150, 'f6:b8:78:3b:bb:e5', 'BRF53ZUG', 'Danado'),
(101151, 'f2:9f:07:90:85:88', 'MRF24DRE', 'Funcional'),
(101152, '25:9c:d3:da:5d:62', 'XPH80FNW', 'Danado'),
(101153, 'af:8c:a3:32:a9:5c', 'UAE28FJM', 'Danado'),
(101154, 'c9:b1:ab:f6:60:c3', 'WIZ71XWI', 'Funcional'),
(101155, '7d:6c:f8:0b:aa:b8', 'JWK82VYM', 'Funcional'),
(101156, '39:ca:ee:80:94:3d', 'MIW70IUM', 'Funcional'),
(101157, 'b2:5f:f3:e1:ea:bf', 'OEM30HCQ', 'Funcional'),
(101158, 'd2:b1:78:fc:d6:cf', 'SNL09DZT', 'Danado'),
(101159, '5d:8f:87:fc:40:98', 'DNF05GYV', 'Danado'),
(101160, '07:79:a6:85:69:f6', 'GRO53MGD', 'Funcional'),
(101161, 'b5:b6:3c:75:af:5e', 'DCE56VKT', 'Funcional'),
(101162, '63:fb:75:ef:a7:8c', 'KOG69JTT', 'Funcional'),
(101163, 'ec:a0:36:76:5e:aa', 'YEJ97XHY', 'Funcional'),
(101164, 'e8:71:97:51:ab:87', 'MTJ31BMN', 'Danado'),
(101165, '84:bb:dc:c5:65:9f', 'XFY76TIK', 'Danado'),
(101166, '02:a2:48:0e:ca:1c', 'KLS03YCP', 'Funcional'),
(101167, '19:e8:47:1a:e6:b6', 'XOW60EDT', 'Funcional'),
(101168, 'a9:7d:da:e7:33:06', 'NUH67BRK', 'Danado'),
(101169, '4f:e9:24:96:e5:55', 'LQA17UGB', 'Danado'),
(101170, 'e0:8d:88:76:00:0a', 'CPM57FWV', 'Funcional'),
(101171, 'b0:0a:27:72:9a:63', 'DXC93ULW', 'Funcional'),
(101172, '04:15:3e:73:b0:ab', 'PTR26YVC', 'Funcional'),
(101173, '69:2a:24:65:a8:29', 'NFZ34KVR', 'Funcional'),
(101174, '3b:bf:00:fb:e9:43', 'GHV06AGY', 'Danado'),
(101175, '7e:51:1d:41:46:65', 'WVB05VTK', 'Funcional'),
(101176, '64:ed:cc:f2:1d:17', 'WAH24ZWL', 'Funcional'),
(101177, '8d:44:7e:c7:36:f9', 'HHQ56NIJ', 'Funcional'),
(101178, '8f:4b:8f:b8:d2:c0', 'WLT04AFM', 'Danado'),
(101179, '21:74:68:57:23:40', 'QVT08IWM', 'Funcional'),
(101180, 'ad:95:0b:a6:e7:b9', 'MDJ52IUN', 'Funcional'),
(101181, 'ed:34:9d:d7:c2:f8', 'EZC33QDA', 'Funcional'),
(101182, 'e9:6b:9b:84:62:7a', 'BSP42TSP', 'Danado'),
(101183, 'ee:1e:f0:c4:0e:4c', 'GTM24DGQ', 'Funcional'),
(101184, '89:b5:af:bd:bb:26', 'FCW29RRZ', 'Funcional'),
(101185, 'aa:45:12:ec:6a:1f', 'DCK83NTN', 'Funcional'),
(101186, '09:03:a3:ad:11:be', 'XBU20QBM', 'Funcional'),
(101187, '32:cb:fb:26:bb:5b', 'TAR62IAJ', 'Danado'),
(101188, '16:b6:fa:2e:46:fe', 'QNJ89PCI', 'Danado'),
(101189, 'f3:aa:78:5e:cf:ea', 'UZQ43YFU', 'Funcional'),
(101190, '86:2a:b4:36:ae:e1', 'EHJ65WOU', 'Danado'),
(101191, 'f2:fc:be:27:93:ac', 'ARL75WJL', 'Funcional'),
(101192, '26:33:73:58:ed:1c', 'AJO95QVF', 'Funcional'),
(101193, 'dd:d4:5e:b3:8c:27', 'EUI42SKH', 'Funcional'),
(101194, '2e:0e:d4:73:9c:a8', 'NCX81ACH', 'Funcional'),
(101195, '0d:13:58:c5:f8:14', 'VVD65UOA', 'Funcional'),
(101196, 'a3:59:5d:90:86:6f', 'WWX76TGV', 'Danado'),
(101197, '92:86:10:e6:e4:11', 'YWD28QVI', 'Funcional'),
(101198, '73:fe:ae:bd:32:65', 'UCH33VYY', 'Danado'),
(101199, '72:7a:fd:35:83:1d', 'KSJ48YUF', 'Funcional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estado`
--

CREATE TABLE `Estado` (
  `IDESTADO` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Estado`
--

INSERT INTO `Estado` (`IDESTADO`, `Nombre`) VALUES
(102, 'Queretaro'),
(103, 'Jalisco'),
(109, 'Guanajuato'),
(214, 'Nuevo Leon'),
(301, 'Michoacán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LoginUsuario`
--

CREATE TABLE `LoginUsuario` (
  `IDLOGIN` int(11) NOT NULL,
  `NombreUsuario` varchar(100) NOT NULL,
  `FechaIngreso` datetime NOT NULL,
  `FechaSalida` datetime NOT NULL,
  `IDREGISTRO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `LoginUsuario`
--

INSERT INTO `LoginUsuario` (`IDLOGIN`, `NombreUsuario`, `FechaIngreso`, `FechaSalida`, `IDREGISTRO`) VALUES
(1, 'Miguel', '2018-05-07 18:37:35', '2018-05-07 18:38:07', 1),
(2, 'Miguel', '2018-05-07 18:39:50', '2018-05-07 18:40:22', 1),
(3, 'Miguel', '2018-05-07 18:40:50', '2018-05-07 18:41:17', 1),
(4, 'Miguel', '2018-05-07 18:42:52', '2018-05-07 18:44:02', 1),
(5, 'Miguel', '2018-05-07 18:46:22', '2018-05-07 18:47:27', 1),
(6, 'Miguel', '2018-05-07 18:53:25', '2018-05-07 18:55:12', 1),
(7, 'Miguel', '2018-05-07 18:55:24', '2018-05-07 18:56:30', 1),
(8, 'Miguel', '2018-05-07 18:59:20', '2018-05-07 19:00:06', 1),
(9, 'Miguel', '2018-05-07 19:04:29', '2018-05-07 19:04:46', 1),
(10, 'Miguel', '2018-05-07 19:05:05', '2018-05-07 19:06:08', 1),
(11, 'Miguel', '2018-05-07 19:10:04', '2018-05-07 19:11:21', 1),
(12, 'Miguel', '2018-05-07 19:17:43', '2018-05-07 19:17:43', 1),
(13, 'Miguel', '2018-05-07 19:18:11', '2018-05-07 19:18:11', 1),
(14, 'Miguel', '2018-05-07 19:25:11', '2018-05-07 19:26:40', 1),
(15, 'Miguel', '2018-05-07 19:28:24', '2018-05-07 19:28:35', 1),
(16, 'Miguel', '2018-05-07 19:30:42', '2018-05-07 19:31:27', 1),
(17, 'Miguel', '2018-05-07 19:32:32', '2018-05-07 19:33:45', 1),
(18, 'Miguel', '2018-05-07 19:36:31', '2018-05-07 19:38:32', 1),
(19, 'Miguel', '2018-05-07 19:40:06', '2018-05-07 19:40:36', 1),
(20, 'Miguel', '2018-05-07 19:43:32', '2018-05-07 19:44:06', 1),
(21, 'Miguel', '2018-05-07 19:45:56', '2018-05-07 19:47:03', 1),
(22, 'Miguel', '2018-05-07 19:48:31', '2018-05-07 19:49:06', 1),
(23, 'Miguel', '2018-05-07 19:51:42', '2018-05-07 19:54:34', 1),
(24, 'Miguel', '2018-05-07 19:54:58', '2018-05-07 19:54:58', 1),
(25, 'Miguel', '2018-05-07 20:03:00', '2018-05-07 20:03:23', 1),
(26, 'Miguel', '2018-05-07 20:52:42', '2018-05-07 20:55:51', 1),
(27, 'Miguel', '2018-05-07 21:00:59', '2018-05-07 21:00:59', 1),
(28, 'Miguel', '2018-05-07 21:06:09', '2018-05-07 21:06:09', 1),
(29, 'Miguel', '2018-05-07 21:08:19', '2018-05-07 21:08:35', 1),
(30, 'Miguel', '2018-05-07 21:10:48', '2018-05-07 21:11:10', 1),
(31, 'Miguel', '2018-05-07 21:17:48', '2018-05-07 21:17:48', 1),
(32, 'Miguel', '2018-05-07 21:21:50', '2018-05-07 21:21:50', 1),
(33, 'Miguel', '2018-05-07 21:25:33', '2018-05-07 21:25:54', 1),
(34, 'Miguel', '2018-05-08 13:18:58', '2018-05-08 13:22:51', 1),
(35, 'Miguel', '2018-05-08 13:24:16', '2018-05-08 13:24:16', 1),
(36, 'Miguel', '2018-05-08 13:40:43', '2018-05-08 13:40:43', 1),
(37, 'Miguel', '2018-05-08 13:42:30', '2018-05-08 13:42:30', 1),
(38, 'Miguel', '2018-05-15 18:31:31', '2018-05-15 19:21:40', 1),
(39, 'Miguel', '2018-05-20 22:42:18', '2018-05-20 22:43:21', 1),
(40, 'Miguel', '2018-05-20 22:44:15', '2018-05-20 23:04:20', 1),
(41, 'Miguel', '2018-05-21 00:46:24', '2018-05-21 00:46:37', 1),
(42, 'Miguel', '2018-05-21 00:47:25', '2018-05-21 00:47:41', 1),
(43, 'Miguel', '2018-05-21 00:48:17', '2018-05-21 00:48:26', 1),
(44, 'Miguel', '2018-05-21 01:33:40', '2018-05-21 01:33:40', 1),
(45, 'Miguel', '2018-05-21 01:36:01', '2018-05-21 01:36:01', 1),
(46, 'Miguel', '2018-05-21 01:37:10', '2018-05-21 01:38:22', 1),
(47, 'Miguel', '2018-05-21 02:18:28', '2018-05-21 02:19:08', 1),
(48, 'Miguel', '2018-05-21 02:24:50', '2018-05-21 02:25:35', 1),
(49, 'Miguel', '2018-05-21 02:32:55', '2018-05-21 02:32:55', 1),
(50, 'Miguel', '2018-05-21 02:34:50', '2018-05-21 02:34:50', 1),
(51, 'Miguel', '2018-05-21 02:36:17', '2018-05-21 02:36:17', 1),
(52, 'Miguel', '2018-05-21 02:38:04', '2018-05-21 02:38:04', 1),
(53, 'Miguel', '2018-05-21 02:41:01', '2018-05-21 02:42:11', 1),
(54, 'Miguel', '2018-05-21 02:50:32', '2018-05-21 02:50:32', 1),
(55, 'Miguel', '2018-05-21 02:51:39', '2018-05-21 02:51:39', 1),
(56, 'Miguel', '2018-05-21 02:54:14', '2018-05-21 02:54:26', 1),
(57, 'Miguel', '2018-05-21 03:01:06', '2018-05-21 03:01:33', 1),
(58, 'Miguel', '2018-05-21 04:01:55', '2018-05-21 04:01:55', 1),
(59, 'Miguel', '2018-05-21 04:05:00', '2018-05-21 04:05:30', 1),
(60, 'Miguel', '2018-05-21 04:12:48', '2018-05-21 04:13:23', 1),
(61, 'Miguel', '2018-05-21 04:14:20', '2018-05-21 04:15:42', 1),
(62, 'Miguel', '2018-05-21 04:24:43', '2018-05-21 04:25:35', 1),
(63, 'Miguel', '2018-05-21 04:33:45', '2018-05-21 04:33:45', 1),
(64, 'Miguel', '2018-05-21 04:38:32', '2018-05-21 04:39:03', 1),
(65, 'Miguel', '2018-05-21 04:40:23', '2018-05-21 04:43:52', 1),
(66, 'Miguel', '2018-05-21 04:44:17', '2018-05-21 04:44:58', 1),
(67, 'Miguel', '2018-05-21 04:46:30', '2018-05-21 04:52:17', 1),
(68, 'Miguel', '2018-05-21 04:52:30', '2018-05-21 04:53:03', 1),
(69, 'Miguel', '2018-05-21 13:43:55', '2018-05-21 13:43:55', 1),
(70, 'Miguel', '2018-05-21 13:46:29', '2018-05-21 13:46:29', 1),
(71, 'Miguel', '2018-05-21 13:47:40', '2018-05-21 13:47:40', 1),
(72, 'Miguel', '2018-05-21 13:48:51', '2018-05-21 13:48:51', 1),
(73, 'Miguel', '2018-05-21 13:49:47', '2018-05-21 13:49:47', 1),
(74, 'Miguel', '2018-05-24 22:29:40', '2018-05-24 22:33:38', 1),
(75, 'miguel', '2018-05-24 22:34:07', '2018-05-24 22:35:34', 1),
(76, 'miguel', '2018-05-24 22:35:55', '2018-05-24 23:02:34', 1),
(77, 'Miguel', '2018-05-24 23:08:14', '2018-05-24 23:10:57', 1),
(78, 'Miguel', '2018-05-24 23:11:30', '2018-05-24 23:11:30', 1),
(79, 'Miguel', '2018-05-24 23:13:12', '2018-05-24 23:13:12', 1),
(80, 'Diego', '2018-05-24 23:15:10', '2018-05-24 23:15:45', 2),
(81, 'Diego', '2018-05-24 23:45:42', '2018-05-24 23:46:36', 2),
(82, 'Diego', '2018-05-25 00:00:05', '2018-05-25 00:00:21', 2),
(83, 'Diego', '2018-05-25 00:00:39', '2018-05-25 00:00:39', 2),
(84, 'Diego', '2018-05-25 00:45:47', '2018-05-25 00:46:32', 2),
(85, 'Diego', '2018-05-25 00:48:59', '2018-05-25 00:49:35', 2),
(86, 'Diego', '2018-05-25 01:17:04', '2018-05-25 01:17:04', 2),
(87, 'Diego', '2018-05-25 01:19:20', '2018-05-25 01:19:40', 2),
(88, 'Diego', '2018-05-25 01:44:10', '2018-05-25 01:44:53', 2),
(89, 'DIEGO', '2018-05-25 02:36:05', '2018-05-25 02:36:16', 2),
(90, 'Miguel', '2018-05-25 02:41:20', '2018-05-25 02:41:20', 1),
(91, 'Diego', '2018-05-25 02:48:06', '2018-05-25 02:48:06', 2),
(92, 'Miguel', '2018-05-25 02:57:09', '2018-05-25 02:57:09', 1),
(93, 'Miguel', '2018-05-25 03:09:31', '2018-05-25 03:09:31', 1),
(94, 'Diego', '2018-05-25 03:10:57', '2018-05-25 03:12:10', 2),
(95, 'Diego', '2018-05-25 03:14:53', '2018-05-25 03:17:22', 2),
(96, 'Diego', '2018-05-25 13:35:24', '2018-05-25 13:35:24', 2),
(97, 'Diego', '2018-05-25 13:48:01', '2018-05-25 13:48:01', 2),
(98, 'Diego', '2018-05-25 13:49:08', '2018-05-25 13:49:08', 2),
(99, 'Diego', '2018-05-25 13:50:21', '2018-05-25 13:50:21', 2),
(100, 'Miguel', '2018-05-25 13:51:14', '2018-05-25 13:51:29', 1),
(101, 'Diego', '2018-05-25 13:54:19', '2018-05-25 14:04:38', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Movimientos`
--

CREATE TABLE `Movimientos` (
  `IDMOVIMIENTO` int(11) NOT NULL,
  `NoSerie` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `DireccionMAC` varchar(17) NOT NULL,
  `IPDHCP` varchar(15) DEFAULT NULL,
  `UsuarioPPPOE` varchar(255) DEFAULT NULL,
  `ContrasenaPPPOE` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Movimientos`
--

INSERT INTO `Movimientos` (`IDMOVIMIENTO`, `NoSerie`, `Fecha`, `DireccionMAC`, `IPDHCP`, `UsuarioPPPOE`, `ContrasenaPPPOE`, `Descripcion`) VALUES
(928392, 100744, '2017-06-10', 'b6:15:9d:3d:e5:46', '', 'Simon22', 'JDS61SHQ0FJ', 'Sin comentarios'),
(928393, 100796, '2018-11-02', '7a:f5:61:0c:fa:d7', '', 'Eyewater', 'VBU56OKM3IO', 'Sin comentarios'),
(928394, 101130, '2018-02-03', '6c:65:e8:0e:67:98', '', 'ProusQursh', 'GAJ58GXA8NI', 'Sin comentarios'),
(928395, 101165, '2017-07-31', 'c1:12:a4:52:bc:e8', '', 'Pudibund', 'ZJT54OXC6XQ', 'Sin comentarios'),
(928396, 100626, '2017-08-28', 'f2:83:45:b8:85:12', '', 'Mythography', 'WPF46WTH4VQ', 'Sin comentarios'),
(928397, 100950, '2017-12-23', 'f6:5e:f4:d3:7c:d5', '', 'Vibrograph', 'LXB50UBB1BE', 'Sin comentarios'),
(928398, 101187, '2017-08-01', 'fa:d5:13:9c:20:23', '', 'Postulator', 'PXP89FLE3GI', 'Sin comentarios'),
(928399, 100697, '2018-01-07', '3d:3a:bf:a1:d6:bb', '', 'Pabulum', 'ZED73FVP2FM', 'Sin comentarios'),
(928400, 100817, '2017-11-18', 'ae:a4:c9:e3:e5:35', '', 'GonmekzPassim', 'ADH89IAF0YW', 'Sin comentarios'),
(928401, 101030, '2017-04-25', '2b:d9:b2:4e:27:b3', '', 'Carniferous', 'HXY37NMH5NN', 'Sin comentarios'),
(928402, 100990, '2017-08-25', '6e:86:17:4a:2b:3a', '', 'Troglodyte', 'VLV64GTU2IZ', 'Sin comentarios'),
(928403, 100722, '2018-03-13', 'd3:55:e3:1d:05:83', '', 'Platitude', 'FPV16GSN9LZ', 'Sin comentarios'),
(928404, 101098, '2017-06-13', '87:5e:de:2a:a2:64', '', 'Illision', 'QQP46QSN0EH', 'Sin comentarios'),
(928405, 100902, '2017-07-24', '1b:2c:ef:6c:69:48', '', 'Decalogist', 'VTG65ILW9AT', 'Sin comentarios'),
(928406, 100803, '2017-09-06', '4c:2f:5d:21:36:bc', '', 'Lactifluous', 'DVB63YHP4RV', 'Sin comentarios'),
(928407, 100628, '2017-09-07', '46:59:65:c8:3b:d6', '', 'Chlorophyll', 'ILK45UXY4PD', 'Sin comentarios'),
(928408, 101098, '2017-08-21', '13:c0:0b:2e:09:0d', '', 'Leymoony', 'BKY14BYO9KM', 'Sin comentarios'),
(928409, 101065, '2017-07-15', '7e:3f:e8:1c:af:1e', '', 'Cinerary', 'TAX39ULS2OG', 'Sin comentarios'),
(928410, 101119, '2017-08-03', '03:2e:20:22:0c:86', '', 'Pantophobia', 'ZQT68HSE4FE', 'Sin comentarios'),
(928411, 101149, '2017-05-21', '3e:4c:d6:35:dd:2a', '', 'Rachetder415', 'WXF03QYP3CQ', 'Sin comentarios'),
(928412, 100887, '2017-09-18', '97:07:ea:1f:18:3f', '', 'Jacobin', 'XXF61UQL2VK', 'Sin comentarios'),
(928413, 100865, '2017-09-13', '2b:8d:57:d8:97:19', '', 'Hogmanay', 'ZWC78XGL5XA', 'Sin comentarios'),
(928414, 101069, '2017-05-25', '72:52:6c:1c:6a:24', '', 'Cadgefgirl44', 'ECI56AVK6QS', 'Sin comentarios'),
(928415, 101181, '2017-09-13', '50:21:1d:69:ec:4e', '', 'Xenogamy', 'HHN08OOV0PI', 'Sin comentarios'),
(928416, 101067, '2017-09-11', '08:91:9a:0e:0c:5d', '', 'Tubthumper', 'KQH58IWC7XT', 'Sin comentarios'),
(928417, 100628, '2017-02-11', '41:d4:cb:bb:87:cc', '', 'Manalcerpt', 'OHD91AZA5AD', 'Sin comentarios'),
(928418, 100638, '2017-07-02', '89:d5:c8:dc:a1:27', '', 'Pollyanna', 'JRF16IHX0OD', 'Sin comentarios'),
(928419, 100740, '2017-05-12', '3d:ca:dd:ca:9b:c0', '', 'Wyverngsak', 'BDF82LTO9IB', 'Sin comentarios'),
(928420, 100654, '2017-11-14', 'f3:1e:06:0e:81:20', '', 'Scapulomancy', 'HLP21HEA8LU', 'Sin comentarios'),
(928421, 100978, '2017-03-31', 'd2:a5:ba:49:81:17', '', 'Synecdochial', 'AIK20JBS5XX', 'Sin comentarios'),
(928422, 100928, '2018-05-05', '52:4f:4f:6d:69:89', '', 'Sybilline', 'AZI56UYI3LA', 'Sin comentarios'),
(928423, 100642, '2018-03-15', 'c2:d2:95:7d:c6:72', '', 'Quidnunc', 'RKT49OGS2RT', 'Sin comentarios'),
(928424, 100710, '2018-03-11', 'cd:02:a0:0e:05:18', '', 'Seminivorous', 'ZME29HFY1QF', 'Sin comentarios'),
(928425, 101090, '2018-02-22', '27:01:a2:4b:84:9c', '', 'Couchant', 'KWN96GCP6VG', 'Sin comentarios'),
(928426, 101142, '2017-12-04', '1c:59:dc:9f:4a:93', '', 'Quatorzain', 'YXM47OHY8SY', 'Sin comentarios'),
(928427, 100672, '2017-05-22', '2e:7e:ef:56:ba:bc', '', 'Mastology', 'GSS19UQJ2YK', 'Sin comentarios'),
(928428, 100891, '2018-04-04', '4f:5b:01:df:d1:a6', '', 'Graptomancy', 'UBB05ATV3CQ', 'Sin comentarios'),
(928429, 100821, '2017-09-03', '97:e5:79:3f:d7:4b', '', 'Infinitism', 'ZYB09PFP7GB', 'Sin comentarios'),
(928430, 100742, '2017-10-31', '87:f8:3b:0b:21:40', '', 'Patroon', 'MWB31CAX7XQ', 'Sin comentarios'),
(928431, 100819, '2017-10-28', '9b:7f:f9:4b:ba:98', '', 'Ubicity', 'IMI00NWB2QJ', 'Sin comentarios'),
(928432, 101132, '2018-01-16', '60:92:47:8c:29:cf', '', 'Dumbfounded', 'NAB48WIT5NG', 'Sin comentarios'),
(928433, 100988, '2018-02-03', 'bf:50:ea:08:2d:0e', '', 'Vibrissation', 'MUR98HND0QN', 'Sin comentarios'),
(928434, 100668, '2017-05-13', '02:60:3b:b6:c7:04', '', 'Ichthyoid', 'OJJ78IME3FF', 'Sin comentarios'),
(928435, 101115, '2017-10-31', 'd5:9c:5a:3d:c9:93', '', 'StrafeKob', 'ZGV71CQD9XN', 'Sin comentarios'),
(928436, 101147, '2018-03-29', '22:1e:dd:0c:29:1b', '', 'Subnubilar', 'MPA11NTM4VS', 'Sin comentarios'),
(928437, 100746, '2018-02-09', '50:a5:7f:7c:9b:22', '', 'Sitology', 'ZLM89OTA8AG', 'Sin comentarios'),
(928438, 101134, '2017-03-26', '98:1c:f5:0c:44:1b', '', 'Aration', 'ISF71YFO9NE', 'Sin comentarios'),
(928439, 100810, '2018-03-07', '05:87:08:71:8d:1a', '', 'RickybelFanion', 'HNB93CWE7EA', 'Sin comentarios'),
(928440, 101127, '2018-03-04', '4a:8d:9d:14:96:04', '', 'Pixilated', 'TOP14NYB5HO', 'Sin comentarios'),
(928441, 100882, '2017-05-15', '07:d5:e6:a2:a5:b5', '', 'Itisvidv78', 'CQH94SOL3CR', 'Sin comentarios'),
(928442, 100797, '2017-06-17', 'e8:9a:90:38:f1:5d', '', 'Megalography', 'QDU52MII4NV', 'Sin comentarios'),
(928443, 101088, '2017-09-28', '2d:22:ce:21:d7:b2', '', 'Gharrylolz', 'OKP17PZY0LZ', 'Sin comentarios'),
(928444, 100852, '2017-09-24', '62:45:87:1c:d9:d1', '', 'Yakhdan', 'YAO86AUC8OQ', 'Sin comentarios'),
(928445, 100990, '2017-11-02', 'e2:40:c5:b7:25:8c', '', 'Jackt80088', 'MPL78AFG7ZG', 'Sin comentarios'),
(928446, 101080, '2018-01-08', '2b:96:34:65:a0:29', '', 'Withershins', 'LWV45GYA1VK', 'Sin comentarios'),
(928447, 101151, '2018-05-09', '84:4c:35:b0:25:59', '', 'Volucrine', 'DXD66RQE4FK', 'Sin comentarios'),
(928448, 101064, '2018-04-04', 'd2:13:bc:3d:ed:f4', '', 'Acequia', 'XCD29KGQ9WQ', 'Sin comentarios'),
(928449, 100619, '2018-03-04', 'da:d9:67:96:42:86', '', 'Loomybunny1', 'XOK93IJK0OJ', 'Sin comentarios'),
(928450, 100690, '2017-08-28', '95:39:1d:30:cd:e3', '', 'Plumulate', 'FVW51AKP0AN', 'Sin comentarios'),
(928451, 100959, '2017-04-01', '77:6f:28:c9:92:2b', '', 'Retrahent', 'ZWW27FQI9AC', 'Sin comentarios'),
(928452, 100794, '2017-05-17', 'd0:e2:c0:09:af:d9', '', 'Quatridual', 'VEZ25TVT8YA', 'Sin comentarios'),
(928453, 100645, '2017-06-11', '99:a2:77:bd:02:2b', '', 'Bodachshen', 'BTI90TPF5KR', 'Sin comentarios'),
(928454, 101174, '2017-05-17', '7e:ac:cd:f9:71:fe', '', 'Noesisvan117', 'UAP78WGK6IJ', 'Sin comentarios'),
(928455, 100876, '2017-07-26', '76:89:77:98:c5:49', '', 'Vacillate', 'KJK07SVQ9YB', 'Sin comentarios'),
(928456, 101108, '2018-02-15', '2d:a2:a1:1e:f2:fc', '', 'Pelisse', 'YPB58JEM6HT', 'Sin comentarios'),
(928457, 100675, '2017-12-04', 'ab:26:20:ae:32:06', '', 'Syncrasy', 'YOW13WBV2GK', 'Sin comentarios'),
(928458, 100873, '2017-11-03', '60:0f:3f:18:19:19', '', 'MineVirage', 'XSR85QYN8BW', 'Sin comentarios'),
(928459, 100620, '2017-04-26', '79:93:78:1a:a2:65', '', 'Totipotent', 'NPY00TEY7WK', 'Sin comentarios'),
(928460, 100725, '2017-11-22', '36:28:7b:da:24:f7', '', 'GoldshellOctan', 'JJO74EUU6XR', 'Sin comentarios'),
(928461, 100930, '2017-04-04', '2e:7f:17:d9:1a:1d', '', 'Tetraptych', 'GXL92EUR9LJ', 'Sin comentarios'),
(928462, 100691, '2017-05-18', '5a:2d:d5:19:85:e4', '', 'Ballyhoo', 'VVL32PRT9TT', 'Sin comentarios'),
(928463, 101091, '2017-08-02', '0a:84:56:10:71:12', '', 'Demiurgic', 'VIC36XGL3ZO', 'Sin comentarios'),
(928464, 100710, '2017-09-08', 'a4:ef:aa:83:06:21', '', 'Soniferous', 'XMU20NXL3ZH', 'Sin comentarios'),
(928465, 101158, '2017-05-17', '04:ca:9b:ca:2c:90', '', 'Fringe10Angora', 'BDH68VZV9UF', 'Sin comentarios'),
(928466, 101079, '2018-02-04', '2a:e2:a3:75:bf:f8', '', 'Galvanometer', 'XEN20DOK6MV', 'Sin comentarios'),
(928467, 100713, '2018-02-10', '7f:8a:0e:ad:97:44', '', 'Periodontics', 'VVI78CNE3XL', 'Sin comentarios'),
(928468, 100655, '2018-02-06', '05:59:49:94:00:19', '', 'Effigurate', 'AHU33UIL6JX', 'Sin comentarios'),
(928469, 101078, '2017-03-24', '65:8d:0d:43:81:ed', '', 'Witling', 'OQI02LGF3EZ', 'Sin comentarios'),
(928470, 100681, '2017-12-31', 'dd:9c:fc:be:08:29', '', 'Pyrophobia', 'DDD17ISJ5CM', 'Sin comentarios'),
(928471, 100885, '2017-04-19', 'df:67:3d:8e:28:61', '', 'Multisulcate', 'MJM54XOX7EO', 'Sin comentarios'),
(928472, 100941, '2017-10-01', '0d:ce:82:85:f8:90', '', 'Prurigo', 'ZJK99TCJ8NS', 'Sin comentarios'),
(928473, 100833, '2017-12-28', 'd7:59:45:35:88:cf', '', 'Nidorosity', 'PCJ52QVM8ZB', 'Sin comentarios'),
(928474, 100642, '2017-09-01', '20:05:94:1e:39:3e', '', 'Risible', 'HKW42ZVQ2XH', 'Sin comentarios'),
(928475, 101113, '2017-11-27', 'f0:25:8c:43:af:3c', '', 'Systaltic', 'YAW32ZRH3AD', 'Sin comentarios'),
(928476, 100605, '2018-01-13', '66:46:c0:3c:76:fb', '', 'Centennial', 'SRW32EMD9EK', 'Sin comentarios'),
(928477, 100607, '2017-08-24', '45:bc:2a:db:ac:e8', '', 'Princeps', 'ZXV51KYP2FU', 'Sin comentarios'),
(928478, 101042, '2017-06-23', 'a7:f1:5e:c1:82:aa', '', 'Ordinant', 'EHO80AGE7MF', 'Sin comentarios'),
(928479, 101008, '2017-12-15', '5e:5d:4e:1f:96:20', '', 'Tatonnement', 'XKC21XNK5VC', 'Sin comentarios'),
(928480, 100887, '2017-05-08', '7f:1f:46:be:b6:44', '', 'Stratiform', 'ABW15DND7ZA', 'Sin comentarios'),
(928481, 101158, '2017-10-23', '0d:15:34:8c:be:a9', '', 'Boethetic', 'DHQ48BUP3LR', 'Sin comentarios'),
(928482, 100842, '2017-12-29', 'a4:67:30:15:0f:75', '', 'Pasquin', 'LTV50BQC3MC', 'Sin comentarios'),
(928483, 101075, '2017-06-20', 'b5:50:95:d5:80:98', '', 'Ultiondoe98', 'TKL90XRZ0QC', 'Sin comentarios'),
(928484, 100746, '2017-06-12', 'b6:04:28:86:a2:84', '', 'Neophrastic', 'TRP55VBN4IE', 'Sin comentarios'),
(928485, 100881, '2017-10-04', '70:89:b1:c3:8e:d9', '', 'Leptometer', 'RGG81VLL7ZN', 'Sin comentarios'),
(928486, 101150, '2017-09-13', '4c:db:bd:15:c5:ae', '', 'Spidermarys', 'CLA65AQR7WN', 'Sin comentarios'),
(928487, 100767, '2017-12-29', '1a:5f:93:8f:f6:df', '', 'Cavaquinho', 'BLD64AGE5IS', 'Sin comentarios'),
(928488, 100988, '2017-07-11', 'c0:72:e4:df:a6:ae', '', 'Velvetine', 'QNZ06UVP4OY', 'Sin comentarios'),
(928489, 101044, '2017-06-07', 'ec:ba:2d:b7:a0:58', '', 'Lychgate', 'ZCV49RDS1TR', 'Sin comentarios'),
(928490, 100849, '2017-06-23', 'c1:4e:0e:14:73:f6', '', 'Wisteria', 'WIL63NRM2KY', 'Sin comentarios'),
(928491, 101160, '2018-03-09', '9d:00:47:74:fe:70', '', 'LollopIncult', 'GDL62ZMW8IM', 'Sin comentarios'),
(928492, 101178, '2017-11-30', '81:04:eb:0d:a1:35', '', 'Capuchin', 'SCIFCU637', 'Sin comentarios'),
(928493, 100988, '2018-03-15', '8b:0b:c3:1f:91:1e', '', 'Paciferous', 'HWFDAZ859', 'Sin comentarios'),
(928494, 101090, '2017-05-18', 'ca:a4:07:ef:0f:d8', '', 'Tranche', 'BLJTFH313', 'Sin comentarios'),
(928495, 100944, '2018-02-06', '13:54:b5:a8:39:5d', '', 'Unicornic', 'LBWFCC642', 'Sin comentarios'),
(928496, 100603, '2018-01-21', 'de:5d:9f:cc:b0:81', '', 'Pneumatolith', 'HFEENB320', 'Sin comentarios'),
(928497, 100919, '2017-04-27', '72:44:81:cf:b9:8f', '', 'Helminth', 'MYRPXO272', 'Sin comentarios'),
(928498, 100675, '2018-01-07', 'ed:26:fd:b5:4f:f4', '', 'Hephaestic', 'NMNBTV946', 'Sin comentarios'),
(928499, 100954, '2017-03-23', 'cf:54:18:be:9a:a7', '', 'Mabsoot', 'COLKEC048', 'Sin comentarios'),
(928500, 100657, '2017-12-10', '09:20:4b:af:6d:ce', '', 'ElegRowen', 'CFGQUZ337', 'Sin comentarios'),
(928501, 100738, '2018-02-22', '69:ca:ee:77:17:06', '', 'Magnificat', 'WMZVQF090', 'Sin comentarios'),
(928502, 100661, '2017-04-19', '41:e1:6a:77:10:fc', '', 'Seriema', 'BIATEK261', 'Sin comentarios'),
(928503, 101148, '2017-08-19', 'ed:f9:61:01:e3:47', '', 'Urinometer', 'JKWXLL193', 'Sin comentarios'),
(928504, 101151, '2017-12-05', '04:5c:56:44:53:8a', '', 'Languid', 'TYXNZL850', 'Sin comentarios'),
(928505, 100688, '2017-08-10', '7e:ae:05:cd:35:f7', '', 'Mullion', 'KUVJFL737', 'Sin comentarios'),
(928506, 101106, '2017-04-01', 'b2:98:27:81:b5:51', '', 'Photicter1092', 'KFQSEJ405', 'Sin comentarios'),
(928507, 100982, '2017-05-21', '0b:60:d6:62:c2:dc', '', 'Navalism', 'SRDAMN701', 'Sin comentarios'),
(928508, 101132, '2017-11-16', '29:b8:18:19:c3:8a', '', 'Sussurous', 'HBFRGC202', 'Sin comentarios'),
(928509, 100774, '2017-08-15', '34:c3:59:75:fe:c1', '', 'Sommelier', 'QBIUQB366', 'Sin comentarios'),
(928510, 100660, '2017-04-28', '45:cb:34:2c:6d:05', '', 'Canephor', 'VNLKIT211', 'Sin comentarios'),
(928511, 101000, '2017-07-18', '84:c3:34:d8:58:a5', '', 'Murrain', 'ITPJKL833', 'Sin comentarios'),
(928512, 100885, '2017-08-13', '5e:e1:f6:e4:96:27', '', 'Empaestic', 'VAGFRQ706', 'Sin comentarios'),
(928513, 100749, '2017-06-15', '6f:1f:6a:13:b7:96', '', 'Moirologist', 'QSSRBW868', 'Sin comentarios'),
(928514, 100853, '2017-12-12', '16:65:4c:68:d8:7c', '', 'Miniscule', 'JRRQSC078', 'Sin comentarios'),
(928515, 100606, '2017-09-03', 'd6:28:b3:01:92:4a', '', 'Pteryla', 'CIMFXJ577', 'Sin comentarios'),
(928516, 101043, '2017-09-13', '23:6b:18:f4:8a:f3', '', 'Desiderium', 'BZLEUD443', 'Sin comentarios'),
(928517, 101087, '2017-08-09', 'be:f2:a2:63:d3:92', '', 'Parapet', 'LEUXSV328', 'Sin comentarios'),
(928518, 100907, '2017-07-17', 'b3:d1:4b:c5:d2:45', '', 'Suberic', 'YOBXOT508', 'Sin comentarios'),
(928519, 101153, '2017-05-02', '6a:00:96:8c:a0:9e', '', 'Alamode', 'KQKTAP475', 'Sin comentarios'),
(928520, 100966, '2017-05-22', '7f:a5:b4:48:85:77', '', 'Singult', 'VKFPXV304', 'Sin comentarios'),
(928521, 100991, '2017-09-17', 'a3:f2:19:7c:de:59', '', 'BibliocTrigon', 'QPEHIT990', 'Sin comentarios'),
(928522, 100987, '2017-12-08', 'fc:28:e1:4b:3c:81', '', 'ImasPogey', 'FTOEUR311', 'Sin comentarios'),
(928523, 101117, '2017-06-03', '1e:fc:07:7b:1d:7f', '', 'ThelorsNuncio', 'OHBTVH600', 'Sin comentarios'),
(928524, 101075, '2017-12-07', '1b:bd:a8:40:5d:86', '', 'Trisulcate', 'KUUEGW093', 'Sin comentarios'),
(928525, 100798, '2018-04-14', '07:d7:80:5a:4e:96', '', 'KremowUkase', 'ULLLSX120', 'Sin comentarios'),
(928526, 101067, '2018-04-13', '44:33:db:d4:ee:b0', '', 'Larviparous', 'WWZVEK838', 'Sin comentarios'),
(928527, 100847, '2018-03-05', 'e1:20:1b:3c:54:31', '', 'Gallophobia', 'MRBUTB715', 'Sin comentarios'),
(928528, 100919, '2018-03-03', '6e:fd:7a:68:f5:5d', '', 'Keyline', 'KTBSBG915', 'Sin comentarios'),
(928529, 100619, '2018-02-28', '47:af:30:0c:1e:dd', '', 'Xxkitty_clawsOctroi', 'BSEZZC001', 'Sin comentarios'),
(928530, 100779, '2018-02-24', 'fa:08:3a:4f:bf:08', '', 'Absolutive', 'MTJFPK105', 'Sin comentarios'),
(928531, 101062, '2018-03-03', '73:c2:6b:6c:14:eb', '', 'Trutinate', 'GVIIDR338', 'Sin comentarios'),
(928532, 100991, '2018-01-19', '53:27:66:60:04:ef', '', 'Glossology', 'VKEGBX201', 'Sin comentarios'),
(928533, 100854, '2017-11-13', 'ea:86:84:0e:b2:d7', '', 'Phyllomancy', 'BJPVNT326', 'Sin comentarios'),
(928534, 100786, '2017-11-03', 'bc:10:fe:33:8a:3d', '', 'Nosocomial', 'CANSCN909', 'Sin comentarios'),
(928535, 100710, '2017-09-15', '7d:7a:fd:29:e6:8d', '', 'FtpfaroVarec', 'IYZCEZ249', 'Sin comentarios'),
(928536, 100697, '2017-06-06', '22:27:e0:c6:5c:fe', '', 'Demarche', 'LEHOKU393', 'Sin comentarios'),
(928537, 100661, '2018-01-10', '97:8e:99:08:f6:0a', '', 'Lablabpotz', 'NVOSUJ553', 'Sin comentarios'),
(928538, 100989, '2018-04-01', '40:1f:44:27:dd:c8', '', 'Limerence', 'HRQLTI910', 'Sin comentarios'),
(928539, 100629, '2018-04-02', 'bc:c9:da:28:d5:8a', '', 'Crepehanger', 'KYNYEP836', 'Sin comentarios'),
(928540, 100895, '2017-05-27', 'f6:3d:9d:7d:3f:b3', '', 'Hooeyter196', 'GWOFCZ835', 'Sin comentarios'),
(928541, 100669, '2017-04-21', 'be:9d:06:0a:3a:25', '', 'Deekhkitty69', 'PECFFV919', 'Sin comentarios'),
(928542, 100961, '2017-08-20', '42:d2:64:64:72:df', '', 'Yachtyquall79798', 'EAEUKS502', 'Sin comentarios'),
(928543, 100644, '2017-03-17', '66:6a:c3:70:61:03', '', 'Rhipidate', 'FANVWE304', 'Sin comentarios'),
(928544, 100606, '2017-08-25', 'ba:1d:7b:ec:6d:fd', '', 'Calcimine', 'FFCBJK482', 'Sin comentarios'),
(928545, 100815, '2017-09-13', '5b:1e:d6:7d:1a:56', '', 'Winnowtech123', 'OHCUCF260', 'Sin comentarios'),
(928546, 101035, '2017-12-12', '56:1f:ce:f5:41:13', '', 'Daphnean', 'POQSFZ349', 'Sin comentarios'),
(928547, 100726, '2017-08-22', '61:bc:30:e0:44:ad', '', 'Thereology', 'JVQPDL319', 'Sin comentarios'),
(928548, 100846, '2017-09-29', '37:85:fd:ae:94:aa', '', 'Straticulate', 'XHFSGG067', 'Sin comentarios'),
(928549, 101063, '2017-12-29', '62:50:07:52:b2:eb', '', 'Instructive', 'EIREWX007', 'Sin comentarios'),
(928550, 100881, '2018-02-19', '3b:6a:25:5b:87:f5', '', 'Olericulture', 'QOWOOU666', 'Sin comentarios'),
(928551, 101001, '2017-05-15', 'a4:e9:fd:13:08:37', '', 'Narthecal', 'IYJJUQ764', 'Sin comentarios'),
(928552, 100983, '2017-10-07', '8e:ee:e8:d6:59:81', '', 'Abderian', 'UWBLRS622', 'Sin comentarios'),
(928553, 101082, '2017-10-06', '27:06:3a:c3:c8:c2', '', 'Demigration', 'WVQIEY706', 'Sin comentarios'),
(928554, 101021, '2017-12-05', 'd5:f8:05:e9:48:a0', '', 'Dubiety', 'XTMGFY012', 'Sin comentarios'),
(928555, 100774, '2017-11-11', '4f:8a:04:fd:dc:f6', '', 'TobiasPunnet', 'WRPPMQ064', 'Sin comentarios'),
(928556, 100673, '2017-09-13', '87:d1:fb:ef:a7:57', '', 'Acropathy', 'WLMKUQ960', 'Sin comentarios'),
(928557, 101050, '2018-02-15', 'c3:83:df:b4:67:95', '', 'SplitlevZyrian', 'NBYOHM305', 'Sin comentarios'),
(928558, 100786, '2017-05-07', '53:a7:af:38:e4:7a', '', 'Tetrapod', 'GMVFXN781', 'Sin comentarios'),
(928559, 101051, '2017-05-12', '2c:5b:07:40:f8:d8', '', 'Aardwolf', 'RXNAKL310', 'Sin comentarios'),
(928560, 100941, '2017-11-10', 'ea:f2:12:da:5f:46', '', 'Gynaecology', 'SSRGZB029', 'Sin comentarios'),
(928561, 100801, '2017-12-12', 'fa:d6:01:69:4c:77', '', 'Lactometer', 'QCWUBU915', 'Sin comentarios'),
(928562, 100930, '2017-09-01', 'f0:fe:ef:bc:b0:a9', '', 'Luminous', 'WXACQE378', 'Sin comentarios'),
(928563, 101027, '2017-03-24', '93:d4:9a:3b:32:33', '', 'Equipoise', 'DDQRSS639', 'Sin comentarios'),
(928564, 100821, '2017-10-10', 'c7:4c:ad:b8:51:de', '', 'Jesuitical', 'FNPMOL100', 'Sin comentarios'),
(928565, 101061, '2018-03-05', '7b:22:3a:87:be:01', '', 'Bentri1Enjoin', 'TENTIV142', 'Sin comentarios'),
(928566, 100948, '2018-01-24', 'c3:2f:9c:67:fa:c1', '', 'MskiaClonic', 'YXIGGJ091', 'Sin comentarios'),
(928567, 100751, '2017-05-17', 'db:fd:6a:62:53:65', '', 'Curtilage', 'EDQDKL704', 'Sin comentarios'),
(928568, 101187, '2017-08-17', '6c:f4:9f:87:49:19', '', 'Photoglyph', 'GGASOM316', 'Sin comentarios'),
(928569, 101032, '2017-12-19', '9f:51:b0:94:6b:56', '', 'Abderian', 'KNVELR181', 'Sin comentarios'),
(928570, 100637, '2017-05-09', '35:95:d8:6f:5d:9e', '', 'Gorgoneion', 'SYPCFV734', 'Sin comentarios'),
(928571, 100979, '2017-05-03', '05:72:1b:c9:7b:d4', '', 'Spoliate', 'EBZDXL266', 'Sin comentarios'),
(928572, 100678, '2017-10-28', '0a:b4:33:68:93:f5', '', 'Hebenon', 'DMPIGT664', 'Sin comentarios'),
(928573, 101100, '2017-07-10', '91:3e:cc:48:c8:cd', '', 'Thurible', 'BYYQQS058', 'Sin comentarios'),
(928574, 100772, '2017-04-28', '60:b0:3f:60:57:ac', '', 'Paralogism', 'SQWDLC052', 'Sin comentarios'),
(928575, 100872, '2017-08-07', '14:d5:75:7b:1c:3a', '', 'Muricate', 'UBEGSJ351', 'Sin comentarios'),
(928576, 100948, '2018-03-11', '27:e2:26:d0:b2:da', '', 'Viminal', 'CITJXI186', 'Sin comentarios'),
(928577, 100749, '2017-06-17', 'c0:66:3e:84:8b:69', '', 'Lapactic', 'BWTOWE771', 'Sin comentarios'),
(928578, 100902, '2017-12-15', '90:8c:bf:53:6c:ec', '', 'Vinayajoul23', 'VWIOHQ810', 'Sin comentarios'),
(928579, 100852, '2018-02-15', '58:a4:2b:c5:15:77', '', 'Protogenic', 'YPPGII221', 'Sin comentarios'),
(928580, 100860, '2017-11-01', 'd3:50:54:ac:d9:fb', '', 'Quantsoftnt', 'TPHXPR842', 'Sin comentarios'),
(928581, 100833, '2017-12-02', '61:fd:32:ef:b1:16', '', 'Clypeate', 'ISKYAS224', 'Sin comentarios'),
(928582, 100888, '2017-10-29', '94:8d:fb:a0:f7:90', '', 'Foveiform', 'ZVMSQQ220', 'Sin comentarios'),
(928583, 101019, '2017-10-10', '79:74:08:c8:12:71', '', 'Mannequin', 'CGGBAA760', 'Sin comentarios'),
(928584, 101017, '2017-09-02', '95:80:0f:48:33:14', '', 'Proveditor', 'ENYBUX056', 'Sin comentarios'),
(928585, 100790, '2018-02-26', '6e:47:ce:60:22:b4', '', 'Bimetallism', 'WGHKHM885', 'Sin comentarios'),
(928586, 101013, '2017-07-27', '84:cc:a2:ca:82:bc', '', 'Advowson', 'RVZXBP638', 'Sin comentarios'),
(928587, 101185, '2017-06-22', 'a8:46:29:a5:99:54', '', 'Meninges', 'UNUFNZ503', 'Sin comentarios'),
(928588, 101102, '2017-08-03', '32:12:25:99:aa:e3', '', 'Lygerastia', 'LHHJAL469', 'Sin comentarios'),
(928589, 100930, '2017-11-08', '75:72:d0:a8:27:d2', '', 'Zibeline', 'TOGOOG986', 'Sin comentarios'),
(928590, 101031, '2017-03-24', '40:b8:96:15:84:49', '', 'Rubberneck', 'FNLBSY192', 'Sin comentarios'),
(928591, 100824, '2018-01-11', '10:e9:b4:32:39:7b', '', 'Mewling', 'KOVNLP561', 'Sin comentarios'),
(928592, 100687, '2017-03-23', '1e:01:13:5b:3b:d6', '', 'Maquette', 'FHA73LR', 'Sin comentarios'),
(928593, 101087, '2017-06-17', 'c0:ec:90:02:5e:2d', '', 'Battologize', 'LIY23DZ', 'Sin comentarios'),
(928594, 100787, '2017-12-30', '3b:19:a8:3a:74:d9', '', 'Sunniness', 'WCB12XU', 'Sin comentarios'),
(928595, 100716, '2017-02-10', 'c4:26:57:72:71:6d', '', 'Symposium', 'ZFZ46RL', 'Sin comentarios'),
(928596, 101022, '2017-08-01', '73:bb:28:f7:af:f9', '', 'Jammin?', 'RGJ86HO', 'Sin comentarios'),
(928597, 100993, '2017-07-03', '9c:98:89:d3:20:77', '', 'Ekaggata', 'DGD38XY', 'Sin comentarios'),
(928598, 101044, '2017-11-24', '12:53:c5:9b:81:7f', '', 'Estuary', 'XZC65UR', 'Sin comentarios'),
(928599, 100956, '2018-02-04', 'ed:7e:7b:1e:ca:35', '', 'LittlerHumor', 'TIU45ZN', 'Sin comentarios'),
(928600, 100748, '2017-06-12', 'bc:ca:44:c6:e0:e3', '', 'Laconic', 'AHD93HS', 'Sin comentarios'),
(928601, 100872, '2017-09-06', '70:63:87:8a:5d:13', '', 'Nainsook', 'LIC62PQ', 'Sin comentarios'),
(928602, 100823, '2017-11-17', '92:99:a4:07:46:93', '', 'Hyacinth', 'GAJ25YU', 'Sin comentarios'),
(928603, 101045, '2017-10-14', '6b:76:55:a2:e7:a8', '', 'Stylite', 'SVA29XY', 'Sin comentarios'),
(928604, 100812, '2017-06-24', 'ae:23:c5:04:ea:98', '', 'EnchevClaggy', 'TCL53UM', 'Sin comentarios'),
(928605, 101106, '2018-02-14', '9e:43:0a:72:bd:a7', '', 'Caesious', 'GUU86HH', 'Sin comentarios'),
(928606, 100668, '2017-04-25', 'af:82:35:be:3a:05', '', 'Incorporeal', 'DUK92IX', 'Sin comentarios'),
(928607, 100876, '2017-08-16', 'f0:4d:b0:b1:20:42', '', 'JessjesSarmie', 'UHL33EE', 'Sin comentarios'),
(928608, 100896, '2017-11-27', '4d:6f:aa:2c:8f:97', '', 'Umbrage', 'CPG32XT', 'Sin comentarios'),
(928609, 100990, '2017-07-18', '22:d8:69:69:ba:55', '', 'FlasholQuiet', 'FZQ21GO', 'Sin comentarios'),
(928610, 101044, '2017-09-27', 'd7:34:71:55:57:16', '', 'JennanPollex', 'ZTN45WB', 'Sin comentarios'),
(928611, 100651, '2018-01-08', '2d:3b:aa:2c:69:d7', '', 'Acciaccatura', 'NSO38XX', 'Sin comentarios'),
(928612, 100823, '2017-06-21', '12:e8:e6:ce:34:79', '', 'Achievements', 'ZTI55ZG', 'Sin comentarios'),
(928613, 100804, '2017-10-14', '9e:72:d2:b6:87:f6', '', 'Thionine', 'WLI77WE', 'Sin comentarios'),
(928614, 101180, '2017-10-01', '86:f3:6a:a3:42:60', '', 'Appreciable', 'UKC27HL', 'Sin comentarios'),
(928615, 101022, '2018-01-14', 'db:7f:bc:9b:09:bf', '', 'Oeuvrekat19', 'IYQ91BG', 'Sin comentarios'),
(928616, 100689, '2017-12-26', '3f:bd:4b:67:0c:7b', '', 'Carphology', 'PBE62IC', 'Sin comentarios'),
(928617, 100694, '2017-12-17', '17:46:43:24:bf:1e', '', 'Exultant', 'MRE21LY', 'Sin comentarios'),
(928618, 100615, '2017-04-17', '60:25:c4:84:d2:bc', '', 'Treatway24', 'WMO77UW', 'Sin comentarios'),
(928619, 101089, '2018-01-02', 'bb:46:61:9e:8b:34', '', 'Resilient', 'GXL94NM', 'Sin comentarios'),
(928620, 100918, '2017-06-13', 'd3:ab:83:d8:28:d2', '', 'Serenity', 'SSE69FZ', 'Sin comentarios'),
(928621, 100760, '2018-03-17', '94:e2:79:c6:bd:c8', '', 'Palliate', 'HSH87YM', 'Sin comentarios'),
(928622, 101055, '2017-06-30', 'cc:30:37:63:a9:1c', '', 'Parapente', 'HXS62LJ', 'Sin comentarios'),
(928623, 100951, '2017-05-12', '50:e4:c0:79:f6:05', '', 'Majorloodr41nxx', 'ZUM81FR', 'Sin comentarios'),
(928624, 100943, '2017-09-09', 'ce:38:0f:a1:a0:75', '', 'Mystique', 'WRB48CJ', 'Sin comentarios'),
(928625, 101191, '2018-01-13', '6e:a3:6b:17:c0:9b', '', 'Boffola', 'XND13TF', 'Sin comentarios'),
(928626, 101082, '2017-07-22', 'e5:8b:ba:bf:e9:40', '', 'Lattice', 'HWB67FL', 'Sin comentarios'),
(928627, 100925, '2017-09-23', 'cc:4c:bf:03:59:1f', '', 'Caprice', 'SHR49UY', 'Sin comentarios'),
(928628, 100616, '2017-04-20', '76:7e:12:76:48:c6', '', 'Caringluuk5991', 'KPS63AB', 'Sin comentarios'),
(928629, 100933, '2017-11-17', 'fc:6e:6c:f8:aa:5e', '', 'Facility', 'WEO19TN', 'Sin comentarios'),
(928630, 100613, '2017-08-26', 'ac:4a:2e:5a:07:29', '', 'Advantages', 'QDZ18LR', 'Sin comentarios'),
(928631, 100900, '2018-03-18', '33:75:3f:d7:c7:0b', '', 'Intrepid', 'ERY46GI', 'Sin comentarios'),
(928632, 101010, '2018-02-18', 'a5:d5:d3:e6:6c:38', '', 'AmbiCraig', 'RXK93SQ', 'Sin comentarios'),
(928633, 100791, '2017-09-26', '88:45:93:9f:40:6f', '', 'Hambone', 'CRJ64EI', 'Sin comentarios'),
(928634, 100807, '2017-09-10', 'e7:9d:78:79:fd:bb', '', 'SteffieNibble', 'DUQ45ZC', 'Sin comentarios'),
(928635, 100983, '2017-12-04', '88:8e:71:bc:d0:66', '', 'Cowabunga', 'CKW16QO', 'Sin comentarios'),
(928636, 101148, '2018-01-06', '99:af:b1:97:c1:0c', '', 'CakedKvetch', 'ZCV23QP', 'Sin comentarios'),
(928637, 100976, '2017-06-08', 'a1:db:d6:97:68:8b', '', 'Kumquat', 'FKR52HP', 'Sin comentarios'),
(928638, 101047, '2017-12-18', 'd6:23:5b:37:95:dd', '', 'Scabrous', 'XDF17QX', 'Sin comentarios'),
(928639, 100818, '2017-10-10', '43:7d:f0:d4:99:b2', '', 'Svengali', 'LSV12JB', 'Sin comentarios'),
(928640, 100940, '2018-02-02', '50:46:28:71:48:f9', '', 'Harumscarum', 'CVC99XJ', 'Sin comentarios'),
(928641, 100688, '2017-10-08', 'e5:15:cd:92:7d:72', '', 'Gallivant', 'HQC68VJ', 'Sin comentarios'),
(928642, 101098, '2017-09-05', '29:72:19:4c:47:42', '', 'Bibliopole', 'VXK75ZS', 'Sin comentarios'),
(928643, 101117, '2018-03-13', '3a:48:f1:7f:06:70', '', 'GloamMeep', 'BPZ62TE', 'Sin comentarios'),
(928644, 100609, '2017-11-11', '57:8b:0e:64:2d:83', '', 'Cuirass', 'VFZ25FY', 'Sin comentarios'),
(928645, 100980, '2017-09-27', 'bc:4c:93:1a:62:1e', '', 'Footloose', 'ZMA12OS', 'Sin comentarios'),
(928646, 100908, '2018-03-17', 'f4:f4:9b:e6:b3:27', '', 'Furbelows', 'TTU66PZ', 'Sin comentarios'),
(928647, 100770, '2018-01-17', 'a4:50:08:6e:24:dc', '', 'Plethora', 'ERN53WZ', 'Sin comentarios'),
(928648, 100817, '2018-05-17', 'de:f2:2f:25:97:a9', '', 'Hairpin', 'VBD15TL', 'Sin comentarios'),
(928649, 101180, '2017-10-28', 'fc:64:78:4f:a6:65', '', 'Rijsttaffel', 'ULZ28ZR', 'Sin comentarios'),
(928650, 101088, '2017-12-27', '51:a4:60:57:f2:b1', '', 'Quibble', 'EVN44CH', 'Sin comentarios'),
(928651, 100830, '2017-07-03', '65:cd:d1:8d:d2:53', '', 'Lugubrious', 'MJC17OX', 'Sin comentarios'),
(928652, 101199, '2018-03-08', 'e6:ac:5d:82:50:3c', '', 'Snuffle', 'UCY65XD', 'Sin comentarios'),
(928653, 100813, '2017-05-03', '1c:f7:1f:a3:b7:22', '', 'Tuberbrown64', 'NBW89RD', 'Sin comentarios'),
(928654, 100830, '2017-11-11', '93:40:40:84:4f:a7', '', 'Netiquette', 'MAO29LR', 'Sin comentarios'),
(928655, 100606, '2017-06-20', '52:04:d9:24:0a:64', '31.86.48.193', '', '', 'Sin comentarios'),
(928656, 100788, '2017-03-19', '54:82:ca:1f:08:8a', '189.180.107.254', '', '', 'Sin comentarios'),
(928657, 100770, '2017-12-05', '9b:91:91:25:f2:69', '169.162.101.138', '', '', 'Sin comentarios'),
(928658, 100612, '2017-12-02', 'f7:f8:f1:00:fe:fe', '26.53.164.185', '', '', 'Sin comentarios'),
(928659, 101186, '2017-12-20', 'c5:af:d3:9b:65:b4', '178.65.26.28', '', '', 'Sin comentarios'),
(928660, 100833, '2017-07-17', '39:ac:41:10:28:f4', '37.71.205.46', '', '', 'Sin comentarios'),
(928661, 101083, '2017-11-05', 'b8:ce:30:6d:2b:01', '167.29.104.227', '', '', 'Sin comentarios'),
(928662, 100982, '2017-11-07', '39:8a:54:61:71:f8', '158.104.205.20', '', '', 'Sin comentarios'),
(928663, 101004, '2017-12-11', '8d:b4:53:9e:49:6f', '29.66.200.72', '', '', 'Sin comentarios'),
(928664, 100738, '2017-08-04', '03:02:a1:4a:65:6a', '45.211.100.168', '', '', 'Sin comentarios'),
(928665, 101075, '2018-01-24', '95:07:db:fc:86:1d', '114.146.38.41', '', '', 'Sin comentarios'),
(928666, 101069, '2017-11-10', 'c8:b0:89:32:ef:d0', '244.33.148.64', '', '', 'Sin comentarios'),
(928667, 100788, '2017-10-18', 'a2:79:6b:5d:b4:83', '209.27.202.47', '', '', 'Sin comentarios'),
(928668, 101055, '2018-03-14', '18:d5:94:9c:86:79', '130.7.73.174', '', '', 'Sin comentarios'),
(928669, 101055, '2017-11-12', '7e:52:c6:a4:12:61', '184.76.195.58', '', '', 'Sin comentarios'),
(928670, 100888, '2017-11-14', '03:fb:cc:b9:a1:67', '106.50.96.116', '', '', 'Sin comentarios'),
(928671, 100850, '2017-06-22', '57:be:b5:78:af:34', '75.118.125.217', '', '', 'Sin comentarios'),
(928672, 101120, '2017-09-16', '6b:6c:03:99:7c:da', '99.53.26.187', '', '', 'Sin comentarios'),
(928673, 100760, '2018-02-10', 'e9:9d:10:10:72:f4', '20.230.24.106', '', '', 'Sin comentarios'),
(928674, 101181, '2017-09-07', 'bc:39:3b:81:8e:95', '62.106.61.134', '', '', 'Sin comentarios'),
(928675, 101134, '2017-09-20', '3e:00:ca:34:81:de', '233.23.196.128', '', '', 'Sin comentarios'),
(928676, 100729, '2017-05-11', '5f:8c:63:50:56:bb', '110.77.80.215', '', '', 'Sin comentarios'),
(928677, 100817, '2018-02-12', '37:e1:54:99:c6:c2', '26.75.43.209', '', '', 'Sin comentarios'),
(928678, 100753, '2017-02-22', '2d:55:e9:95:81:f5', '229.32.92.149', '', '', 'Sin comentarios'),
(928679, 100797, '2017-02-02', '9d:76:8a:c7:ab:fe', '71.11.97.163', '', '', 'Sin comentarios'),
(928680, 101013, '2018-04-01', '58:6b:ed:68:98:ac', '182.80.172.244', '', '', 'Sin comentarios'),
(928681, 100842, '2018-04-02', '36:77:32:b7:8a:d4', '24.153.156.201', '', '', 'Sin comentarios'),
(928682, 100875, '2017-07-10', 'eb:b9:a9:c3:b8:97', '184.90.246.68', '', '', 'Sin comentarios'),
(928683, 100921, '2017-09-24', '56:7a:65:a7:fc:11', '92.124.178.180', '', '', 'Sin comentarios'),
(928684, 100858, '2018-05-03', 'c6:a4:4f:4a:bd:90', '197.72.87.222', '', '', 'Sin comentarios'),
(928685, 100606, '2017-09-06', 'e3:ac:c9:e1:20:04', '217.67.154.95', '', '', 'Sin comentarios'),
(928686, 100793, '2018-02-09', '26:06:74:0b:2f:26', '171.18.9.186', '', '', 'Sin comentarios'),
(928687, 101063, '2017-08-17', 'b2:d4:e3:5b:ee:ee', '149.134.63.146', '', '', 'Sin comentarios'),
(928688, 100827, '2018-04-10', 'da:8c:68:a3:cb:d7', '24.249.48.133', '', '', 'Sin comentarios'),
(928689, 100845, '2017-08-01', '15:57:c1:ee:8f:0a', '171.153.73.243', '', '', 'Sin comentarios'),
(928690, 100672, '2017-10-21', '49:07:09:c7:64:af', '158.122.229.11', '', '', 'Sin comentarios'),
(928691, 100621, '2017-08-23', 'c6:35:9a:f0:d1:92', '22.114.198.154', '', '', 'Sin comentarios'),
(928692, 101121, '2017-10-20', 'a3:19:8a:18:7b:d1', '114.129.218.131', '', '', 'Sin comentarios'),
(928693, 100630, '2017-10-05', '95:1f:83:7e:a2:7a', '21.99.131.153', '', '', 'Sin comentarios'),
(928694, 101118, '2017-06-06', '23:85:30:e5:9a:56', '227.162.196.162', '', '', 'Sin comentarios'),
(928695, 100679, '2017-08-21', '02:a5:6c:6d:f3:3b', '216.99.134.60', '', '', 'Sin comentarios'),
(928696, 100676, '2017-06-16', '4c:96:0d:3c:e7:51', '93.247.77.189', '', '', 'Sin comentarios'),
(928697, 100872, '2017-10-12', '87:20:9e:5a:36:2c', '210.120.113.231', '', '', 'Sin comentarios'),
(928698, 101146, '2018-01-19', '81:3e:9a:8b:0a:10', '202.228.51.218', '', '', 'Sin comentarios'),
(928699, 101165, '2018-02-27', 'be:0d:ab:7c:72:03', '152.8.33.159', '', '', 'Sin comentarios'),
(928700, 101000, '2017-09-01', '46:5f:38:c4:e2:51', '13.28.195.8', '', '', 'Sin comentarios'),
(928701, 100731, '2017-12-08', 'c1:6d:a1:84:a5:ad', '67.177.215.112', '', '', 'Sin comentarios'),
(928702, 100654, '2018-03-14', '7c:1d:82:11:f0:60', '57.180.55.104', '', '', 'Sin comentarios'),
(928703, 100852, '2017-11-24', '60:0d:98:88:c3:23', '243.202.192.75', '', '', 'Sin comentarios'),
(928704, 100624, '2017-02-04', '24:fb:da:7c:76:e2', '210.225.42.23', '', '', 'Sin comentarios'),
(928705, 100742, '2017-04-16', '25:fe:85:04:98:b8', '48.17.17.247', '', '', 'Sin comentarios'),
(928706, 100639, '2017-11-09', 'a0:96:de:60:7a:57', '62.246.123.109', '', '', 'Sin comentarios'),
(928707, 100812, '2017-08-30', '3c:8f:51:44:43:be', '109.143.84.197', '', '', 'Sin comentarios'),
(928708, 101035, '2017-10-19', 'fb:83:49:41:86:1f', '56.139.19.29', '', '', 'Sin comentarios'),
(928709, 100908, '2017-10-26', '98:4a:34:16:67:44', '96.53.82.58', '', '', 'Sin comentarios'),
(928710, 100939, '2017-06-24', '54:9e:8b:ec:6b:71', '128.184.35.143', '', '', 'Sin comentarios'),
(928711, 100845, '2017-10-25', 'bd:18:5c:46:0a:a2', '22.207.208.176', '', '', 'Sin comentarios'),
(928712, 100752, '2017-05-21', '03:2c:1f:f1:ba:ee', '35.125.174.129', '', '', 'Sin comentarios'),
(928713, 100903, '2017-08-02', 'fe:c9:2c:2a:d4:f9', '21.25.127.199', '', '', 'Sin comentarios'),
(928714, 100809, '2017-09-17', '58:83:e7:3f:5e:5d', '112.130.253.241', '', '', 'Sin comentarios'),
(928715, 100710, '2017-05-19', '05:ec:4d:01:10:a6', '47.240.181.193', '', '', 'Sin comentarios'),
(928716, 100837, '2017-08-08', 'd5:e0:2b:ba:bc:2c', '70.108.161.114', '', '', 'Sin comentarios'),
(928717, 101058, '2017-04-17', 'd0:df:1a:50:29:ce', '44.217.223.204', '', '', 'Sin comentarios'),
(928718, 101161, '2017-06-13', 'f2:75:63:08:0e:d1', '152.21.152.233', '', '', 'Sin comentarios'),
(928719, 100675, '2017-09-17', '45:a2:b8:f9:8e:98', '53.140.14.112', '', '', 'Sin comentarios'),
(928720, 101015, '2018-02-11', '6c:59:d4:f4:5a:d6', '138.125.168.201', '', '', 'Sin comentarios'),
(928721, 100986, '2017-06-18', '95:17:e9:45:4b:49', '114.8.166.185', '', '', 'Sin comentarios'),
(928722, 100624, '2018-02-05', '31:19:a6:20:f1:a4', '188.142.245.171', '', '', 'Sin comentarios'),
(928723, 101075, '2017-06-23', 'd8:d9:6c:75:58:27', '246.79.254.7', '', '', 'Sin comentarios'),
(928724, 101100, '2017-03-13', '98:a1:52:f6:c5:c7', '46.84.7.148', '', '', 'Sin comentarios'),
(928725, 100907, '2017-04-05', '31:02:df:5f:9e:a9', '140.35.255.241', '', '', 'Sin comentarios'),
(928726, 100839, '2018-01-07', '47:11:82:c2:0e:69', '105.66.158.27', '', '', 'Sin comentarios'),
(928727, 100779, '2017-08-26', '8f:6a:68:94:cb:bf', '243.13.200.223', '', '', 'Sin comentarios'),
(928728, 101131, '2018-03-11', 'bb:4e:62:e3:8b:d7', '69.44.107.255', '', '', 'Sin comentarios'),
(928729, 100603, '2017-03-23', 'bd:6a:80:7c:2d:ce', '181.155.103.42', '', '', 'Sin comentarios'),
(928730, 100769, '2017-05-07', '7c:06:2f:0b:20:e6', '87.147.157.91', '', '', 'Sin comentarios'),
(928731, 101143, '2017-12-06', 'c1:54:8a:68:d5:e0', '68.167.10.126', '', '', 'Sin comentarios'),
(928732, 100942, '2017-10-15', '7b:a0:8f:33:e0:dd', '147.24.63.51', '', '', 'Sin comentarios'),
(928733, 100811, '2017-05-06', '0c:8c:40:d9:06:31', '128.207.17.31', '', '', 'Sin comentarios'),
(928734, 101070, '2017-07-01', '53:03:02:e2:0b:95', '73.28.26.49', '', '', 'Sin comentarios'),
(928735, 100965, '2017-11-21', '8a:b2:7a:30:bb:e8', '230.173.69.159', '', '', 'Sin comentarios'),
(928736, 100819, '2018-01-19', '92:da:d5:e2:25:66', '152.51.83.189', '', '', 'Sin comentarios'),
(928737, 101015, '2017-06-28', '11:cb:cf:ed:47:68', '44.182.194.168', '', '', 'Sin comentarios'),
(928738, 100670, '2017-08-17', 'a2:36:a0:8e:fb:d6', '246.165.97.113', '', '', 'Sin comentarios'),
(928739, 100730, '2017-06-06', '5b:3e:19:05:db:06', '143.53.71.28', '', '', 'Sin comentarios'),
(928740, 100700, '2017-12-08', 'f6:7d:4b:9a:c0:49', '85.86.30.135', '', '', 'Sin comentarios'),
(928741, 101138, '2018-01-19', 'aa:48:8e:d1:8b:a1', '71.73.124.185', '', '', 'Sin comentarios'),
(928742, 100922, '2018-03-01', '38:7b:c7:b2:cd:31', '225.43.178.233', '', '', 'Sin comentarios'),
(928743, 100840, '2017-07-06', '17:d5:c3:cc:48:dc', '229.110.63.24', '', '', 'Sin comentarios'),
(928744, 100651, '2017-06-17', 'f8:22:f5:b9:f8:9a', '119.122.229.130', '', '', 'Sin comentarios'),
(928745, 100631, '2018-03-05', 'de:f4:f4:5f:d9:7b', '218.8.175.170', '', '', 'Sin comentarios'),
(928746, 101115, '2017-09-04', '46:be:a4:e9:84:aa', '254.125.105.228', '', '', 'Sin comentarios'),
(928747, 101032, '2017-06-14', '07:34:9f:0e:87:c8', '28.54.74.234', '', '', 'Sin comentarios'),
(928748, 100687, '2017-08-24', '59:87:fd:62:67:40', '81.71.142.92', '', '', 'Sin comentarios'),
(928749, 101182, '2017-08-04', '19:fc:00:bf:8d:76', '44.101.237.72', '', '', 'Sin comentarios'),
(928750, 101107, '2017-09-20', '07:d2:14:f6:8f:fa', '237.165.73.253', '', '', 'Sin comentarios'),
(928751, 101112, '2018-03-13', 'b6:2d:cb:7c:61:ad', '75.153.236.191', '', '', 'Sin comentarios'),
(928752, 101029, '2017-11-12', '1d:0a:71:62:da:14', '90.44.158.46', '', '', 'Sin comentarios'),
(928753, 101167, '2017-12-10', '04:83:68:f0:23:42', '59.239.191.223', '', '', 'Sin comentarios'),
(928754, 100964, '2017-09-29', '9c:09:2f:d2:99:11', '85.255.35.207', '', '', 'Sin comentarios'),
(928755, 101046, '2017-11-04', '14:a3:f3:f5:cb:25', '151.227.18.49', '', '', 'Sin comentarios'),
(928756, 100722, '2017-09-12', 'a0:d4:a9:0a:c9:ef', '236.32.81.105', '', '', 'Sin comentarios'),
(928757, 100920, '2017-05-02', 'e9:08:63:53:da:c3', '225.16.122.67', '', '', 'Sin comentarios'),
(928758, 100615, '2017-08-05', 'c9:ec:10:22:ea:e0', '250.154.151.126', '', '', 'Sin comentarios'),
(928759, 100920, '2018-06-13', '5f:ab:04:39:65:0c', '71.170.222.217', '', '', 'Sin comentarios'),
(928760, 101162, '2017-09-01', '10:e4:ee:5d:c5:92', '254.233.77.66', '', '', 'Sin comentarios'),
(928761, 101032, '2017-05-08', '47:0a:00:74:bb:2c', '28.27.103.20', '', '', 'Sin comentarios'),
(928762, 100758, '2017-07-01', '85:85:8d:44:4e:41', '192.167.65.239', '', '', 'Sin comentarios'),
(928763, 100868, '2017-08-17', 'e5:02:6f:d7:c3:5d', '166.12.186.13', '', '', 'Sin comentarios'),
(928764, 100625, '2017-09-15', '24:12:45:c8:f5:a1', '139.74.138.187', '', '', 'Sin comentarios'),
(928765, 100987, '2018-02-26', '35:37:f9:d5:9e:6d', '126.141.29.98', '', '', 'Sin comentarios'),
(928766, 100771, '2018-01-12', 'ec:07:a0:90:67:03', '32.98.134.138', '', '', 'Sin comentarios'),
(928767, 101019, '2017-11-06', '58:f0:26:5c:96:dd', '108.17.6.172', '', '', 'Sin comentarios'),
(928768, 100989, '2018-03-15', '26:73:d0:73:73:e4', '127.144.24.36', '', '', 'Sin comentarios'),
(928769, 101132, '2018-01-16', 'ef:72:53:c9:8b:4d', '5.243.196.28', '', '', 'Sin comentarios'),
(928770, 100605, '2017-06-28', '27:da:ca:94:9a:ec', '190.53.156.171', '', '', 'Sin comentarios'),
(928771, 100893, '2017-09-02', '8d:64:b9:04:18:f4', '126.156.194.146', '', '', 'Sin comentarios'),
(928772, 100964, '2018-01-13', 'af:25:de:da:3b:e2', '93.86.73.214', '', '', 'Sin comentarios'),
(928773, 100980, '2017-11-10', '05:a5:b9:46:1e:a6', '211.37.83.28', '', '', 'Sin comentarios'),
(928774, 101050, '2017-11-28', '45:99:c2:13:2e:a4', '183.158.99.219', '', '', 'Sin comentarios'),
(928775, 100801, '2018-01-23', '2d:5e:d1:d0:05:7d', '238.147.183.157', '', '', 'Sin comentarios'),
(928776, 101187, '2017-07-18', '08:0e:ee:c6:75:4e', '249.167.2.170', '', '', 'Sin comentarios'),
(928777, 101047, '2017-11-29', 'fa:be:14:02:af:c9', '99.58.222.107', '', '', 'Sin comentarios'),
(928778, 100635, '2017-09-09', 'e6:24:d2:85:5d:3b', '150.78.214.45', '', '', 'Sin comentarios'),
(928779, 101122, '2018-02-13', 'a6:87:3a:37:b2:8d', '233.192.173.218', '', '', 'Sin comentarios'),
(928780, 100714, '2018-03-09', 'eb:58:d8:45:5f:7c', '14.202.253.1', '', '', 'Sin comentarios'),
(928781, 100664, '2017-09-02', '42:8c:62:13:2a:3e', '163.107.150.180', '', '', 'Sin comentarios'),
(928782, 100694, '2018-02-15', 'dc:4f:63:49:5e:77', '10.18.108.126', '', '', 'Sin comentarios'),
(928783, 100646, '2017-08-03', 'b3:fd:d8:71:a1:aa', '172.188.133.152', '', '', 'Sin comentarios'),
(928784, 100838, '2017-03-08', 'f6:cb:5d:af:79:e3', '153.212.57.104', '', '', 'Sin comentarios'),
(928785, 101117, '2018-02-25', 'ec:14:73:2a:ac:e1', '176.22.224.89', '', '', 'Sin comentarios'),
(928786, 100821, '2017-09-26', 'cf:4d:da:a4:da:b6', '63.67.160.152', '', '', 'Sin comentarios'),
(928787, 100871, '2017-06-10', 'ef:e7:79:9d:12:fd', '0.226.103.245', '', '', 'Sin comentarios'),
(928788, 100838, '2018-02-19', 'd5:cd:13:91:3f:f4', '237.45.164.97', '', '', 'Sin comentarios'),
(928789, 101165, '2017-08-04', 'b4:5f:ae:5f:93:6d', '6.139.5.187', '', '', 'Sin comentarios'),
(928790, 100878, '2017-10-18', 'f2:e3:d6:b1:a2:67', '78.73.56.115', '', '', 'Sin comentarios'),
(928791, 100854, '2018-03-06', '04:9f:cc:73:f5:fe', '254.39.46.250', '', '', 'Sin comentarios'),
(928792, 100685, '2017-09-14', '7c:a3:ac:e4:2a:ab', '95.48.197.209', '', '', 'Sin comentarios'),
(928793, 100851, '2018-02-12', '5e:c9:34:f6:e4:89', '37.65.138.66', '', '', 'Sin comentarios'),
(928794, 100690, '2017-10-25', 'dd:01:b2:91:7e:2f', '165.242.217.181', '', '', 'Sin comentarios'),
(928795, 100710, '2017-12-01', '4c:09:a9:61:fa:be', '130.57.157.252', '', '', 'Sin comentarios'),
(928796, 101094, '2018-02-11', 'de:19:60:29:56:42', '44.41.87.141', '', '', 'Sin comentarios'),
(928797, 101182, '2018-03-02', '88:ac:c5:bd:db:bf', '26.146.63.42', '', '', 'Sin comentarios'),
(928798, 101043, '2017-12-27', '38:04:97:4a:7d:d0', '138.187.118.35', '', '', 'Sin comentarios'),
(928799, 100754, '2018-02-06', '26:39:cb:6d:7a:ae', '245.197.190.167', '', '', 'Sin comentarios'),
(928800, 100607, '2017-10-26', 'c8:3d:be:2d:1c:c7', '26.127.119.163', '', '', 'Sin comentarios'),
(928801, 100811, '2017-09-27', 'a8:d6:73:29:0e:81', '232.100.170.65', '', '', 'Sin comentarios'),
(928802, 100798, '2017-08-16', '76:bc:01:15:8c:77', '72.53.173.55', '', '', 'Sin comentarios'),
(928803, 100652, '2018-03-01', '7f:48:28:4a:fa:15', '39.159.228.144', '', '', 'Sin comentarios'),
(928804, 101159, '2017-08-28', '50:bf:16:0f:e9:21', '45.103.119.189', '', '', 'Sin comentarios'),
(928805, 101146, '2017-09-29', 'b5:04:07:81:6d:3e', '32.245.60.207', '', '', 'Sin comentarios'),
(928806, 100839, '2017-07-18', 'cf:aa:fc:54:46:91', '146.187.72.207', '', '', 'Sin comentarios'),
(928807, 100678, '2017-07-02', 'e9:ea:24:2b:cf:97', '147.238.164.89', '', '', 'Sin comentarios'),
(928808, 100987, '2017-07-20', '3f:ba:90:16:5d:3b', '226.121.55.185', '', '', 'Sin comentarios'),
(928809, 100676, '2017-06-05', '53:7b:72:83:e1:12', '254.84.62.187', '', '', 'Sin comentarios'),
(928810, 101002, '2018-03-01', 'b2:60:be:31:b5:65', '198.150.23.69', '', '', 'Sin comentarios'),
(928811, 100919, '2017-10-25', '39:05:b7:b0:88:aa', '246.143.38.158', '', '', 'Sin comentarios'),
(928812, 100779, '2017-03-30', '08:81:d4:c3:55:d8', '30.172.46.94', '', '', 'Sin comentarios'),
(928813, 100831, '2018-03-05', '07:cb:30:51:5e:27', '242.27.244.119', '', '', 'Sin comentarios'),
(928814, 101082, '2017-05-09', '9c:f8:12:09:61:16', '78.24.164.83', '', '', 'Sin comentarios'),
(928815, 101145, '2017-04-16', '3b:86:21:fb:58:4a', '158.161.212.102', '', '', 'Sin comentarios'),
(928816, 100922, '2017-09-22', '78:1f:6c:ca:4f:48', '73.26.169.92', '', '', 'Sin comentarios'),
(928817, 100912, '2017-09-18', 'a7:72:95:06:92:65', '148.103.105.111', '', '', 'Sin comentarios'),
(928818, 101188, '2017-12-28', '32:0e:e5:5a:c3:f4', '198.21.194.209', '', '', 'Sin comentarios'),
(928819, 100604, '2017-01-01', 'd0:e8:e8:5a:bd:cc', '14.200.77.161', '', '', 'Sin comentarios'),
(928820, 100970, '2017-05-08', 'c6:dd:53:45:89:ad', '98.175.29.106', '', '', 'Sin comentarios'),
(928821, 100672, '2018-01-06', '9a:1d:40:67:4f:f7', '76.50.141.182', '', '', 'Sin comentarios'),
(928822, 100752, '2018-01-30', '4d:70:6f:c7:36:57', '241.96.31.15', '', '', 'Sin comentarios'),
(928823, 100612, '2017-10-14', 'fd:37:cd:45:b8:00', '232.241.239.15', '', '', 'Sin comentarios'),
(928824, 100912, '2017-05-17', '49:24:f6:7a:f1:6b', '234.127.98.78', '', '', 'Sin comentarios'),
(928825, 101040, '2017-05-26', '93:c6:78:7c:a0:9e', '237.80.110.178', '', '', 'Sin comentarios'),
(928826, 100661, '2018-02-14', 'f0:e8:30:18:64:e7', '39.124.167.125', '', '', 'Sin comentarios'),
(928827, 101096, '2017-04-09', '65:44:e0:32:47:13', '197.10.119.29', '', '', 'Sin comentarios'),
(928828, 100616, '2017-11-01', '73:a2:6e:f7:cc:d0', '0.219.152.35', '', '', 'Sin comentarios'),
(928829, 100859, '2017-07-08', 'd1:24:4a:7b:9c:4a', '28.178.124.148', '', '', 'Sin comentarios'),
(928830, 100985, '2017-08-26', '4c:4b:b8:bc:39:74', '93.168.52.98', '', '', 'Sin comentarios'),
(928831, 100912, '2017-08-11', '72:c3:4a:38:02:71', '192.195.158.0', '', '', 'Sin comentarios'),
(928832, 101011, '2018-02-14', 'aa:76:8a:e4:b7:40', '164.179.12.18', '', '', 'Sin comentarios'),
(928833, 101115, '2017-12-11', '97:1a:b1:3a:01:b2', '222.141.63.166', '', '', 'Sin comentarios'),
(928834, 101067, '2017-02-28', '58:9b:6a:e9:1a:f9', '151.14.110.115', '', '', 'Sin comentarios'),
(928835, 101119, '2017-10-03', 'ee:e3:cb:5b:e3:95', '92.1.234.145', '', '', 'Sin comentarios'),
(928836, 100725, '2017-08-09', 'd5:10:b8:46:a4:dc', '86.25.144.226', '', '', 'Sin comentarios'),
(928837, 100784, '2017-09-19', '11:1d:6a:20:b3:4a', '9.207.41.228', '', '', 'Sin comentarios'),
(928838, 100669, '2018-01-07', '81:a8:c0:91:7f:d2', '194.2.182.57', '', '', 'Sin comentarios'),
(928839, 101127, '2017-08-30', 'f0:ab:a9:69:a0:2e', '106.179.155.69', '', '', 'Sin comentarios'),
(928840, 100986, '2017-09-03', '71:3d:69:b5:1f:3b', '201.246.142.249', '', '', 'Sin comentarios'),
(928841, 100991, '2017-06-06', '4e:49:e1:98:6b:1c', '133.165.54.114', '', '', 'Sin comentarios'),
(928842, 100945, '2017-11-24', '76:fe:08:00:67:03', '221.6.160.60', '', '', 'Sin comentarios'),
(928843, 100971, '2017-08-22', '8f:cd:15:a8:cb:b8', '8.9.175.119', '', '', 'Sin comentarios'),
(928844, 100989, '2018-01-14', '8f:ae:78:35:f9:4c', '199.205.134.221', '', '', 'Sin comentarios'),
(928845, 101067, '2018-01-29', '8b:2c:21:e3:89:86', '154.252.136.142', '', '', 'Sin comentarios'),
(928846, 100737, '2017-11-19', 'd7:d3:64:6b:b7:e2', '124.246.114.139', '', '', 'Sin comentarios'),
(928847, 101192, '2018-04-02', '65:7c:dc:39:c8:50', '17.201.212.177', '', '', 'Sin comentarios'),
(928848, 100607, '2017-12-31', '88:90:7b:2e:24:f7', '252.27.84.179', '', '', 'Sin comentarios'),
(928849, 101156, '2017-05-04', '04:92:40:e2:f8:0a', '179.148.189.245', '', '', 'Sin comentarios'),
(928850, 101127, '2017-12-25', 'eb:d1:ad:d0:46:73', '12.220.168.58', '', '', 'Sin comentarios'),
(928851, 100857, '2017-04-28', 'be:42:82:2d:e8:65', '195.85.213.85', '', '', 'Sin comentarios'),
(928852, 101155, '2017-06-13', 'bd:80:fe:20:00:41', '212.46.135.37', '', '', 'Sin comentarios'),
(928853, 100703, '2017-10-30', 'e2:c2:f2:2c:21:9c', '13.165.158.64', '', '', 'Sin comentarios'),
(928854, 101043, '2017-04-13', '30:e1:d9:56:22:48', '103.207.221.152', '', '', 'Sin comentarios'),
(928855, 100894, '2017-05-27', 'd5:6f:d5:d1:a1:20', '4.221.86.147', '', '', 'Sin comentarios'),
(928856, 100908, '2017-06-18', 'dd:4e:0e:6b:51:06', '231.5.255.213', '', '', 'Sin comentarios'),
(928857, 100659, '2017-12-24', 'd7:8f:f6:90:5b:1a', '92.105.158.240', '', '', 'Sin comentarios'),
(928858, 100629, '2017-09-12', 'a6:ce:6e:6b:0d:9d', '118.172.216.38', '', '', 'Sin comentarios'),
(928859, 100814, '2017-12-15', 'c6:16:cc:37:d0:67', '159.184.107.208', '', '', 'Sin comentarios'),
(928860, 100832, '2018-02-17', '04:d8:06:dd:b9:c2', '183.194.245.146', '', '', 'Sin comentarios'),
(928861, 100681, '2017-03-26', '7f:0b:d5:28:94:1c', '245.26.202.224', '', '', 'Sin comentarios'),
(928862, 100615, '2017-09-03', '3c:29:b7:e3:cc:06', '105.101.63.200', '', '', 'Sin comentarios'),
(928863, 101124, '2017-09-26', '69:8a:6b:4d:13:5c', '31.16.127.170', '', '', 'Sin comentarios'),
(928864, 101088, '2017-05-06', '5c:68:ca:df:3a:52', '63.109.104.196', '', '', 'Sin comentarios'),
(928865, 101008, '2017-03-19', '3e:e6:ef:97:3f:f8', '255.128.234.28', '', '', 'Sin comentarios'),
(928866, 100857, '2017-05-14', '96:6c:54:d4:d0:0b', '182.32.250.190', '', '', 'Sin comentarios'),
(928867, 100826, '2017-07-16', '0b:97:4d:14:b9:6a', '41.232.159.199', '', '', 'Sin comentarios'),
(928868, 100765, '2017-10-22', 'b2:9d:96:bd:bf:56', '69.75.66.4', '', '', 'Sin comentarios'),
(928869, 101019, '2017-03-31', '22:34:37:01:54:0a', '72.200.165.33', '', '', 'Sin comentarios'),
(928870, 100695, '2017-10-11', '8b:80:ab:81:c9:02', '110.100.14.167', '', '', 'Sin comentarios'),
(928871, 100725, '2018-01-17', '73:bf:4b:d7:7e:5d', '131.244.180.214', '', '', 'Sin comentarios'),
(928872, 100799, '2017-05-31', '0d:bf:51:12:73:0e', '8.220.35.106', '', '', 'Sin comentarios'),
(928873, 100959, '2018-01-23', '3d:a0:01:66:e3:bc', '15.121.159.109', '', '', 'Sin comentarios'),
(928874, 100767, '2017-05-30', '46:f9:4a:65:d3:25', '40.170.185.55', '', '', 'Sin comentarios'),
(928875, 100915, '2017-04-25', 'e5:e0:1d:27:9b:71', '59.47.211.64', '', '', 'Sin comentarios'),
(928876, 101001, '2017-12-24', '44:77:fb:90:38:b6', '54.207.60.133', '', '', 'Sin comentarios'),
(928877, 100992, '2017-08-08', '53:28:d9:56:94:be', '157.70.236.234', '', '', 'Sin comentarios'),
(928878, 101127, '2018-01-10', '62:df:98:73:aa:77', '30.236.35.241', '', '', 'Sin comentarios'),
(928879, 101162, '2017-11-02', '36:61:4e:15:7a:80', '229.138.24.165', '', '', 'Sin comentarios'),
(928880, 100675, '2017-06-29', '39:e2:38:eb:61:21', '84.172.16.148', '', '', 'Sin comentarios'),
(928881, 100886, '2018-01-15', '1b:e8:23:97:3d:96', '50.118.30.67', '', '', 'Sin comentarios'),
(928882, 101130, '2017-04-22', '96:b3:96:39:b3:5f', '142.98.132.7', '', '', 'Sin comentarios'),
(928883, 100789, '2017-09-01', '5d:ba:b5:16:d8:ee', '147.243.66.96', '', '', 'Sin comentarios'),
(928884, 100928, '2018-02-02', 'e2:03:49:94:53:ea', '251.192.245.6', '', '', 'Sin comentarios'),
(928885, 100738, '2017-07-26', 'c4:1f:ba:a9:32:37', '204.218.121.199', '', '', 'Sin comentarios'),
(928886, 101167, '2018-01-15', '2b:b9:fd:75:e0:5f', '77.250.30.233', '', '', 'Sin comentarios'),
(928887, 100918, '2017-07-17', 'ba:0b:e3:41:5b:16', '211.151.111.160', '', '', 'Sin comentarios'),
(928888, 100892, '2017-05-01', '6a:a7:59:c6:66:74', '40.117.108.211', '', '', 'Sin comentarios'),
(928889, 101098, '2017-07-01', '58:c0:ee:79:bc:69', '132.203.175.144', '', '', 'Sin comentarios'),
(928890, 100745, '2018-01-14', 'eb:36:d4:fa:13:f0', '119.137.220.189', '', '', 'Sin comentarios'),
(928891, 100833, '2017-08-18', '8d:a3:ae:95:a3:d3', '150.30.161.111', '', '', 'Sin comentarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Movimientos_Empresa`
--

CREATE TABLE `Movimientos_Empresa` (
  `Fecha` date NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Accion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Movimientos_Empresa`
--

INSERT INTO `Movimientos_Empresa` (`Fecha`, `Usuario`, `Accion`) VALUES
('2018-10-10', 'USER', 'INSERT'),
('2018-05-25', 'USER', 'INSERT'),
('2018-05-25', 'root@localhost', 'INSERT'),
('2018-05-25', 'root@192.168.109.1', 'INSERT'),
('2018-05-25', 'root@localhost', 'INSERT'),
('2018-05-25', 'root@192.168.109.1', 'INSERT'),
('2018-05-25', 'root@192.168.109.1', 'DELETE'),
('2018-05-25', 'root@192.168.109.1', 'UPDATE'),
('2018-05-25', 'root@192.168.109.1', 'DELETE'),
('2018-05-25', 'root@192.168.109.1', 'INSERT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RegistroUsuarios`
--

CREATE TABLE `RegistroUsuarios` (
  `IDREGISTRO` int(11) NOT NULL,
  `NombreUsuario` varchar(50) DEFAULT NULL,
  `ApellidoPUsuario` varchar(50) DEFAULT NULL,
  `ApellidoMUsuarios` varchar(50) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono` varchar(11) DEFAULT NULL,
  `TipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `RegistroUsuarios`
--

INSERT INTO `RegistroUsuarios` (`IDREGISTRO`, `NombreUsuario`, `ApellidoPUsuario`, `ApellidoMUsuarios`, `Direccion`, `Correo`, `Telefono`, `TipoUsuario`) VALUES
(1, 'Miguel', 'Magdaleno', 'Rosales', 'Acueducto #44', 'mgr@gmail.com', '5550125', 1),
(2, 'Diego', 'Zenitram', 'A', 'Puruandiro', 'dgo@gmail.com', '4381093584', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `Reporte_contratos_general`
--
CREATE TABLE `Reporte_contratos_general` (
`NoContrato` int(11)
,`Status` varchar(255)
,`Nombre` varchar(255)
,`NombreComercial` varchar(255)
,`Localizacion` varchar(255)
,`Tipo` varchar(255)
,`VelDescarga` int(11)
,`VelSubida` int(11)
,`NoSERIE` int(11)
,`Fecha` varchar(255)
,`IDMOVIMIENTO` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `Reporte_equipos_general`
--
CREATE TABLE `Reporte_equipos_general` (
`NoSERIE` int(11)
,`NoContrato` int(11)
,`Modelo` varchar(255)
,`DireccionMAC` varchar(17)
,`Tipo` varchar(255)
,`VelSubida` int(11)
,`VelDescarga` int(11)
,`Nombre` varchar(255)
,`Fecha` date
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicios`
--

CREATE TABLE `Servicios` (
  `ID_TIPO` int(11) NOT NULL,
  `Tipo` varchar(255) NOT NULL,
  `VelDescarga` int(11) NOT NULL,
  `VelSubida` int(11) NOT NULL,
  `NoContrato` int(11) NOT NULL,
  `NoSerie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Servicios`
--

INSERT INTO `Servicios` (`ID_TIPO`, `Tipo`, `VelDescarga`, `VelSubida`, `NoContrato`, `NoSerie`) VALUES
(2000, 'PPPOE', 10, 10, 1213, 100744),
(2001, 'DHCP', 20, 20, 1462, 100606),
(2002, 'PPPOE', 20, 20, 1136, 100796),
(2003, 'DHCP', 20, 20, 1296, 100788),
(2004, 'PPPOE', 20, 20, 1158, 101130),
(2005, 'PPPOE', 20, 10, 1304, 101165),
(2006, 'PPPOE', 10, 20, 1022, 100626),
(2007, 'DHCP', 10, 20, 1034, 100770),
(2008, 'DHCP', 20, 10, 1184, 100612),
(2009, 'DHCP', 10, 20, 1056, 101186),
(2010, 'PPPOE', 20, 20, 1199, 100950),
(2011, 'PPPOE', 10, 20, 1125, 101187),
(2012, 'PPPOE', 20, 10, 1183, 100697),
(2013, 'PPPOE', 20, 20, 1466, 100817),
(2014, 'PPPOE', 20, 10, 1151, 101030),
(2015, 'PPPOE', 10, 20, 1090, 100990),
(2016, 'DHCP', 10, 20, 1408, 100833),
(2017, 'DHCP', 10, 10, 1389, 101083),
(2018, 'PPPOE', 20, 10, 1435, 100722),
(2019, 'PPPOE', 10, 10, 1173, 101098),
(2020, 'PPPOE', 20, 10, 1187, 100902),
(2021, 'PPPOE', 10, 20, 1092, 100803),
(2022, 'DHCP', 10, 20, 1113, 100982),
(2023, 'PPPOE', 10, 10, 1315, 100628),
(2024, 'DHCP', 20, 20, 1391, 101004),
(2025, 'PPPOE', 10, 20, 1352, 101098),
(2026, 'PPPOE', 20, 10, 1082, 101065),
(2027, 'PPPOE', 10, 10, 1288, 101119),
(2028, 'PPPOE', 10, 20, 1256, 101149),
(2029, 'DHCP', 10, 20, 1488, 100738),
(2030, 'DHCP', 20, 20, 1274, 101075),
(2031, 'DHCP', 10, 10, 1290, 101069),
(2032, 'PPPOE', 20, 10, 1410, 100887),
(2033, 'PPPOE', 10, 10, 1311, 100865),
(2034, 'PPPOE', 10, 10, 1405, 101069),
(2035, 'DHCP', 20, 20, 1394, 100788),
(2036, 'DHCP', 20, 10, 1112, 101055),
(2037, 'PPPOE', 20, 10, 1015, 101181),
(2038, 'PPPOE', 10, 20, 1159, 101067),
(2039, 'DHCP', 10, 10, 1447, 101055),
(2040, 'PPPOE', 20, 20, 1094, 100628),
(2041, 'DHCP', 10, 10, 1322, 100888),
(2042, 'DHCP', 10, 20, 1024, 100850),
(2043, 'DHCP', 20, 20, 1470, 101120),
(2044, 'DHCP', 10, 10, 1051, 100760),
(2045, 'PPPOE', 20, 10, 1485, 100638),
(2046, 'PPPOE', 20, 20, 1334, 100740),
(2047, 'DHCP', 10, 10, 1178, 101181),
(2048, 'DHCP', 10, 20, 1189, 101134),
(2049, 'PPPOE', 20, 10, 1028, 100654),
(2050, 'PPPOE', 20, 20, 1059, 100978),
(2051, 'DHCP', 20, 10, 1197, 100729),
(2052, 'PPPOE', 10, 20, 1034, 100928),
(2053, 'PPPOE', 20, 10, 1349, 100642),
(2054, 'DHCP', 20, 10, 1262, 100817),
(2055, 'PPPOE', 20, 10, 1149, 100710),
(2056, 'DHCP', 20, 10, 1040, 100753),
(2057, 'DHCP', 10, 10, 1018, 100797),
(2058, 'PPPOE', 20, 20, 1405, 101090),
(2059, 'DHCP', 20, 10, 1158, 101013),
(2060, 'DHCP', 20, 10, 1481, 100842),
(2061, 'DHCP', 20, 10, 1454, 100875),
(2062, 'PPPOE', 10, 10, 1428, 101142),
(2063, 'PPPOE', 10, 20, 1463, 100672),
(2064, 'DHCP', 10, 10, 1122, 100921),
(2065, 'PPPOE', 20, 20, 1374, 100891),
(2066, 'PPPOE', 10, 20, 1058, 100821),
(2067, 'DHCP', 10, 20, 1259, 100858),
(2068, 'DHCP', 20, 20, 1465, 100606),
(2069, 'PPPOE', 20, 10, 1158, 100742),
(2070, 'PPPOE', 10, 20, 1463, 100819),
(2071, 'DHCP', 20, 20, 1167, 100793),
(2072, 'DHCP', 20, 20, 1496, 101063),
(2073, 'PPPOE', 10, 20, 1316, 101132),
(2074, 'DHCP', 20, 20, 1083, 100827),
(2075, 'PPPOE', 10, 20, 1097, 100988),
(2076, 'PPPOE', 10, 20, 1475, 100668),
(2077, 'DHCP', 10, 10, 1063, 100845),
(2078, 'PPPOE', 10, 20, 1130, 101115),
(2079, 'PPPOE', 20, 20, 1056, 101147),
(2080, 'DHCP', 20, 20, 1020, 100672),
(2081, 'PPPOE', 20, 20, 1484, 100746),
(2082, 'PPPOE', 20, 20, 1261, 101134),
(2083, 'DHCP', 10, 20, 1079, 100621),
(2084, 'DHCP', 10, 10, 1432, 101121),
(2085, 'DHCP', 10, 10, 1220, 100630),
(2086, 'PPPOE', 10, 10, 1115, 100810),
(2087, 'DHCP', 10, 20, 1468, 101118),
(2088, 'DHCP', 10, 10, 1453, 100679),
(2089, 'DHCP', 10, 10, 1159, 100676),
(2090, 'DHCP', 10, 10, 1444, 100872),
(2091, 'DHCP', 10, 20, 1229, 101146),
(2092, 'PPPOE', 20, 20, 1486, 101127),
(2093, 'DHCP', 10, 20, 1141, 101165),
(2094, 'DHCP', 20, 10, 1404, 101000),
(2095, 'DHCP', 20, 10, 1027, 100731),
(2096, 'DHCP', 20, 20, 1287, 100654),
(2097, 'PPPOE', 20, 10, 1456, 100882),
(2098, 'PPPOE', 10, 10, 1437, 100797),
(2099, 'PPPOE', 10, 20, 1080, 101088),
(2100, 'PPPOE', 20, 10, 1133, 100852),
(2101, 'PPPOE', 10, 10, 1243, 100990),
(2102, 'PPPOE', 20, 10, 1038, 101080),
(2103, 'PPPOE', 10, 10, 1441, 101151),
(2104, 'PPPOE', 20, 20, 1367, 101064),
(2105, 'PPPOE', 10, 20, 1122, 100619),
(2106, 'DHCP', 10, 20, 1044, 100852),
(2107, 'PPPOE', 10, 10, 1136, 100690),
(2108, 'PPPOE', 20, 20, 1373, 100959),
(2109, 'DHCP', 10, 20, 1464, 100624),
(2110, 'PPPOE', 10, 20, 1434, 100794),
(2111, 'PPPOE', 10, 20, 1175, 100645),
(2112, 'DHCP', 10, 20, 1016, 100742),
(2113, 'PPPOE', 20, 20, 1186, 101174),
(2114, 'PPPOE', 20, 10, 1270, 100876),
(2115, 'PPPOE', 10, 10, 1217, 101108),
(2116, 'PPPOE', 10, 20, 1099, 100675),
(2117, 'PPPOE', 10, 20, 1300, 100873),
(2118, 'PPPOE', 10, 10, 1483, 100620),
(2119, 'DHCP', 10, 10, 1221, 100639),
(2120, 'PPPOE', 20, 10, 1416, 100725),
(2121, 'DHCP', 20, 10, 1412, 100812),
(2122, 'PPPOE', 20, 10, 1206, 100930),
(2123, 'PPPOE', 20, 10, 1340, 100691),
(2124, 'DHCP', 10, 20, 1102, 101035),
(2125, 'DHCP', 20, 20, 1075, 100908),
(2126, 'DHCP', 10, 10, 1215, 100939),
(2127, 'PPPOE', 10, 10, 1469, 101091),
(2128, 'DHCP', 10, 10, 1435, 100845),
(2129, 'PPPOE', 20, 10, 1081, 100710),
(2130, 'PPPOE', 20, 20, 1491, 101158),
(2131, 'PPPOE', 10, 20, 1172, 101079),
(2132, 'DHCP', 10, 10, 1226, 100752),
(2133, 'DHCP', 10, 20, 1015, 100903),
(2134, 'PPPOE', 10, 10, 1300, 100713),
(2135, 'DHCP', 10, 10, 1170, 100809),
(2136, 'DHCP', 10, 20, 1136, 100710),
(2137, 'PPPOE', 10, 10, 1356, 100655),
(2138, 'DHCP', 20, 10, 1054, 100837),
(2139, 'DHCP', 20, 10, 1429, 101058),
(2140, 'DHCP', 20, 20, 1191, 101161),
(2141, 'PPPOE', 10, 10, 1220, 101078),
(2142, 'DHCP', 10, 10, 1238, 100675),
(2143, 'DHCP', 10, 10, 1031, 101015),
(2144, 'PPPOE', 20, 10, 1289, 100681),
(2145, 'DHCP', 10, 20, 1367, 100986),
(2146, 'PPPOE', 20, 10, 1488, 100885),
(2147, 'PPPOE', 10, 20, 1251, 100941),
(2148, 'DHCP', 20, 10, 1095, 100624),
(2149, 'PPPOE', 20, 20, 1047, 100833),
(2150, 'PPPOE', 10, 10, 1153, 100642),
(2151, 'PPPOE', 20, 20, 1430, 101113),
(2152, 'PPPOE', 20, 10, 1484, 100605),
(2153, 'DHCP', 10, 20, 1148, 101075),
(2154, 'PPPOE', 20, 10, 1082, 100607),
(2155, 'DHCP', 10, 10, 1461, 101100),
(2156, 'DHCP', 20, 10, 1017, 100907),
(2157, 'DHCP', 10, 20, 1455, 100839),
(2158, 'DHCP', 10, 10, 1210, 100779),
(2159, 'DHCP', 20, 20, 1133, 101131),
(2160, 'PPPOE', 10, 20, 1327, 101042),
(2161, 'DHCP', 20, 20, 1051, 100603),
(2162, 'DHCP', 20, 20, 1238, 100769),
(2163, 'PPPOE', 10, 20, 1449, 101008),
(2164, 'DHCP', 20, 10, 1426, 101143),
(2165, 'DHCP', 10, 10, 1488, 100942),
(2166, 'PPPOE', 10, 10, 1003, 100887),
(2167, 'PPPOE', 20, 20, 1181, 101158),
(2168, 'PPPOE', 10, 10, 1001, 100842),
(2169, 'DHCP', 20, 20, 1309, 100811),
(2170, 'DHCP', 10, 20, 1299, 101070),
(2171, 'DHCP', 10, 20, 1004, 100965),
(2172, 'PPPOE', 20, 10, 1485, 101075),
(2173, 'DHCP', 20, 10, 1496, 100819),
(2174, 'PPPOE', 10, 10, 1156, 100746),
(2175, 'PPPOE', 20, 20, 1210, 100881),
(2176, 'PPPOE', 20, 20, 1167, 101150),
(2177, 'DHCP', 20, 10, 1102, 101015),
(2178, 'PPPOE', 10, 10, 1073, 100767),
(2179, 'DHCP', 10, 10, 1239, 100670),
(2180, 'PPPOE', 10, 20, 1235, 100988),
(2181, 'PPPOE', 10, 20, 1330, 101044),
(2182, 'DHCP', 10, 20, 1368, 100730),
(2183, 'PPPOE', 10, 10, 1476, 100849),
(2184, 'DHCP', 20, 10, 1063, 100700),
(2185, 'PPPOE', 20, 10, 1391, 101160),
(2186, 'DHCP', 20, 20, 1404, 101138),
(2187, 'PPPOE', 20, 20, 1481, 101178),
(2188, 'PPPOE', 20, 10, 1475, 100988),
(2189, 'DHCP', 10, 20, 1428, 100922),
(2190, 'PPPOE', 20, 20, 1384, 101090),
(2191, 'DHCP', 10, 20, 1468, 100840),
(2192, 'DHCP', 20, 20, 1417, 100651),
(2193, 'DHCP', 10, 20, 1465, 100631),
(2194, 'DHCP', 20, 20, 1389, 101115),
(2195, 'PPPOE', 20, 20, 1227, 100944),
(2196, 'DHCP', 20, 10, 1019, 101032),
(2197, 'DHCP', 10, 20, 1042, 100687),
(2198, 'PPPOE', 10, 10, 1180, 100603),
(2199, 'PPPOE', 20, 10, 1467, 100919),
(2200, 'PPPOE', 20, 10, 1472, 100675),
(2201, 'PPPOE', 10, 10, 1451, 100954),
(2202, 'PPPOE', 20, 20, 1272, 100657),
(2203, 'DHCP', 20, 10, 1147, 101182),
(2204, 'PPPOE', 20, 20, 1438, 100738),
(2205, 'DHCP', 10, 20, 1429, 101107),
(2206, 'PPPOE', 20, 10, 1441, 100661),
(2207, 'DHCP', 10, 20, 1018, 101112),
(2208, 'DHCP', 10, 20, 1104, 101029),
(2209, 'DHCP', 10, 10, 1030, 101167),
(2210, 'DHCP', 20, 10, 1082, 100964),
(2211, 'PPPOE', 10, 20, 1015, 101148),
(2212, 'DHCP', 10, 10, 1174, 101046),
(2213, 'DHCP', 20, 10, 1436, 100722),
(2214, 'PPPOE', 20, 20, 1019, 101151),
(2215, 'PPPOE', 20, 10, 1399, 100688),
(2216, 'DHCP', 20, 10, 1244, 100920),
(2217, 'DHCP', 20, 10, 1114, 100615),
(2218, 'DHCP', 20, 10, 1017, 100920),
(2219, 'DHCP', 20, 10, 1062, 101162),
(2220, 'PPPOE', 10, 10, 1414, 101106),
(2221, 'DHCP', 20, 20, 1096, 101032),
(2222, 'DHCP', 10, 10, 1292, 100758),
(2223, 'DHCP', 20, 20, 1141, 100868),
(2224, 'DHCP', 20, 10, 1389, 100625),
(2225, 'PPPOE', 20, 10, 1132, 100982),
(2226, 'DHCP', 20, 10, 1473, 100987),
(2227, 'PPPOE', 10, 10, 1054, 101132),
(2228, 'PPPOE', 10, 10, 1083, 100774),
(2229, 'DHCP', 10, 10, 1192, 100771),
(2230, 'DHCP', 20, 20, 1456, 101019),
(2231, 'PPPOE', 20, 20, 1326, 100660),
(2232, 'PPPOE', 20, 20, 1106, 101000),
(2233, 'DHCP', 20, 10, 1437, 100989),
(2234, 'PPPOE', 20, 20, 1043, 100885),
(2235, 'PPPOE', 20, 20, 1433, 100749),
(2236, 'PPPOE', 10, 10, 1430, 100853),
(2237, 'DHCP', 10, 10, 1318, 101132),
(2238, 'PPPOE', 20, 10, 1002, 100606),
(2239, 'DHCP', 10, 10, 1236, 100605),
(2240, 'PPPOE', 10, 10, 1320, 101043),
(2241, 'DHCP', 20, 10, 1413, 100893),
(2242, 'DHCP', 10, 10, 1021, 100964),
(2243, 'PPPOE', 20, 10, 1214, 101087),
(2244, 'DHCP', 20, 20, 1362, 100980),
(2245, 'PPPOE', 10, 10, 1178, 100907),
(2246, 'PPPOE', 10, 20, 1035, 101153),
(2247, 'PPPOE', 20, 20, 1405, 100966),
(2248, 'PPPOE', 10, 10, 1124, 100991),
(2249, 'DHCP', 20, 20, 1360, 101050),
(2250, 'DHCP', 20, 20, 1233, 100801),
(2251, 'PPPOE', 10, 20, 1295, 100987),
(2252, 'DHCP', 10, 10, 1098, 101187),
(2253, 'DHCP', 20, 20, 1306, 101047),
(2254, 'DHCP', 10, 10, 1438, 100635),
(2255, 'DHCP', 20, 20, 1345, 101122),
(2256, 'PPPOE', 10, 10, 1376, 101117),
(2257, 'PPPOE', 10, 20, 1156, 101075),
(2258, 'PPPOE', 20, 20, 1131, 100798),
(2259, 'PPPOE', 20, 10, 1488, 101067),
(2260, 'PPPOE', 20, 20, 1014, 100847),
(2261, 'PPPOE', 10, 20, 1044, 100919),
(2262, 'DHCP', 10, 20, 1317, 100714),
(2263, 'PPPOE', 20, 10, 1273, 100619),
(2264, 'DHCP', 10, 20, 1383, 100664),
(2265, 'DHCP', 20, 10, 1182, 100694),
(2266, 'DHCP', 20, 10, 1367, 100646),
(2267, 'PPPOE', 20, 10, 1195, 100779),
(2268, 'DHCP', 20, 20, 1182, 100838),
(2269, 'PPPOE', 20, 20, 1351, 101062),
(2270, 'PPPOE', 20, 20, 1439, 100991),
(2271, 'DHCP', 10, 10, 1036, 101117),
(2272, 'PPPOE', 10, 10, 1139, 100854),
(2273, 'DHCP', 20, 20, 1028, 100821),
(2274, 'PPPOE', 20, 20, 1068, 100786),
(2275, 'DHCP', 10, 20, 1445, 100871),
(2276, 'PPPOE', 20, 20, 1053, 100710),
(2277, 'DHCP', 10, 20, 1381, 100838),
(2278, 'PPPOE', 20, 10, 1494, 100697),
(2279, 'PPPOE', 10, 20, 1376, 100661),
(2280, 'PPPOE', 10, 20, 1135, 100989),
(2281, 'DHCP', 20, 20, 1494, 101165),
(2282, 'PPPOE', 10, 20, 1376, 100629),
(2283, 'PPPOE', 20, 20, 1068, 100895),
(2284, 'DHCP', 10, 20, 1320, 100878),
(2285, 'DHCP', 10, 10, 1165, 100854),
(2286, 'DHCP', 10, 20, 1255, 100685),
(2287, 'DHCP', 10, 20, 1494, 100851),
(2288, 'PPPOE', 20, 10, 1043, 100669),
(2289, 'DHCP', 10, 20, 1310, 100690),
(2290, 'PPPOE', 10, 20, 1462, 100961),
(2291, 'DHCP', 20, 10, 1088, 100710),
(2292, 'DHCP', 10, 10, 1222, 101094),
(2293, 'DHCP', 20, 10, 1377, 101182),
(2294, 'DHCP', 10, 20, 1406, 101043),
(2295, 'DHCP', 10, 10, 1199, 100754),
(2296, 'DHCP', 20, 10, 1196, 100607),
(2297, 'PPPOE', 20, 20, 1096, 100644),
(2298, 'DHCP', 20, 10, 1462, 100811),
(2299, 'DHCP', 10, 10, 1165, 100798),
(2300, 'PPPOE', 20, 20, 1496, 100606),
(2301, 'PPPOE', 10, 10, 1333, 100815),
(2302, 'DHCP', 10, 20, 1214, 100652),
(2303, 'DHCP', 10, 10, 1373, 101159),
(2304, 'DHCP', 20, 20, 1315, 101146),
(2305, 'PPPOE', 10, 10, 1473, 101035),
(2306, 'DHCP', 20, 10, 1372, 100839),
(2307, 'PPPOE', 10, 10, 1465, 100726),
(2308, 'PPPOE', 10, 20, 1348, 100846),
(2309, 'PPPOE', 20, 20, 1023, 101063),
(2310, 'PPPOE', 20, 10, 1370, 100881),
(2311, 'DHCP', 10, 20, 1087, 100678),
(2312, 'PPPOE', 10, 20, 1334, 101001),
(2313, 'PPPOE', 20, 20, 1022, 100983),
(2314, 'PPPOE', 20, 20, 1339, 101082),
(2315, 'DHCP', 10, 20, 1169, 100987),
(2316, 'PPPOE', 20, 10, 1290, 101021),
(2317, 'DHCP', 10, 20, 1349, 100676),
(2318, 'PPPOE', 10, 20, 1188, 100774),
(2319, 'DHCP', 10, 20, 1267, 101002),
(2320, 'DHCP', 10, 20, 1349, 100919),
(2321, 'PPPOE', 20, 20, 1084, 100673),
(2322, 'PPPOE', 20, 20, 1269, 101050),
(2323, 'DHCP', 20, 10, 1217, 100779),
(2324, 'PPPOE', 10, 10, 1093, 100786),
(2325, 'DHCP', 10, 10, 1289, 100831),
(2326, 'DHCP', 10, 10, 1387, 101082),
(2327, 'DHCP', 10, 10, 1452, 101145),
(2328, 'DHCP', 10, 20, 1328, 100922),
(2329, 'DHCP', 10, 20, 1477, 100912),
(2330, 'DHCP', 10, 10, 1274, 101188),
(2331, 'PPPOE', 20, 10, 1296, 101051),
(2332, 'DHCP', 10, 10, 1015, 100604),
(2333, 'DHCP', 20, 10, 1340, 100970),
(2334, 'PPPOE', 10, 10, 1425, 100941),
(2335, 'PPPOE', 10, 20, 1418, 100801),
(2336, 'PPPOE', 20, 10, 1461, 100930),
(2337, 'DHCP', 20, 20, 1332, 100672),
(2338, 'PPPOE', 10, 20, 1207, 101027),
(2339, 'PPPOE', 10, 10, 1323, 100821),
(2340, 'PPPOE', 10, 10, 1106, 101061),
(2341, 'DHCP', 20, 20, 1007, 100752),
(2342, 'PPPOE', 10, 10, 1216, 100948),
(2343, 'DHCP', 10, 20, 1296, 100612),
(2344, 'DHCP', 10, 10, 1309, 100912),
(2345, 'DHCP', 20, 10, 1251, 101040),
(2346, 'PPPOE', 20, 10, 1423, 100751),
(2347, 'DHCP', 20, 10, 1192, 100661),
(2348, 'DHCP', 10, 10, 1046, 101096),
(2349, 'PPPOE', 10, 10, 1061, 101187),
(2350, 'DHCP', 10, 20, 1184, 100616),
(2351, 'PPPOE', 10, 10, 1490, 101032),
(2352, 'DHCP', 20, 20, 1354, 100859),
(2353, 'PPPOE', 10, 10, 1032, 100637),
(2354, 'PPPOE', 10, 10, 1475, 100979),
(2355, 'PPPOE', 20, 20, 1097, 100678),
(2356, 'DHCP', 10, 10, 1141, 100985),
(2357, 'DHCP', 10, 10, 1267, 100912),
(2358, 'DHCP', 20, 10, 1101, 101011),
(2359, 'DHCP', 20, 20, 1249, 101115),
(2360, 'DHCP', 20, 20, 1279, 101067),
(2361, 'PPPOE', 20, 10, 1249, 101100),
(2362, 'DHCP', 10, 10, 1162, 101119),
(2363, 'DHCP', 10, 10, 1213, 100725),
(2364, 'PPPOE', 20, 20, 1130, 100772),
(2365, 'DHCP', 20, 10, 1381, 100784),
(2366, 'DHCP', 10, 20, 1099, 100669),
(2367, 'PPPOE', 20, 20, 1053, 100872),
(2368, 'PPPOE', 10, 10, 1062, 100948),
(2369, 'PPPOE', 20, 10, 1176, 100749),
(2370, 'DHCP', 20, 20, 1150, 101127),
(2371, 'DHCP', 10, 10, 1252, 100986),
(2372, 'PPPOE', 10, 10, 1066, 100902),
(2373, 'PPPOE', 20, 20, 1409, 100852),
(2374, 'PPPOE', 10, 20, 1280, 100860),
(2375, 'PPPOE', 10, 10, 1096, 100833),
(2376, 'DHCP', 10, 20, 1134, 100991),
(2377, 'DHCP', 20, 10, 1235, 100945),
(2378, 'DHCP', 20, 10, 1053, 100971),
(2379, 'PPPOE', 20, 20, 1171, 100888),
(2380, 'DHCP', 10, 20, 1492, 100989),
(2381, 'PPPOE', 20, 10, 1084, 101019),
(2382, 'DHCP', 10, 10, 1118, 101067),
(2383, 'PPPOE', 20, 10, 1354, 101017),
(2384, 'PPPOE', 20, 10, 1429, 100790),
(2385, 'DHCP', 20, 20, 1469, 100737),
(2386, 'DHCP', 20, 10, 1070, 101192),
(2387, 'PPPOE', 10, 20, 1201, 101013),
(2388, 'PPPOE', 20, 20, 1373, 101185),
(2389, 'PPPOE', 10, 20, 1165, 101102),
(2390, 'DHCP', 10, 10, 1210, 100607),
(2391, 'DHCP', 10, 20, 1067, 101156),
(2392, 'PPPOE', 10, 10, 1117, 100930),
(2393, 'PPPOE', 10, 20, 1140, 101031),
(2394, 'PPPOE', 20, 10, 1048, 100824),
(2395, 'PPPOE', 10, 20, 1361, 100687),
(2396, 'DHCP', 10, 10, 1434, 101127),
(2397, 'PPPOE', 20, 10, 1415, 101087),
(2398, 'DHCP', 10, 20, 1303, 100857),
(2399, 'PPPOE', 10, 20, 1429, 100787),
(2400, 'DHCP', 20, 10, 1419, 101155),
(2401, 'DHCP', 10, 20, 1478, 100703),
(2402, 'DHCP', 20, 20, 1415, 101043),
(2403, 'PPPOE', 20, 20, 1147, 100716),
(2404, 'PPPOE', 10, 20, 1369, 101022),
(2405, 'PPPOE', 10, 20, 1370, 100993),
(2406, 'DHCP', 20, 20, 1036, 100894),
(2407, 'DHCP', 10, 20, 1447, 100908),
(2408, 'PPPOE', 10, 20, 1061, 101044),
(2409, 'DHCP', 20, 10, 1197, 100659),
(2410, 'PPPOE', 10, 10, 1450, 100956),
(2411, 'DHCP', 20, 20, 1250, 100629),
(2412, 'DHCP', 20, 10, 1092, 100814),
(2413, 'PPPOE', 10, 10, 1195, 100748),
(2414, 'DHCP', 20, 10, 1256, 100832),
(2415, 'PPPOE', 10, 20, 1298, 100872),
(2416, 'PPPOE', 10, 20, 1312, 100823),
(2417, 'PPPOE', 20, 20, 1050, 101045),
(2418, 'PPPOE', 20, 10, 1478, 100812),
(2419, 'PPPOE', 20, 10, 1113, 101106),
(2420, 'PPPOE', 20, 20, 1461, 100668),
(2421, 'DHCP', 20, 10, 1495, 100681),
(2422, 'PPPOE', 20, 10, 1481, 100876),
(2423, 'DHCP', 10, 10, 1152, 100615),
(2424, 'PPPOE', 20, 10, 1321, 100896),
(2425, 'PPPOE', 10, 10, 1027, 100990),
(2426, 'PPPOE', 10, 10, 1118, 101044),
(2427, 'DHCP', 10, 20, 1199, 101124),
(2428, 'DHCP', 20, 10, 1002, 101088),
(2429, 'PPPOE', 10, 20, 1108, 100651),
(2430, 'PPPOE', 20, 20, 1479, 100823),
(2431, 'PPPOE', 10, 20, 1249, 100804),
(2432, 'DHCP', 20, 10, 1273, 101008),
(2433, 'PPPOE', 10, 20, 1249, 101180),
(2434, 'DHCP', 10, 10, 1028, 100857),
(2435, 'DHCP', 20, 10, 1486, 100826),
(2436, 'DHCP', 20, 20, 1499, 100765),
(2437, 'PPPOE', 20, 20, 1372, 101022),
(2438, 'DHCP', 20, 20, 1140, 101019),
(2439, 'PPPOE', 20, 20, 1032, 100689),
(2440, 'DHCP', 10, 10, 1168, 100695),
(2441, 'PPPOE', 10, 10, 1465, 100694),
(2442, 'PPPOE', 10, 20, 1014, 100615),
(2443, 'PPPOE', 10, 10, 1231, 101089),
(2444, 'PPPOE', 10, 10, 1429, 100918),
(2445, 'PPPOE', 20, 20, 1104, 100760),
(2446, 'PPPOE', 10, 10, 1136, 101055),
(2447, 'PPPOE', 20, 10, 1375, 100951),
(2448, 'DHCP', 10, 10, 1061, 100725),
(2449, 'PPPOE', 20, 10, 1204, 100943),
(2450, 'DHCP', 10, 10, 1272, 100799),
(2451, 'DHCP', 20, 20, 1408, 100959),
(2452, 'PPPOE', 10, 10, 1060, 101191),
(2453, 'DHCP', 20, 10, 1479, 100767),
(2454, 'PPPOE', 10, 10, 1483, 101082),
(2455, 'DHCP', 10, 20, 1021, 100915),
(2456, 'PPPOE', 20, 10, 1097, 100925),
(2457, 'DHCP', 20, 20, 1485, 101001),
(2458, 'DHCP', 20, 10, 1245, 100992),
(2459, 'PPPOE', 10, 20, 1310, 100616),
(2460, 'DHCP', 20, 20, 1368, 101127),
(2461, 'PPPOE', 20, 20, 1332, 100933),
(2462, 'PPPOE', 20, 10, 1117, 100613),
(2463, 'DHCP', 10, 10, 1130, 101162),
(2464, 'DHCP', 20, 20, 1499, 100675),
(2465, 'PPPOE', 20, 10, 1207, 100900),
(2466, 'PPPOE', 10, 10, 1263, 101010),
(2467, 'PPPOE', 10, 10, 1068, 100791),
(2468, 'PPPOE', 20, 20, 1239, 100807),
(2469, 'DHCP', 20, 20, 1467, 100886),
(2470, 'DHCP', 10, 20, 1431, 101130),
(2471, 'PPPOE', 10, 20, 1037, 100983),
(2472, 'PPPOE', 20, 20, 1218, 101148),
(2473, 'PPPOE', 10, 20, 1278, 100976),
(2474, 'PPPOE', 20, 10, 1391, 101047),
(2475, 'PPPOE', 10, 20, 1198, 100818),
(2476, 'DHCP', 10, 10, 1024, 100789),
(2477, 'PPPOE', 20, 10, 1445, 100940),
(2478, 'PPPOE', 10, 10, 1332, 100688),
(2479, 'PPPOE', 10, 20, 1459, 101098),
(2480, 'DHCP', 10, 20, 1183, 100928),
(2481, 'PPPOE', 10, 20, 1435, 101117),
(2482, 'DHCP', 10, 20, 1145, 100738),
(2483, 'PPPOE', 10, 10, 1153, 100609),
(2484, 'PPPOE', 20, 10, 1476, 100980),
(2485, 'DHCP', 10, 20, 1381, 101167),
(2486, 'PPPOE', 20, 10, 1352, 100908),
(2487, 'DHCP', 10, 10, 1067, 100918),
(2488, 'PPPOE', 20, 20, 1066, 100770),
(2489, 'PPPOE', 20, 10, 1092, 100817),
(2490, 'DHCP', 10, 10, 1088, 100892),
(2491, 'PPPOE', 10, 10, 1086, 101180),
(2492, 'DHCP', 20, 20, 1182, 101098),
(2493, 'PPPOE', 20, 20, 1096, 101088),
(2494, 'PPPOE', 10, 10, 1236, 100830),
(2495, 'PPPOE', 10, 20, 1344, 101199),
(2496, 'DHCP', 20, 20, 1416, 100745),
(2497, 'PPPOE', 20, 20, 1163, 100813),
(2498, 'PPPOE', 10, 10, 1376, 100830),
(2499, 'DHCP', 20, 10, 1140, 100833);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoUsuario`
--

CREATE TABLE `TipoUsuario` (
  `IDTIPO` int(15) NOT NULL,
  `TIPO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `TipoUsuario`
--

INSERT INTO `TipoUsuario` (`IDTIPO`, `TIPO`) VALUES
(1, 'Administrador'),
(2, 'Activador'),
(3, 'Reportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `IDUSUARIO` int(11) NOT NULL,
  `NombreUsuario` varchar(255) NOT NULL,
  `IDMOVIMIENTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`IDUSUARIO`, `NombreUsuario`, `IDMOVIMIENTO`) VALUES
(50121, 'RamonRamirez', 928566),
(5550122, 'SamsungPerf', 928842),
(5550123, 'CocaColaadmin', 928840),
(5550124, 'ChevroletCar', 928851),
(5550125, 'OxxoMain', 928492);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Zona`
--

CREATE TABLE `Zona` (
  `IDZONA` int(11) NOT NULL,
  `Localizacion` varchar(255) NOT NULL,
  `Ciudad` int(11) NOT NULL,
  `IDCOMERCIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Zona`
--

INSERT INTO `Zona` (`IDZONA`, `Localizacion`, `Ciudad`, `IDCOMERCIO`) VALUES
(120, 'centro', 202, 600),
(300, 'San Javier', 200, 609),
(301, 'Zona Centro', 200, 603),
(302, 'Arboledas de la luz', 201, 601),
(303, 'Granjas del Rosario', 201, 606),
(304, 'Alameda', 202, 611),
(305, 'Ciudad Industrial', 202, 611),
(306, 'Zona Centro', 203, 607),
(307, 'Las Arboledas', 203, 600),
(308, 'Altozano', 204, 612),
(309, 'Las Americas', 204, 609),
(310, 'Lazaro Cardenas', 205, 609),
(311, 'Patzcuaro Centro', 205, 610),
(312, 'Industrial', 206, 605),
(313, 'Las Camelinas', 206, 603),
(314, 'Ninos Heroes', 207, 603),
(315, 'El Carcamo', 207, 612),
(316, 'Bellavista', 208, 606),
(317, 'Constituyentes', 208, 608),
(318, 'Francisco Villa', 209, 613),
(319, 'Doctores', 209, 610),
(320, 'La Fuente', 210, 614),
(321, 'Los Laureles', 210, 612),
(322, 'Alameda', 211, 603),
(323, 'Del Valle', 211, 601),
(324, 'Atlas', 212, 612),
(325, 'Lopez Portillo', 212, 603),
(326, 'Cumbres', 213, 610),
(327, 'Jardines del Valle', 213, 604),
(328, 'Buenos Aires', 214, 601),
(329, 'Valle Dorado', 214, 611),
(330, 'Nuevo Fuerte', 215, 611),
(331, 'San Andres', 215, 601),
(332, 'Acero', 216, 614),
(333, 'Kennedy', 216, 610),
(334, 'Hacienda del Palmar', 217, 602),
(335, 'Industrial Las Palmas', 217, 612),
(336, 'Azteca', 218, 600),
(337, 'Mirasol', 218, 604),
(338, 'Del Valle Oriente', 219, 613),
(339, 'Olimpico', 219, 612),
(340, 'Jardines del Bosque', 201, 614),
(341, 'Lomas del Pedregal', 201, 603),
(342, 'Antorchista', 208, 604),
(343, 'Centenario', 208, 603),
(344, 'Bortoni', 216, 601),
(345, 'Cnop', 216, 606),
(346, 'Dr.Atl', 212, 613),
(347, 'Italia', 212, 603),
(348, 'Ciudad Industrial', 204, 605),
(349, 'Santiaguito', 204, 614);

-- --------------------------------------------------------

--
-- Estructura para la vista `Reporte_contratos_general`
--
DROP TABLE IF EXISTS `Reporte_contratos_general`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `Reporte_contratos_general`  AS  select `Clientes`.`NoContrato` AS `NoContrato`,`Clientes`.`Status` AS `Status`,`Empresa`.`Nombre` AS `Nombre`,`Comercio`.`NombreComercial` AS `NombreComercial`,`Zona`.`Localizacion` AS `Localizacion`,`Servicios`.`Tipo` AS `Tipo`,`Servicios`.`VelDescarga` AS `VelDescarga`,`Servicios`.`VelSubida` AS `VelSubida`,`Equipo`.`NoSERIE` AS `NoSERIE`,`fuction_format_date`(`Movimientos`.`Fecha`) AS `Fecha`,`Movimientos`.`IDMOVIMIENTO` AS `IDMOVIMIENTO` from ((((((`Movimientos` join `Equipo` on((`Movimientos`.`NoSerie` = `Equipo`.`NoSERIE`))) join `Servicios` on((`Equipo`.`NoSERIE` = `Servicios`.`NoSerie`))) join `Clientes` on((`Clientes`.`NoContrato` = `Servicios`.`NoContrato`))) join `Empresa` on((`Clientes`.`IDEMPRESA` = `Empresa`.`IDEMPRESA`))) join `Comercio` on((`Comercio`.`IdEmpresa` = `Empresa`.`IDEMPRESA`))) join `Zona` on((`Zona`.`IDCOMERCIO` = `Comercio`.`IDCOMERCIO`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `Reporte_equipos_general`
--
DROP TABLE IF EXISTS `Reporte_equipos_general`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `Reporte_equipos_general`  AS  select `Equipo`.`NoSERIE` AS `NoSERIE`,`Clientes`.`NoContrato` AS `NoContrato`,`Equipo`.`Modelo` AS `Modelo`,`Equipo`.`DireccionMAC` AS `DireccionMAC`,`Servicios`.`Tipo` AS `Tipo`,`Servicios`.`VelSubida` AS `VelSubida`,`Servicios`.`VelDescarga` AS `VelDescarga`,`Empresa`.`Nombre` AS `Nombre`,`Movimientos`.`Fecha` AS `Fecha` from ((((`Movimientos` join `Equipo` on((`Movimientos`.`NoSerie` = `Equipo`.`NoSERIE`))) join `Servicios` on((`Equipo`.`NoSERIE` = `Servicios`.`NoSerie`))) join `Clientes` on((`Servicios`.`NoContrato` = `Clientes`.`NoContrato`))) join `Empresa` on((`Clientes`.`IDEMPRESA` = `Empresa`.`IDEMPRESA`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  ADD PRIMARY KEY (`IDCIUDAD`),
  ADD KEY `Ciudad_fk0` (`Estado`);

--
-- Indices de la tabla `ClienteMov`
--
ALTER TABLE `ClienteMov`
  ADD PRIMARY KEY (`IDMOVIMIENTOCLIENTE`),
  ADD KEY `NoContrato` (`NoContrato`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`NoContrato`),
  ADD KEY `Clientes_fk0` (`IDEMPRESA`),
  ADD KEY `Clientes_ibfk_1` (`IDCOMERCIO`);

--
-- Indices de la tabla `Comercio`
--
ALTER TABLE `Comercio`
  ADD PRIMARY KEY (`IDCOMERCIO`),
  ADD KEY `IdEmpresa` (`IdEmpresa`);

--
-- Indices de la tabla `Empresa`
--
ALTER TABLE `Empresa`
  ADD PRIMARY KEY (`IDEMPRESA`);

--
-- Indices de la tabla `Equipo`
--
ALTER TABLE `Equipo`
  ADD PRIMARY KEY (`NoSERIE`);

--
-- Indices de la tabla `Estado`
--
ALTER TABLE `Estado`
  ADD PRIMARY KEY (`IDESTADO`);

--
-- Indices de la tabla `LoginUsuario`
--
ALTER TABLE `LoginUsuario`
  ADD PRIMARY KEY (`IDLOGIN`),
  ADD KEY `LoginUsuario_ibfk_1` (`IDREGISTRO`);

--
-- Indices de la tabla `Movimientos`
--
ALTER TABLE `Movimientos`
  ADD PRIMARY KEY (`IDMOVIMIENTO`),
  ADD KEY `Movimientos_fk0` (`NoSerie`);

--
-- Indices de la tabla `RegistroUsuarios`
--
ALTER TABLE `RegistroUsuarios`
  ADD PRIMARY KEY (`IDREGISTRO`),
  ADD KEY `RegistroUsuarios_ibfk_1` (`TipoUsuario`);

--
-- Indices de la tabla `Servicios`
--
ALTER TABLE `Servicios`
  ADD PRIMARY KEY (`ID_TIPO`),
  ADD KEY `Servicios_fk0` (`NoContrato`),
  ADD KEY `Servicios_fk1` (`NoSerie`);

--
-- Indices de la tabla `TipoUsuario`
--
ALTER TABLE `TipoUsuario`
  ADD PRIMARY KEY (`IDTIPO`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `Usuarios_fk0` (`IDMOVIMIENTO`);

--
-- Indices de la tabla `Zona`
--
ALTER TABLE `Zona`
  ADD PRIMARY KEY (`IDZONA`),
  ADD KEY `Zona_fk0` (`Ciudad`),
  ADD KEY `Zona_fk1` (`IDCOMERCIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  MODIFY `IDCIUDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT de la tabla `ClienteMov`
--
ALTER TABLE `ClienteMov`
  MODIFY `IDMOVIMIENTOCLIENTE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `NoContrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1500;
--
-- AUTO_INCREMENT de la tabla `Comercio`
--
ALTER TABLE `Comercio`
  MODIFY `IDCOMERCIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=615;
--
-- AUTO_INCREMENT de la tabla `Empresa`
--
ALTER TABLE `Empresa`
  MODIFY `IDEMPRESA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;
--
-- AUTO_INCREMENT de la tabla `Equipo`
--
ALTER TABLE `Equipo`
  MODIFY `NoSERIE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101200;
--
-- AUTO_INCREMENT de la tabla `Estado`
--
ALTER TABLE `Estado`
  MODIFY `IDESTADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;
--
-- AUTO_INCREMENT de la tabla `LoginUsuario`
--
ALTER TABLE `LoginUsuario`
  MODIFY `IDLOGIN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT de la tabla `Movimientos`
--
ALTER TABLE `Movimientos`
  MODIFY `IDMOVIMIENTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=928892;
--
-- AUTO_INCREMENT de la tabla `RegistroUsuarios`
--
ALTER TABLE `RegistroUsuarios`
  MODIFY `IDREGISTRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Servicios`
--
ALTER TABLE `Servicios`
  MODIFY `ID_TIPO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2500;
--
-- AUTO_INCREMENT de la tabla `TipoUsuario`
--
ALTER TABLE `TipoUsuario`
  MODIFY `IDTIPO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5550126;
--
-- AUTO_INCREMENT de la tabla `Zona`
--
ALTER TABLE `Zona`
  MODIFY `IDZONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  ADD CONSTRAINT `Ciudad_fk0` FOREIGN KEY (`Estado`) REFERENCES `Estado` (`IDESTADO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ClienteMov`
--
ALTER TABLE `ClienteMov`
  ADD CONSTRAINT `NoContrato` FOREIGN KEY (`NoContrato`) REFERENCES `Clientes` (`NoContrato`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD CONSTRAINT `Clientes_fk0` FOREIGN KEY (`IDEMPRESA`) REFERENCES `Empresa` (`IDEMPRESA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Clientes_ibfk_1` FOREIGN KEY (`IDCOMERCIO`) REFERENCES `Comercio` (`IDCOMERCIO`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `Comercio`
--
ALTER TABLE `Comercio`
  ADD CONSTRAINT `IdEmpresa` FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IDEMPRESA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `LoginUsuario`
--
ALTER TABLE `LoginUsuario`
  ADD CONSTRAINT `LoginUsuario_ibfk_1` FOREIGN KEY (`IDREGISTRO`) REFERENCES `RegistroUsuarios` (`IDREGISTRO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Movimientos`
--
ALTER TABLE `Movimientos`
  ADD CONSTRAINT `Movimientos_fk0` FOREIGN KEY (`NoSerie`) REFERENCES `Equipo` (`NoSERIE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `RegistroUsuarios`
--
ALTER TABLE `RegistroUsuarios`
  ADD CONSTRAINT `RegistroUsuarios_ibfk_1` FOREIGN KEY (`TipoUsuario`) REFERENCES `TipoUsuario` (`IDTIPO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Servicios`
--
ALTER TABLE `Servicios`
  ADD CONSTRAINT `Servicios_fk0` FOREIGN KEY (`NoContrato`) REFERENCES `Clientes` (`NoContrato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Servicios_fk1` FOREIGN KEY (`NoSerie`) REFERENCES `Equipo` (`NoSERIE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `Usuarios_fk0` FOREIGN KEY (`IDMOVIMIENTO`) REFERENCES `Movimientos` (`IDMOVIMIENTO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Zona`
--
ALTER TABLE `Zona`
  ADD CONSTRAINT `Zona_fk0` FOREIGN KEY (`Ciudad`) REFERENCES `Ciudad` (`IDCIUDAD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Zona_fk1` FOREIGN KEY (`IDCOMERCIO`) REFERENCES `Comercio` (`IDCOMERCIO`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
