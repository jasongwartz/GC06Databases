# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: auctions.cjfabur5dk4o.us-east-1.rds.amazonaws.com (MySQL 5.6.23-log)
# Database: auction_data
# Generation Time: 2016-02-26 11:14:31 pm +0000
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
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `reserve_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`auction_id`),
  KEY `auction_item_id` (`auction_item_id`),
  CONSTRAINT `auctions_ibfk_1` FOREIGN KEY (`auction_item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;

INSERT INTO `auctions` (`auction_id`, `auction_item_id`, `is_complete`, `start_time`, `end_time`, `reserve_price`)
VALUES
	(2,102,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',200.00),
	(3,107,0,'2016-02-26 15:34:08','2016-02-29 06:02:00',20000.00);

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
  PRIMARY KEY (`bid_id`),
  KEY `bidder_user_id` (`bidder_user_id`),
  KEY `bid_auction_id` (`bid_auction_id`),
  CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`bidder_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`bid_auction_id`) REFERENCES `auctions` (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
  PRIMARY KEY (`feedback_id`),
  KEY `seller_id` (`seller_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `feedback_auction_id` (`feedback_auction_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`feedback_auction_id`) REFERENCES `auctions` (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
	(''),
	('bananas'),
	('new_tag'),
	('sample'),
	('test_tag'),
	('vegan');

/*!40000 ALTER TABLE `hashtagories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table item_hashtagories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_hashtagories`;

CREATE TABLE `item_hashtagories` (
  `tagged_item_id` int(11) NOT NULL,
  `hashtagory_text` varchar(20) NOT NULL,
  PRIMARY KEY (`tagged_item_id`,`hashtagory_text`),
  KEY `hashtagory_text` (`hashtagory_text`),
  CONSTRAINT `item_hashtagories_ibfk_1` FOREIGN KEY (`tagged_item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `item_hashtagories_ibfk_2` FOREIGN KEY (`hashtagory_text`) REFERENCES `hashtagories` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `item_hashtagories` WRITE;
/*!40000 ALTER TABLE `item_hashtagories` DISABLE KEYS */;

INSERT INTO `item_hashtagories` (`tagged_item_id`, `hashtagory_text`)
VALUES
	(102,'bananas'),
	(104,'bananas'),
	(103,'new_tag'),
	(102,'sample'),
	(104,'sample'),
	(102,'vegan'),
	(104,'vegan');

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
  PRIMARY KEY (`item_id`),
  KEY `owner_user_id` (`owner_user_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`item_id`, `owner_user_id`, `title`, `description`)
VALUES
	(102,9,'a new name','I am so good at making up descriptions'),
	(103,37,'arcu. Vestibulum ut','vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,'),
	(104,9,'more stuff','and more descriptions'),
	(107,1,'Stuff','things and such'),
	(108,1,'A cunch of bunts','sdafsd #yolo'),
	(110,1,'dsafdsfadsfdas','adslkfnlasdfds');

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
	('quam.bob',1,'George','Mccarthy','asdflkjfdsa','hocus'),
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
  PRIMARY KEY (`watch_user_id`,`watch_auction_id`),
  KEY `watch_auction_id` (`watch_auction_id`),
  CONSTRAINT `watches_ibfk_1` FOREIGN KEY (`watch_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `watches_ibfk_2` FOREIGN KEY (`watch_auction_id`) REFERENCES `auctions` (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




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
SELECT last_insert_id();
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
SELECT items.*, users.username, auctions.* FROM `auctions`
    LEFT JOIN `items` ON auctions.auction_item_id = items.item_id
    LEFT JOIN `users` ON items.owner_user_id = users.user_id
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
SELECT last_insert_id();
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
# Dump of PROCEDURE hashtagories_all
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `hashtagories_all` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `hashtagories_all`()
BEGIN
SELECT text FROM hashtagories;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE hashtagories_search
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `hashtagories_search` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `hashtagories_search`(IN str varchar(20))
BEGIN
SELECT text FROM hashtagories
WHERE text LIKE str;
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
# Dump of PROCEDURE hashtagories_tag_item
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `hashtagories_tag_item` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `hashtagories_tag_item`(IN item_id INT(11), IN hashtag varchar(20))
BEGIN
    INSERT INTO hashtagories VALUES (hashtag);
INSERT IGNORE INTO item_hashtagories (tagged_item_id, hashtagory_text) VALUES(item_id, hashtag);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE hashtagories_trending
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `hashtagories_trending` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `hashtagories_trending`()
BEGIN
SELECT ih.hashtagory_text, COUNT(*) as count
FROM items i, item_hashtagories ih, auctions a
WHERE i.item_id = ih.tagged_item_id AND a.`auction_item_id` = i.`item_id` AND a.`is_complete` = 0
GROUP BY ih.hashtagory_text ORDER BY count DESC
LIMIT 10;
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
    SELECT last_insert_id();
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
    FROM `items` as I LEFT OUTER JOIN `item_hashtagories` as  IH
    ON I.item_id = IH.tagged_item_id
    WHERE I.owner_user_id = owner_user_id
    GROUP BY I.item_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_authenticate
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_authenticate` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_authenticate`(IN username varchar(20), IN password varchar(20))
BEGIN
	select user_id from users where users.username = username AND users.password = password;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_change_password
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_change_password` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_change_password`(IN userid int(11), IN old_password varchar(20), IN new_password varchar(20))
BEGIN
set @v1 = (select users.user_id from `users` where users.password = old_password AND users.user_id = userid);
IF @v1 = userid THEN
	UPDATE `users` SET `password`= new_password WHERE `user_id` = userid;
ELSE
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'INCORRECT USER NAME AND/OR PASSWORD';
END IF;
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
 INSERT INTO `users` (`username`, `first_name`, `last_name`, `email`, `password`)
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
    SELECT last_insert_id();
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
    LEFT JOIN watches AS w ON a.auction_id = w.watch_auction_id
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
