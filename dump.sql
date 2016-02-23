# ************************************************************
# Sequel Pro SQL dump
# Version 4500
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: auctions.cjfabur5dk4o.us-east-1.rds.amazonaws.com (MySQL 5.6.23-log)
# Database: auction_data
# Generation Time: 2016-02-23 8:19:23 pm +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auctions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auctions`;

CREATE TABLE `auctions` (
  `auction_id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_item_id` int(11) NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `reserve_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`auction_id`),
  KEY `auction_item_id` (`auction_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;

INSERT INTO `auctions` (`auction_id`, `auction_item_id`, `is_complete`, `start_time`, `end_time`, `reserve_price`)
VALUES
	(1,30,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0.00);

/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table bids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bids`;

CREATE TABLE `bids` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `bidder_user_id` int(11) NOT NULL,
  `bid_price` decimal(10,2) NOT NULL,
  `bid_time` timestamp NOT NULL,
  `bid_auction_id` int(11) NOT NULL,
  PRIMARY KEY (`bid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;

INSERT INTO `bids` (`bid_id`, `bidder_user_id`, `bid_price`, `bid_time`, `bid_auction_id`)
VALUES
	(1,2,22.00,'2016-02-09 17:04:32',0),
	(2,3,23.00,'2016-02-09 17:04:42',0),
	(3,8,24.00,'2016-02-09 17:04:50',0),
	(4,2,25.00,'2016-02-09 17:13:27',0),
	(5,1,27.00,'2016-02-16 17:45:45',0),
	(6,1,28.00,'2016-02-16 18:14:36',0),
	(7,1,28.00,'2016-02-16 18:14:53',0),
	(8,1,28.00,'2016-02-16 18:16:12',0),
	(9,1,28.00,'2016-02-16 18:16:55',0),
	(10,1,29.00,'2016-02-17 19:43:43',0),
	(11,1,31.00,'2016-02-17 19:50:18',0),
	(12,1,34.00,'2016-02-17 20:23:44',0),
	(13,1,35.00,'2016-02-22 11:48:26',0);

/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_text` varchar(140) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `feedback_auction_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `buyer_text` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;

INSERT INTO `feedback` (`feedback_id`, `seller_text`, `seller_id`, `feedback_auction_id`, `buyer_id`, `buyer_text`)
VALUES
	(1,'i had fun',2,1,1,'it was groovy');

/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hashtagories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hashtagories`;

CREATE TABLE `hashtagories` (
  `text` varchar(20) NOT NULL,
  PRIMARY KEY (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `hashtagories` WRITE;
/*!40000 ALTER TABLE `hashtagories` DISABLE KEYS */;

INSERT INTO `hashtagories` (`text`)
VALUES
	('bananas'),
	('vegan');

/*!40000 ALTER TABLE `hashtagories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table item_hashtagories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_hashtagories`;

CREATE TABLE `item_hashtagories` (
  `tagged_item_id` int(11) NOT NULL,
  `hashtagory_text` varchar(20) NOT NULL,
  PRIMARY KEY (`tagged_item_id`,`hashtagory_text`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `item_hashtagories` WRITE;
/*!40000 ALTER TABLE `item_hashtagories` DISABLE KEYS */;

INSERT INTO `item_hashtagories` (`tagged_item_id`, `hashtagory_text`)
VALUES
	(102,'bananas'),
	(102,'raw'),
	(102,'vegan'),
	(102,'yellow');

/*!40000 ALTER TABLE `item_hashtagories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`item_id`, `owner_user_id`, `title`, `description`)
VALUES
	(102,9,'a new name','I am so good at making up descriptions'),
	(103,37,'arcu. Vestibulum ut','vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,'),
	(104,5,'sollicitudin orci sem','tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor,'),
	(105,1,'urna suscipit nonummy.','non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod'),
	(106,98,'vitae sodales nisi','et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula'),
	(107,61,'at augue id','arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum'),
	(108,53,'consequat dolor vitae','pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu'),
	(109,3,'magna. Phasellus test','iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus'),
	(110,81,'tortor nibh sit','mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut'),
	(111,42,'Donec feugiat metus','orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla.'),
	(112,33,'magna a neque.','justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue'),
	(113,33,'lacus. Quisque purus','orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla.'),
	(114,77,'pede, malesuada vel,','amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc.'),
	(115,29,'libero lacus, varius','aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis'),
	(116,4,'libero dui nec','lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus'),
	(117,95,'et tristique pellentesque,','lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.'),
	(118,51,'sit amet ante.','Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec'),
	(119,55,'pharetra sed, hendrerit','consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.'),
	(120,86,'odio. Etiam ligula','ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent'),
	(121,38,'eget varius ultrices,','at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor'),
	(122,61,'orci tincidunt adipiscing.','non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod'),
	(123,35,'sodales purus, in','mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in,'),
	(124,13,'arcu eu odio','in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac'),
	(125,63,'Donec egestas. Aliquam','pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac'),
	(126,28,'blandit congue. In','pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed,'),
	(127,36,'elit. Nulla facilisi.','interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,'),
	(128,46,'luctus et ultrices','dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et,'),
	(129,100,'at lacus. Quisque','egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris,'),
	(130,88,'Sed id risus','dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec'),
	(131,75,'Donec porttitor tellus','lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo'),
	(132,20,'imperdiet ullamcorper. Duis','dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient'),
	(133,41,'mus. Aenean eget','nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia'),
	(134,54,'tincidunt. Donec vitae','porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi'),
	(135,68,'nibh sit amet','eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,'),
	(136,92,'consequat auctor, nunc','massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,'),
	(137,6,'mus. Proin vel','risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum'),
	(138,37,'lectus convallis est,','amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus'),
	(139,88,'Suspendisse sed dolor.','mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,'),
	(140,35,'nisi nibh lacinia','libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc'),
	(141,81,'sed dictum eleifend,','volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas'),
	(142,92,'vitae aliquam eros','ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla.'),
	(143,63,'Duis cursus, diam','libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum'),
	(144,67,'Proin vel nisl.','volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas'),
	(145,8,'porta elit, a','Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in'),
	(146,79,'cubilia Curae; Phasellus','non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget'),
	(147,31,'auctor velit. Aliquam','Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et'),
	(148,99,'ullamcorper, nisl arcu','primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In'),
	(149,67,'nulla. In tincidunt','Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper'),
	(150,70,'Nullam feugiat placerat','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam'),
	(151,78,'iaculis quis, pede.','ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.'),
	(152,39,'purus. Maecenas libero','ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis'),
	(153,1,'velit justo nec','neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam'),
	(154,44,'mi lorem, vehicula','suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus'),
	(155,17,'eget, ipsum. Donec','non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec'),
	(156,86,'feugiat metus sit','nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel,'),
	(157,18,'dictum magna. Ut','imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis'),
	(158,75,'pretium neque. Morbi','Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae'),
	(159,82,'eget tincidunt dui','a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius'),
	(160,6,'ipsum non arcu.','eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et'),
	(161,35,'laoreet lectus quis','eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada'),
	(162,29,'sed pede nec','mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In'),
	(163,57,'massa non ante','mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum'),
	(164,32,'Nunc ac sem','ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor'),
	(165,37,'Suspendisse non leo.','tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In'),
	(166,20,'ultricies ornare, elit','varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis,'),
	(167,39,'natoque penatibus et','ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra.'),
	(168,75,'euismod est arcu','risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing'),
	(169,80,'nascetur ridiculus mus.','Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien.'),
	(170,66,'semper. Nam tempor','dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem'),
	(171,14,'Phasellus at augue','Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue'),
	(172,90,'at, velit. Pellentesque','felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris'),
	(173,22,'Cum sociis natoque','sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque'),
	(174,78,'luctus lobortis. Class','Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit'),
	(175,91,'Mauris blandit enim','erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus'),
	(176,27,'Donec est. Nunc','ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a,'),
	(177,44,'pretium neque. Morbi','non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus.'),
	(178,33,'Ut tincidunt orci','rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque'),
	(179,36,'odio vel est','Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique'),
	(180,87,'tortor at risus.','imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate'),
	(181,67,'pharetra nibh. Aliquam','amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis'),
	(182,13,'tempus non, lacinia','Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus'),
	(183,81,'ac nulla. In','hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec,'),
	(184,62,'auctor, velit eget','feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer'),
	(185,75,'blandit enim consequat','Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui'),
	(186,60,'Integer eu lacus.','sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet'),
	(187,100,'a, arcu. Sed','Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,'),
	(188,19,'dictum cursus. Nunc','est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem,'),
	(189,53,'felis. Nulla tempor','justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse'),
	(190,64,'Duis cursus, diam','vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis'),
	(191,21,'dictum. Proin eget','faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan'),
	(192,6,'Donec tincidunt. Donec','sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at'),
	(193,75,'erat, in consectetuer','vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas'),
	(194,52,'consequat purus. Maecenas','metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae'),
	(195,83,'ornare, elit elit','Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna.'),
	(196,23,'risus. Nunc ac','felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris'),
	(197,90,'commodo ipsum. Suspendisse','facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient'),
	(198,61,'Phasellus vitae mauris','amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at'),
	(199,87,'turpis. In condimentum.','orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt'),
	(200,72,'cubilia Curae; Donec','sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut'),
	(203,9,'stuff','I have words');

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`username`, `user_id`, `first_name`, `last_name`, `email`, `password`)
VALUES
	('quam.bob',1,'George','Mccarthy','aliquet@dolordapibusgravida.net',''),
	('Proin',2,'Judah','Zamora','Donec@estconguea.com',''),
	('asdf',3,'Laith','Harvey','nisi.magna.sed@Cumsociis.com',''),
	('eget',4,'Fritz','Trujillo','lobortis.ultrices.Vivamus@dictum.ca',''),
	('fringilla',5,'Gil','Lawrence','vitae.risus.Duis@velit.edu',''),
	('nonummy.bo',6,'Hammett','Wallace','nec.diam.Duis@diamProindolor.com',''),
	('In',7,'Stuart','Simmons','sit@musDonecdignissim.com',''),
	('at',8,'Anthony','Foley','lacus@nibhvulputate.ca',''),
	('fringilla',9,'Wallace','Nielsen','Quisque@Integertinciduntaliquam.org',''),
	('tincidunt',10,'Kenneth','Ford','Nullam@Maurisnon.ca',''),
	('lorem.bob',11,'Scott','Waters','magnis.dis.parturient@blanditmattisCras.edu',''),
	('ac',12,'Levi','Bishop','Donec@eratVivamus.co.uk',''),
	('erat.bob',13,'Herman','Savage','eget.metus@ipsumleoelementum.edu',''),
	('luctus',14,'Geoffrey','Mcneil','Quisque@lacusCrasinterdum.ca',''),
	('nulla.bob',15,'Jesse','Anderson','nostra.per.inceptos@dis.edu',''),
	('elit',16,'Cullen','Long','rutrum@uteros.ca',''),
	('Pellentesq',17,'Alvin','Alvarez','eu@fermentumfermentum.com',''),
	('In',18,'Elvis','Whitehead','nisl@Aliquamornare.org',''),
	('mollis',19,'Fitzgerald','Waller','Nulla.facilisis@primisin.net',''),
	('dolor',20,'Clarke','Thompson','Nunc.mauris.sapien@dignissimtempor.edu',''),
	('urna.bob',21,'Julian','Bates','orci@dapibus.com',''),
	('odio',22,'Graiden','Hopkins','urna@Cras.net',''),
	('faucibus',23,'Ahmed','Valencia','ut.lacus.Nulla@hendrerita.com',''),
	('nec',24,'Nigel','Moreno','Vivamus.molestie.dapibus@luctusCurabitur.co.uk',''),
	('sollicitud',25,'Raja','Zimmerman','nunc.ullamcorper.eu@varius.net',''),
	('enim',26,'Orson','Stark','non.quam.Pellentesque@ornaresagittisfelis.co.uk',''),
	('augue',27,'Garth','Burch','leo@mauriseuelit.co.uk',''),
	('ac',28,'Grady','Lawrence','sit.amet@augue.com',''),
	('sem',29,'John','Baker','Quisque.fringilla@dictumultriciesligula.net',''),
	('erat',30,'Harper','Foreman','Donec.egestas@massaVestibulum.ca',''),
	('In',31,'Lars','Mooney','lobortis.quis@eros.ca',''),
	('augue',32,'Todd','Townsend','consequat.auctor.nunc@primisin.edu',''),
	('non',33,'Kennedy','Bradley','Nunc.quis@sitametultricies.org',''),
	('diam.bob',35,'Wylie','Allison','id.risus.quis@Donecestmauris.org',''),
	('posuere',36,'Dillon','Hammond','feugiat.nec@et.org',''),
	('rhoncus.bo',37,'Arsenio','Maddox','et.magnis.dis@sed.org',''),
	('ac',38,'Emmanuel','Browning','ac.arcu.Nunc@dolorsit.co.uk',''),
	('magna',39,'Elmo','Cochran','sagittis.felis.Donec@est.net',''),
	('eget',41,'Brady','Davidson','ultricies.dignissim.lacus@neque.net',''),
	('vestibulum',42,'Rudyard','Holman','nec.metus.facilisis@tristiquealiquet.com',''),
	('Donec',43,'Samson','Silva','faucibus@afeugiattellus.net',''),
	('amet',44,'Blake','Molina','lacus.vestibulum@eu.com',''),
	('sit',45,'Cody','Andrews','Proin.eget.odio@dolorNullasemper.edu',''),
	('ligula.bob',46,'Francis','Deleon','magna.malesuada@netus.edu',''),
	('et',47,'Lee','Miles','non@nisi.com',''),
	('et',48,'Leroy','Cantrell','sapien.Aenean.massa@consequatauctornunc.com',''),
	('Donec',49,'Thor','Webb','sociosqu@Donectincidunt.edu',''),
	('sem',50,'Merritt','Whitney','aliquet.magna@nuncullamcorpereu.co.uk',''),
	('ipsum',51,'Neville','Bowen','non.enim.Mauris@a.com',''),
	('morbi',52,'Hilel','Sanders','imperdiet.non.vestibulum@in.co.uk',''),
	('lorem',53,'Nehru','Phillips','sem.ut@faucibusMorbi.co.uk',''),
	('sapien.bob',54,'Patrick','Hudson','pretium.aliquet@Vivamuseuismod.net',''),
	('Aenean',55,'Lawrence','Bates','velit.Cras@molestiesodales.net',''),
	('diam',56,'Harding','Dodson','urna.Nullam.lobortis@porttitorinterdum.edu',''),
	('congue.bob',57,'Kevin','Pickett','Aliquam.auctor@arcuimperdiet.org',''),
	('ac',58,'Rafael','Winters','congue.a.aliquet@pede.edu',''),
	('Nullam',59,'Cruz','Henry','risus.odio.auctor@parturientmontesnascetur.org',''),
	('ipsum.bob',60,'Marsden','Beasley','facilisis.vitae@penatibuset.edu',''),
	('dui',62,'Zephania','Sawyer','est@nonquamPellentesque.com',''),
	('porttitor',63,'Ali','Barrett','torquent.per.conubia@est.com',''),
	('sapien.bob',64,'Bert','Lambert','sodales.at.velit@mollis.co.uk',''),
	('lectus',65,'Perry','Weiss','non.enim@aliquet.ca',''),
	('vitae',66,'Jared','Boyer','vehicula@ultricies.com',''),
	('quam',67,'Jesse','Reed','Vestibulum@viverraDonectempus.org',''),
	('cursus',68,'Perry','Fleming','urna@ullamcorper.com',''),
	('arcu.bob',69,'Brody','Wagner','Nunc.ut.erat@velitegestaslacinia.co.uk',''),
	('Fusce',70,'Levi','Irwin','imperdiet.ornare@felis.com',''),
	('convallis',71,'Graham','Sampson','tempor.lorem@Aliquamerat.net',''),
	('sit',72,'Yasir','England','accumsan.neque.et@vulputateveliteu.edu',''),
	('Curabitur',73,'Gage','Dudley','fringilla.euismod.enim@nonquamPellentesque.net',''),
	('tincidunt',74,'Yuli','Gibson','purus.accumsan.interdum@Crasvehicula.ca',''),
	('interdum',75,'Roth','Owen','elit@Vivamusnonlorem.co.uk',''),
	('massa',76,'Travis','Mercado','elit@diamDuis.ca',''),
	('odio',77,'Lionel','Watkins','aliquam@pharetrafeliseget.edu',''),
	('lobortis.b',78,'Magee','Wallace','tristique@massarutrum.net',''),
	('In',79,'Gavin','Howard','blandit@sit.net',''),
	('pretium',80,'Zeph','Parrish','pede.ultrices.a@Innec.net',''),
	('ligula',81,'Kadeem','Sharp','Nunc.laoreet@neque.ca',''),
	('commodo',82,'Jarrod','Serrano','viverra.Maecenas@interdumNunc.com',''),
	('Proin',83,'Herman','Sykes','elit.a.feugiat@laoreetipsum.ca',''),
	('consequat',84,'Mufutau','Zamora','Pellentesque@augue.edu',''),
	('augue',85,'Oscar','Lyons','luctus.ut.pellentesque@enim.org',''),
	('molestie.b',86,'Zane','Torres','Nulla@dolorvitaedolor.org',''),
	('Nunc',87,'Hop','Moody','convallis.convallis.dolor@tacitisociosquad.net',''),
	('pede',88,'Tyler','Workman','egestas.Duis@Uttinciduntorci.com',''),
	('eu',89,'Isaac','Harding','ullamcorper@velit.net',''),
	('nunc',91,'Hoyt','Mcdaniel','scelerisque.neque.sed@turpisnecmauris.ca',''),
	('Nunc',92,'Ciaran','Ashley','risus.Donec.nibh@pedemalesuadavel.ca',''),
	('lacinia',93,'Rogan','Hays','at.egestas@imperdietnon.com',''),
	('venenatis',94,'Elijah','Hoover','vulputate.dui.nec@euultrices.co.uk',''),
	('malesuada',95,'Leo','Curry','Cras@magnatellus.org',''),
	('fermentum',96,'August','Meyer','Vivamus@nequeseddictum.com',''),
	('eu',97,'Macon','Lindsay','mauris.sit@ligulaAenean.ca',''),
	('sit',98,'Igor','Boone','est.mollis@nunc.edu',''),
	('arcu',99,'Magee','Guzman','ullamcorper@Vivamusnibh.edu',''),
	('Donec',100,'William','Sellers','nec.mauris@neque.net',''),
	('edward',101,'ed','m','email@email.com','');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table watches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `watches`;

