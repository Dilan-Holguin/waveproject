-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para wave
CREATE DATABASE IF NOT EXISTS `wave` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `wave`;

-- Volcando estructura para tabla wave.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `pfp` varchar(256) NOT NULL DEFAULT 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e',
  `spotify` varchar(256) NOT NULL,
  `biografia` text NOT NULL,
  `youtube` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla wave.users: ~4 rows (aproximadamente)
INSERT INTO `users` (`id`, `username`, `contrasena`, `pfp`, `spotify`, `biografia`, `youtube`) VALUES
	(2, 'd', 'a', 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e', 'a', '', 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e'),
	(4, 'YUNGKOSEI', '123', 'https://pbs.twimg.com/media/FtTe-5DWwAA96u4?format=jpg&name=large', 'a', 'Je n\'ai presque plus la force de marcher\r\nTu ne sais pas que tu ressens l\'affection de la vérité\r\nSi tu finis la nuit, tu ne peux pas perdre\r\nEt si je pleurais dans chaque coin sans dimension ?\r\nEt s’il ne vous aime que numériquement ?', 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e'),
	(6, 'santiago', '123', 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e', 'a', '', 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e'),
	(7, 'jesus', '22', 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e', 'a', '', 'https://firebasestorage.googleapis.com/v0/b/wave-81754.appspot.com/o/pfpdefault.jpg?alt=media&token=e55d927a-010f-453e-bad0-70e51b94533e');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
