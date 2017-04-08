CREATE DATABASE loopback-owner-acl;

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deptName` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`userId`),
  CONSTRAINT `dept_userdata_fk` FOREIGN KEY (`userId`) REFERENCES `user_data` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `dept` WRITE;

INSERT INTO `dept` (`userId`, `deptName`)
VALUES
  (1,'HR'),
  (2,'PR');

UNLOCK TABLES;

DROP TABLE IF EXISTS `user_data`;

CREATE TABLE `user_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user_data` WRITE;

INSERT INTO `user_data` (`id`, `password`, `email`)
VALUES
  (1,'$2a$10$t5QNFD/421NG8tihmUhEh.s3SXKss8qrigjR7QMFfVq2vj7GQH2uS','john@gmail.com'),
  (2,'$2a$10$T6VFzKSk7T0xDKZ.p0aPYuc6QWDTYiwLYJKUoFt9GqWObdV52CCyu','lara@gmail.com');

UNLOCK TABLES;