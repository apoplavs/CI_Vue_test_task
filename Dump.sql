CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` varchar(1024) DEFAULT NULL,
  `short_description` varchar(2048) DEFAULT NULL,
  `text` text,
  `img` varchar(1024) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `status` enum('open','closed') DEFAULT 'open',
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `news` (`id`, `header`, `short_description`, `text`, `img`, `tags`, `status`, `time_created`, `time_updated`)
VALUES
	(1,'News #1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore \' +\n            \'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\' +\n            \' ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu \' +\n            \'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt \' +\n            \'mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore \' +\n            \'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\' +\n            \' ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu \' +\n            \'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt \' +\n            \'mollit anim id est laborum.','/assets/images/news/cover-news-20180808.png','кек,чебурек','open','2018-08-30 16:31:14','2018-10-11 04:37:16'),
	(3,'Эх, чужд кайф, сплющь','<p>Широкая электрификация южных губерний даст мощный толчок подъёму сельского хозяйства.<br></p>','<<<<<<<p>Эй, жлоб! Где туз? Прячь юных <u><b>съёмщиц</b></u> в шкаф. Съешь [же] ещё этих мягких <span style=\"background-color: rgb(255, 255, 0);\">французских</span> булок да выпей чаю. В чащах юга жил бы цитрус? Да, но фальшивый экземпляр! Эх, чужак! Общий съём <a href=\"#\" target=\"_blank\">цен</a> шляп (юфть) — вдрызг!<br></p>','/assets/images/news/3.jpg',NULL,'open','2018-10-11 04:33:27','2018-11-13 04:17:04'),
	(4,'News #4','But I must explain to you how all this mistaken idea','But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful','/assets/images/news/4.jpg',NULL,'open','2018-12-11 04:33:27','2018-12-13 04:17:04'),
	(5,'News #5','On the other hand','On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain.','/assets/images/news/5.png','метка,пицца','open','2018-09-30 16:31:14','2018-10-12 04:37:16');

CREATE TABLE IF NOT EXISTS `news_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_id` int(11) NOT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `news_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_id` int(11) NOT NULL,
  `comment` text,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comments_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;