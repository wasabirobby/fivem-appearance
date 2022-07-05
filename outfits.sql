CREATE TABLE `outfits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `name` longtext,
  `ped` longtext,
  `components` longtext,
  `props` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;