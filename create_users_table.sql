CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;