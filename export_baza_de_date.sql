-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: apr. 04, 2020 la 12:41 PM
-- Versiune server: 10.4.11-MariaDB
-- Versiune PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `ses_4`
--

DELIMITER $$
--
-- Proceduri
--
DROP PROCEDURE IF EXISTS `GetTotalOrderdProductsFromCategory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTotalOrderdProductsFromCategory` (IN `pCatId` INT(11))  NO SQL
BEGIN
	SELECT ct.*, pt.id AS product_id, pt.nume AS product_name, count(*) AS total FROM categories AS ct JOIN products AS pt ON pt.category_id = ct.id JOIN order_product AS opt ON opt.product_id = pt.id WHERE ct.id = pCatId GROUP BY pt.id;
END$$

DROP PROCEDURE IF EXISTS `InsertOrderWithProduct`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrderWithProduct` (IN `numeComanda` VARCHAR(255), IN `produsId` INT(11))  NO SQL
BEGIN

INSERT INTO orders VALUES (NULL, numeComanda);
INSERT INTO order_product VALUES (NULL, LAST_INSERT_ID(), produsId); 

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nume` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `categories`
--

INSERT INTO `categories` (`id`, `nume`) VALUES
(1, 'Bauturi'),
(2, 'Pizza'),
(3, 'Mic Dejun'),
(6, 'set_null'),
(7, 'set_null');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `nume` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `orders`
--

INSERT INTO `orders` (`id`, `nume`) VALUES
(1, 'order 1'),
(2, 'order 2'),
(3, 'test'),
(4, 'super'),
(5, 'test123'),
(6, 'test123'),
(7, 'super');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`) VALUES
(1, 1, 3),
(2, 1, 3),
(3, 1, 5),
(4, 2, 3),
(5, 2, 4),
(6, 2, 4),
(7, 2, 3),
(8, 1, 6),
(9, 1, 6);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nume` varchar(300) NOT NULL,
  `descriere` varchar(1000) NOT NULL,
  `pret` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `products`
--

INSERT INTO `products` (`id`, `nume`, `descriere`, `pret`, `category_id`) VALUES
(3, 'Margherita', 'pizza Margherita', 100, 2),
(4, 'Cereale si Lapte', 'Cereale si LapteCereale si LapteCereale si LapteCereale si LapteCereale si Lapte', 30, 3),
(5, 'Cola', 'descr', 10, 1),
(6, 'Fanta', 'aasdasdsadasd', 11, 2),
(7, 'test', 'test', 888, 1),
(9, 'set_null_prod', 'set_null_prod', 21321, NULL);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id_fk` (`order_id`),
  ADD KEY `product_id_fk` (`product_id`);

--
-- Indexuri pentru tabele `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_fk` (`category_id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pentru tabele `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pentru tabele `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pentru tabele `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constrângeri pentru tabele `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