CREATE TABLE `watches` (
  `watch_user_id` int(11) NOT NULL,
  `watch_auction_id` int(11) NOT NULL,
  PRIMARY KEY (`watch_user_id`,`watch_auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;

INSERT INTO `watches` (`watch_user_id`, `watch_auction_id`)
VALUES
	(0,1),
	(3,1);

/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines (PROCEDURE) for database 'auction_data'
--
DELIMITER ;;

# Dump of PROCEDURE auctions_cancel
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_cancel` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_cancel`(IN auction_id INT(11))
BEGIN
	DELETE FROM `auctions` WHERE auctions.auction_id = auction_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_create`(IN auction_item_id INT(11), IN start_time timestamp, IN end_time timestamp, IN reserve_price varchar(12))
BEGIN
INSERT INTO `auctions` (auctions.auction_item_id, auctions.start_time, auctions.end_time, auctions.reserve_price) VALUES(auction_item_id, start_time, end_time, CAST(reserve_price AS DECIMAL(10,2)));
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_hastagory
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_hastagory` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_hastagory`(IN hash1 varchar(20), IN hash2 varchar(20), IN hash3 varchar(20), IN hash4 varchar(20), IN hash5 varchar(20))
BEGIN
	
    SELECT * FROM `item_hashtagories` as ih, `items` as i, `auctions` as a WHERE
    (ih.hashtagory_text = hash1 OR
    ih.hashtagory_text = hash2 OR
    ih.hashtagory_text = hash3 OR
    ih.hashtagory_text = hash4 OR
    ih.hashtagory_text = hash5 ) AND
    i.item_id = ih.tagged_item_id AND
    i.item_id = a.auction_item_id AND
    a.is_complete = 0;
    
    
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_retrieve_all
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_retrieve_all` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_retrieve_all`()
BEGIN
	SELECT * FROM `auctions` AS a, `items` AS i WHERE a.is_complete = 0 AND a.auction_item_id = i.item_id ORDER BY `end_time` ASC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_self
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_self` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_self`(IN auction_id INT(11))
BEGIN
	SELECT * FROM `auctions`
    LEFT JOIN `items` ON auctions.auction_item_id = items.item_id
    WHERE auctions.auction_id = auction_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_user_auctions
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_user_auctions` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_user_auctions`(IN user_id INT(11))
BEGIN
	SELECT * FROM `auctions` AS a, `items` AS i
    WHERE a.is_complete = 0
    AND a.auction_item_id = i.item_id
    AND i.owner_user_id = user_id
    ORDER BY `end_time` ASC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_user_feed
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_user_feed` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_user_feed`(IN user_id INT(11))
BEGIN
	SELECT * FROM auctions as a
	LEFT JOIN items as i ON a.auction_item_id = i.item_id
	LEFT JOIN bids as b ON a.auction_id = b.bid_auction_id
	WHERE b.bidder_user_id = user_id AND a.is_complete = 0
    ORDER BY a.end_time ASC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE bids_auction_bids
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `bids_auction_bids` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `bids_auction_bids`(IN bid_auction_id INT(11))
BEGIN
	SELECT * FROM bids WHERE bids.bid_auction_id = bid_auction_id
    ORDER BY bids.bid_price DESC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE bids_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `bids_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `bids_create`( IN bidder_user_id INT(11), IN bid_price VARCHAR(12), IN bid_auction_id INT)
BEGIN
INSERT INTO `bids` (bids.bidder_user_id, bids.bid_price, bids.bid_time, bids.bid_auction_id)
    VALUES(bidder_user_id, CAST(bid_price AS DECIMAL(10,2)), NOW(), bid_auction_id);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE bids_self
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `bids_self` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `bids_self`(IN bid_id INT(11))
BEGIN
	SELECT * FROM auctions AS a
    LEFT JOIN items AS i ON a.auction_item_id = i.item_id
    LEFT JOIN bids as b ON a.auction_id = b.bid_auction_id
    WHERE b.bid_id = bid_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE bids_user_bids
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `bids_user_bids` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `bids_user_bids`(IN user_id INT(11))
BEGIN
	SELECT * FROM auctions AS a
    LEFT JOIN items AS i ON a.auction_item_id = i.item_id
    LEFT JOIN bids AS b ON a.auction_id = b.bid_auction_id
    WHERE user_id = b.bidder_user_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE feedback_for_action
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `feedback_for_action` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `feedback_for_action`(IN feedback_auction_id INT(11))
BEGIN
	SELECT * FROM feedback WHERE feedback.feedback_auction_id = feedback_auction_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE feedback_for_user
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `feedback_for_user` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `feedback_for_user`(IN user_id INT(11))
BEGIN
	SELECT * FROM feedback WHERE user_id = feedback.seller_id OR user_id = feedback.buyer_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE feedback_update
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `feedback_update` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `feedback_update`(IN feedback_text VARCHAR(140), IN user_id INT(11), IN feedback_id INT(11))
BEGIN
	set @v1 = (select seller_id from feedback where feedback.feedback_id = feedback_id);
	IF @v1 = user_id THEN
	UPDATE feedback SET feedback.seller_text = feedback_text where feedback.feedback_id = feedback_id;
	ELSE
	UPDATE feedback SET feedback.buyer_text = feedback_text where feedback.feedback_id = feedback_id;
    END IF;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE get_auctions_feed
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `get_auctions_feed` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `get_auctions_feed`()
BEGIN
SELECT * FROM `auctions` AS a, `items` AS i WHERE a.is_complete = 0 AND a.auction_item_id = i.item_id ORDER BY `end_time` ASC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE hashtagories_self
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `hashtagories_self` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `hashtagories_self`(IN hashtext VARCHAR(20))
BEGIN
	INSERT IGNORE INTO `hashtagories` values(hashtext);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_create`(IN owner_user_id int(11), IN title varchar(50), IN description varchar(200))
BEGIN
	INSERT INTO `items` (`owner_user_id`, `title`, `description`)
    VALUES(owner_user_id, title, description);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_delete
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_delete` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_delete`(IN item_id INT(11))
BEGIN
	DELETE FROM `items` where items.item_id = item_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_self
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_self` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_self`(in item_id int(11))
BEGIN
	SELECT `item_id`, `owner_user_id`, `title`, `description`, GROUP_CONCAT(`hashtagory_text` ORDER BY `hashtagory_text` SEPARATOR ',') AS 'hashtagory_text'
    FROM `items`, `item_hashtagories`
    WHERE items.item_id = item_id AND item_hashtagories.tagged_item_id = item_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_update
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_update` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_update`(IN item_id int(11), IN title varchar(50), IN description varchar(200))
BEGIN
	UPDATE `items`
    SET items.title = title, items.description = description
    WHERE items.item_id = item_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_user_items
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_user_items` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_user_items`(IN owner_user_id INT(11))
BEGIN
SELECT `item_id`, `owner_user_id`, `title`, `description`, GROUP_CONCAT(`hashtagory_text` ORDER BY `hashtagory_text` SEPARATOR ',') AS 'hashtagory_text'
    FROM `items` I LEFT OUTER JOIN `item_hashtagories` IH
    ON I.item_id = IH.tagged_item_id
    AND I.owner_user_id = owner_user_id
    GROUP BY I.owner_user_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_change_password
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_change_password` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_change_password`(IN username varchar(10), IN new_password varchar(20))
BEGIN
UPDATE `users` SET `password`= new_password WHERE `username` = username;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_create`(
IN username varchar(10),
IN first_name varchar(20),
IN last_name varchar(20),
IN email varchar(50),
IN pass varchar(20)
)
BEGIN
 INSERT INTO `user` (`username`, `first_name`, `last_name`, `email`, `password`)
 values (username, first_name, last_name, email, pass);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_self
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_self` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_self`(IN user_id int(11))
BEGIN
 SELECT users.username, users.user_id, users.first_name, users.last_name, users.email FROM `users` WHERE `user_id` = user_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_update
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_update` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_update`(
IN user_id int,
IN username varchar(10),
IN first_name varchar(20),
IN last_name varchar(30),
IN email varchar(50)
)
BEGIN
    IF user_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No user provided';
    END IF;
    IF username IS NOT NULL THEN
        UPDATE `users` SET users.username = username
        WHERE users.user_id = user_id;
    END IF;
    IF first_name IS NOT NULL THEN
        UPDATE `users` SET users.first_name = first_name
        WHERE users.user_id = user_id;
    END IF;
    IF last_name IS NOT NULL THEN
        UPDATE `users` SET users.last_name = last_name
        WHERE users.user_id = user_id;
    END IF;
    IF email IS NOT NULL THEN
        UPDATE `users` SET users.email = email
        WHERE users.user_id = user_id;
    END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE watches_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `watches_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `watches_create`(IN watch_user_id INT(11), IN watch_auction_id INT(11))
BEGIN
	INSERT IGNORE INTO watches VALUES(watch_user_id, watch_auction_id);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE watches_delete
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `watches_delete` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `watches_delete`(IN watch_user_id INT(11), IN watch_auction_id INT(11))
BEGIN
	DELETE FROM watches
    WHERE watches.watch_user_id = watch_user_id
    AND watches.watch_auction_id = watch_auction_id; 
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE watches_user_watches
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `watches_user_watches` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `watches_user_watches`(IN user_id INT(11))
BEGIN
	SELECT * FROM auctions AS a
    LEFT JOIN items AS i ON a.auction_item_id = i.item_id
    LEFT JOIN watchs AS w ON a.auction_id = w.watch_auction_id
    WHERE w.watch_user_id = user_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
