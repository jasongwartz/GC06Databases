# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: db.jasongwartz.com (MySQL 5.6.27-log)
# Database: auction1
# Generation Time: 2016-03-17 12:56:20 am +0000
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
  `views` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  PRIMARY KEY (`auction_id`),
  KEY `auction_item_id` (`auction_item_id`),
  CONSTRAINT `auction_item` FOREIGN KEY (`auction_item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;

INSERT INTO `auctions` (`auction_id`, `auction_item_id`, `is_complete`, `start_time`, `end_time`, `reserve_price`, `views`)
VALUES
	(2,102,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',200.00,00000000004),
	(3,107,1,'2016-02-26 15:34:08','2016-02-29 06:02:00',20000.00,00000000000),
	(4,111,0,'2016-03-02 17:13:55','2016-04-04 19:20:00',3039.00,00000000013),
	(5,104,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',0.00,00000000000),
	(6,103,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',0.00,00000000017),
	(7,112,1,'2016-03-07 20:55:31','2016-03-09 23:30:00',2000.00,00000000022),
	(8,113,1,'2016-03-07 23:04:44','2016-03-08 21:00:00',550.00,00000000003),
	(9,131,0,'2016-03-09 16:14:02','2016-03-20 09:00:00',20.00,00000000029),
	(10,132,0,'2016-03-09 16:17:24','2016-03-20 23:01:00',21.00,00000000007),
	(11,133,0,'2016-03-09 17:20:57','2016-03-20 09:02:00',1.00,00000000022),
	(12,134,1,'2016-03-11 11:50:38','2016-03-12 04:05:00',60.00,00000000007),
	(13,136,1,'2016-03-11 17:15:52','2016-03-12 03:34:00',99999999.99,00000000001),
	(14,138,1,'2016-03-11 18:18:05','2016-03-12 02:21:00',29.00,00000000016),
	(15,107,1,'2016-03-14 13:38:37','2016-03-15 23:30:00',200.00,00000000007),
	(20,139,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',3240.00,00000000000),
	(21,140,0,'2016-03-14 19:15:27','2016-03-21 09:00:00',100.00,00000000007),
	(25,141,0,'2016-03-02 17:13:55','2016-03-22 17:13:55',54720.00,00000000001),
	(26,142,0,'2016-03-16 15:32:22','2016-03-17 20:20:00',22.00,00000000001),
	(28,143,0,'2016-03-16 18:40:37','2016-03-22 17:13:55',100.00,00000000007);

/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auctions_retrieve_all
# ------------------------------------------------------------

DROP VIEW IF EXISTS `auctions_retrieve_all`;

CREATE TABLE `auctions_retrieve_all` (
   `auction_id` INT(11) NOT NULL DEFAULT '0',
   `auction_item_id` INT(11) NOT NULL,
   `is_complete` TINYINT(1) NOT NULL DEFAULT '0',
   `start_time` TIMESTAMP NOT NULL,
   `end_time` TIMESTAMP NOT NULL,
   `reserve_price` DECIMAL(10) NOT NULL,
   `views` INT(11) UNSIGNED ZEROFILL NOT NULL DEFAULT '00000000000',
   `current_bid` DECIMAL(10) NULL DEFAULT NULL,
   `item_id` INT(11) NULL DEFAULT '0',
   `owner_user_id` INT(11) NULL DEFAULT NULL,
   `title` VARCHAR(50) NULL DEFAULT '',
   `description` VARCHAR(200) NULL DEFAULT '',
   `image_ref` VARCHAR(255) NULL DEFAULT NULL,
   `sold` INT(1) NULL DEFAULT '0',
   `username` VARCHAR(10) NULL DEFAULT NULL
) ENGINE=MyISAM;



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
  CONSTRAINT `bid_auction` FOREIGN KEY (`bid_auction_id`) REFERENCES `auctions` (`auction_id`),
  CONSTRAINT `bidder` FOREIGN KEY (`bidder_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;

INSERT INTO `bids` (`bid_id`, `bidder_user_id`, `bid_price`, `bid_time`, `bid_auction_id`)
VALUES
	(1,102,9000.00,'2016-03-08 12:49:10',8),
	(2,1,200.23,'2016-03-08 18:34:28',4),
	(3,104,29292.00,'2016-03-09 16:11:39',7),
	(4,1,400.40,'2016-03-09 16:21:26',4),
	(5,1,405.40,'2016-03-09 16:22:33',4),
	(6,1,1.99,'2016-03-09 17:22:08',11),
	(7,104,2.00,'2016-03-09 17:31:56',4),
	(8,1,200000.32,'2016-03-09 18:28:46',7),
	(9,104,900000.00,'2016-03-10 15:24:30',7),
	(10,1,6000.00,'2016-03-11 11:20:20',6),
	(11,2,7000.00,'2016-03-11 11:26:27',6),
	(12,104,4314341.00,'2016-03-11 17:13:10',4),
	(13,105,40.00,'2016-03-11 18:17:36',10),
	(14,105,50.00,'2016-03-11 18:18:33',10),
	(15,1,12300.00,'2016-03-11 18:42:50',14),
	(16,105,1.00,'2016-03-11 19:07:00',13),
	(17,105,12500.00,'2016-03-11 19:11:09',14),
	(18,105,1.00,'2016-03-11 19:11:24',12),
	(19,105,2.00,'2016-03-11 19:27:35',12),
	(20,105,8.00,'2016-03-11 19:30:16',12),
	(22,105,2.00,'2016-03-11 20:03:04',9),
	(23,1,50.01,'2016-03-11 21:44:06',10),
	(24,105,5.00,'2016-03-13 22:18:19',11),
	(25,105,3.00,'2016-03-13 22:18:51',9),
	(26,104,2.00,'2016-03-14 15:57:30',15),
	(27,109,0.10,'2016-03-16 15:31:45',25),
	(28,104,4.00,'2016-03-16 21:58:23',28),
	(29,108,5.00,'2016-03-16 21:59:08',28),
	(30,108,6.00,'2016-03-16 22:20:07',28);

/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `seller_id` int(11) NOT NULL,
  `seller_text` varchar(140) DEFAULT NULL,
  `seller_rating` decimal(5,2) DEFAULT NULL,
  `feedback_auction_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `buyer_text` varchar(140) DEFAULT NULL,
  `buyer_rating` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`feedback_auction_id`),
  KEY `seller_id` (`seller_id`),
  KEY `buyer_id` (`buyer_id`),
  CONSTRAINT `buyer` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_auction` FOREIGN KEY (`feedback_auction_id`) REFERENCES `auctions` (`auction_id`),
  CONSTRAINT `seller` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;

INSERT INTO `feedback` (`seller_id`, `seller_text`, `seller_rating`, `feedback_auction_id`, `buyer_id`, `buyer_text`, `buyer_rating`)
VALUES
	(2,'asdasd',50.00,2,1,'asdasdsad',50.00),
	(37,NULL,NULL,6,1,'This guy was a 10/10 amateur!!!!!',5.00),
	(1,'The punk didn\'t even leave me a number rating!!',14.00,7,104,'What a doof',0.00),
	(1,'This is some pretty good feedback bro.',69.00,8,102,NULL,NULL),
	(104,NULL,NULL,14,105,NULL,NULL);

/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hashtagories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hashtagories`;

CREATE TABLE `hashtagories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `hashtagories` WRITE;
/*!40000 ALTER TABLE `hashtagories` DISABLE KEYS */;

INSERT INTO `hashtagories` (`id`, `text`)
VALUES
	(2,''),
	(3,'0'),
	(4,'alternativetransport'),
	(1,'banana'),
	(5,'bananas'),
	(6,'brogrammer'),
	(7,'camel'),
	(8,'figurine'),
	(9,'garage'),
	(10,'garagesale'),
	(11,'harrypotter'),
	(12,'hello'),
	(13,'heman'),
	(14,'hipster'),
	(15,'hipstertable'),
	(16,'isatest'),
	(17,'isthisworking'),
	(18,'itsalwayssunny'),
	(19,'karate'),
	(20,'maths'),
	(21,'movingday'),
	(22,'ninja'),
	(23,'rootsandculture'),
	(24,'savethewhales'),
	(25,'spoon'),
	(26,'startupbro'),
	(27,'table'),
	(28,'test'),
	(29,'test2'),
	(30,'test3'),
	(31,'test5'),
	(32,'test7'),
	(33,'test8'),
	(34,'test9'),
	(35,'universe'),
	(36,'vegan'),
	(37,'vehicle'),
	(38,'winnersalwayswin'),
	(39,'working'),
	(40,'yolo');

/*!40000 ALTER TABLE `hashtagories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table item_hashtagories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_hashtagories`;

CREATE TABLE `item_hashtagories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagged_item_id` int(11) NOT NULL,
  `hashtagory_text` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash_text_idx` (`hashtagory_text`),
  KEY `item_tag` (`tagged_item_id`),
  FULLTEXT KEY `hashtagory_text` (`hashtagory_text`),
  CONSTRAINT `hash_text` FOREIGN KEY (`hashtagory_text`) REFERENCES `hashtagories` (`text`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `item_tag` FOREIGN KEY (`tagged_item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `item_hashtagories` WRITE;
/*!40000 ALTER TABLE `item_hashtagories` DISABLE KEYS */;

INSERT INTO `item_hashtagories` (`id`, `tagged_item_id`, `hashtagory_text`)
VALUES
	(1,104,'banana'),
	(2,102,'vegan'),
	(3,102,'banana'),
	(5,112,'heman'),
	(6,112,'figurine'),
	(7,112,'universe'),
	(8,112,'winnersalwayswin'),
	(12,113,'camel'),
	(13,113,'vehicle'),
	(14,113,'alternativetransport'),
	(15,113,'savethewhales'),
	(16,132,'itsalwayssunny'),
	(17,132,'karate'),
	(18,133,'yolo'),
	(19,133,'ninja'),
	(20,133,'brogrammer'),
	(21,133,'startupbro'),
	(22,134,'maths'),
	(23,134,'harrypotter'),
	(24,134,'rootsandculture'),
	(25,138,'karate'),
	(26,138,'yolo'),
	(27,138,'harrypotter'),
	(28,139,'table'),
	(29,139,'hipster'),
	(30,139,'hipstertable'),
	(33,142,'yolo'),
	(34,142,'garage'),
	(35,142,'spoon'),
	(36,143,'hello'),
	(37,143,'isthisworking'),
	(44,144,'test8'),
	(45,144,'test9');

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
  `image_ref` varchar(255) DEFAULT NULL,
  `sold` int(1) DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `owner_user_id` (`owner_user_id`),
  CONSTRAINT `item_owner` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`item_id`, `owner_user_id`, `title`, `description`, `image_ref`, `sold`)
VALUES
	(102,9,'a new name','I am so good at making up descriptions',NULL,0),
	(103,37,'arcu. Vestibulum ut','vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,',NULL,2),
	(104,9,'more stuff','and more descriptions',NULL,0),
	(107,1,'Stuff','things and such','https://pbs.twimg.com/profile_images/609991041471660032/OUDxYbMf.jpg',0),
	(108,1,'A cunch of bunts','sdafsd #yolo',NULL,0),
	(111,102,'My stuff','is good',NULL,0),
	(112,1,'Mint condition He man figurine','He man figurine 10 years old #figurine #heman #universe #winnersalwayswin','http://www.mwctoys.com/images/review_motuc1_1.jpg',104),
	(113,1,'Camel','Really nice camel, well behaved and it almost never spits in your face. #camel #vehicle #alternativetransport #savethewhales','https://img.buzzfeed.com/buzzfeed-static/static/2013-10/enhanced/webdr02/25/12/enhanced-buzz-31258-1382717179-0.jpg?no-auto',102),
	(131,104,'Day Man','FIGHTER OF THE NIGHT MAN #itsonlysuny #friendship #german #winnersalwayswin','https://img.buzzfeed.com/buzzfeed-static/static/2013-10/enhanced/webdr01/14/20/enhanced-buzz-2646-1381796229-3.jpg',0),
	(132,104,'Night Man','FIGHTER OF THE DAY MAN #itsalwayssunny #winnersalwayswin #karate','http://fr.web.img1.acsta.net/newsv7/14/09/01/10/35/468291.jpg',0),
	(133,104,'TOBI','Best at UX and Slack #yolo #ninja #brogrammer #startupbro','https://pbs.twimg.com/profile_images/563707153853054976/xcb0FbvH.jpeg',0),
	(134,104,'Sophie','Super good at maths #maths #harrypotter #rootsandculture','https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/1/000/2ba/307/01fe0da.jpg',0),
	(135,104,'Zombie apocalypse survival kit','Good for surviving a zombie apocalypse','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUTExIVFRUVFhgVGBUVFxcXFRcVFRcXFxgVFxUYHiggGB0lHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGy8lICUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLf/AABEIAMYA/gMBEQACEQEDEQH/',0),
	(136,104,'zombie apocalypse survival kit','for surviving zombies #yolo #karate','http://www.phi-emsolutions.com/wp-content/uploads/2012/01/Zombie-v2.0.jpg',0),
	(137,105,'an item','stuff #yolo #karate','http://i.imgur.com/cFrSofo.jpg',0),
	(138,104,'stuff','for the cloud #karate #yolo #harrypotter','http://www.qvidian.com/sites/default/files/the-cloud-SaaS-computing.jpg',105),
	(139,1,'Table','A great hipster table, strong enough to support a crate of craft beer #table #hipster #hipstertable','http://diypalletfurniture.net/wp-content/uploads/2014/11/How-to-transform-a-pallet-into-a-hipster-table-for-the-living-room-12.jpg',0),
	(140,106,'THEBEST','EVAAARRRRRR #GREAT #woohoo','http://diypalletfurniture.net/wp-content/uploads/2014/11/How-to-transform-a-pallet-into-a-hipster-table-for-the-living-room-12.jpg',0),
	(141,106,'Dave Cameron','Who wants it? Anybody? I\'ll cut a deal? #garagesale #movingday','https://onmyfrontporch.files.wordpress.com/2014/08/david-cameron-012.jpg',0),
	(142,109,'Stuff','#yolo #garage #spoon','http://andreklein.net/wp-content/uploads/2013/05/ak.gif',0),
	(143,107,'BESTTITLE','#hello #isthisworking','http://brokenlink',0),
	(144,107,'TESTER2','#test8 #test9','http://asdfasdf',0);

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
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`username`, `user_id`, `first_name`, `last_name`, `email`, `password`)
VALUES
	('quam.bob',1,'George','Mccarthy','ed.mothershaw@btopenworld.com','f9af37dcc49573ca3a88a9a008f85e4d'),
	('Proin',2,'Judah','Zamora','jan.klug.15@ucl.ac.uk','f9af37dcc49573ca3a88a9a008f85e4d'),
	('asdf',3,'Laith','Harvey','nisi.magna.sed@Cumsociis.com','fdsa'),
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
	('edward',101,'ed','m','email@email.com',''),
	('dj',102,'dj','dj','dj.dj@dj.dj',''),
	('aj',103,'aj','aj','aj@aj.com',''),
	('oj',104,'oj','oj','jason.gwartz@gmail.com','d41d8cd98f00b204e9800998ecf8427e'),
	('cj',105,'cj','cj','cj@cj.com','d41d8cd98f00b204e9800998ecf8427e'),
	('jj',106,'JJ','JJJJ','jason.gwartz@gmail.com','d41d8cd98f00b204e9800998ecf8427e'),
	('pj',107,'PJ','PJPJ','jason.gwartz@gmail.com','d41d8cd98f00b204e9800998ecf8427e'),
	('tester1',108,'tester','one','jason.gwartz@gmail.com','d41d8cd98f00b204e9800998ecf8427e'),
	('aj',109,'aj','aj','ajaj@ajaj.com','d41d8cd98f00b204e9800998ecf8427e');

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
  CONSTRAINT `watch_auction` FOREIGN KEY (`watch_auction_id`) REFERENCES `auctions` (`auction_id`),
  CONSTRAINT `watch_user` FOREIGN KEY (`watch_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;

INSERT INTO `watches` (`watch_user_id`, `watch_auction_id`)
VALUES
	(104,7),
	(105,9),
	(105,10),
	(105,11),
	(105,12),
	(104,14),
	(105,14),
	(104,15),
	(106,21),
	(106,25),
	(109,25),
	(109,26),
	(104,28),
	(107,28),
	(108,28);

/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;




# Replace placeholder table for auctions_retrieve_all with correct view syntax
# ------------------------------------------------------------

DROP TABLE `auctions_retrieve_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`auctioneer`@`%` SQL SECURITY DEFINER VIEW `auctions_retrieve_all`
AS SELECT
   `a`.`auction_id` AS `auction_id`,
   `a`.`auction_item_id` AS `auction_item_id`,
   `a`.`is_complete` AS `is_complete`,
   `a`.`start_time` AS `start_time`,
   `a`.`end_time` AS `end_time`,
   `a`.`reserve_price` AS `reserve_price`,
   `a`.`views` AS `views`,max(`b`.`bid_price`) AS `current_bid`,
   `i`.`item_id` AS `item_id`,
   `i`.`owner_user_id` AS `owner_user_id`,
   `i`.`title` AS `title`,
   `i`.`description` AS `description`,
   `i`.`image_ref` AS `image_ref`,
   `i`.`sold` AS `sold`,
   `u`.`username` AS `username`
FROM (((`auctions` `a` left join `bids` `b` on((`a`.`auction_id` = `b`.`bid_auction_id`))) left join `items` `i` on((`i`.`item_id` = `a`.`auction_item_id`))) left join `users` `u` on((`u`.`user_id` = `i`.`owner_user_id`))) where (`a`.`is_complete` = 0) group by `a`.`auction_id` order by `a`.`end_time`;

--
-- Dumping routines (PROCEDURE) for database 'auction1'
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
# Dump of PROCEDURE auctions_close
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_close` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_close`(IN auction_id INT)
BEGIN
    UPDATE auctions
    SET is_complete=1
    WHERE auctions.auction_id=auction_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_create`(IN auction_item_id INT(11), IN start_time timestamp, IN end_time timestamp, IN reserve_price varchar(12))
BEGIN
INSERT INTO `auctions` (auctions.auction_item_id, auctions.start_time, auctions.end_time, auctions.reserve_price) VALUES(auction_item_id, start_time, end_time, CAST(reserve_price AS DECIMAL(10,2)));
INSERT INTO `watches` (watch_user_id, watch_auction_id)
VALUES((SELECT i.owner_user_id 
	FROM items i, auctions a
	WHERE a.auction_item_id = i.item_id
	AND a.auction_id = last_insert_id()), last_insert_id()); 
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_retrieve_all
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_retrieve_all` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_retrieve_all`()
BEGIN
	SELECT * FROM auctions_retrieve_all;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_search
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_search` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_search`(IN str varchar(100), IN sort varchar(10))
BEGIN
    SELECT *
    FROM item_hashtagories AS ih, auctions_retrieve_all AS a
	
    WHERE (str = '' OR MATCH(ih.hashtagory_text) AGAINST(str IN BOOLEAN MODE))
    	AND ih.tagged_item_id = a.item_id
    GROUP BY a.auction_id
    ORDER BY CASE sort
				when 'start_time' then a.start_time
				when 'end_time' then a.end_time
				when 'views' then a.views
                when 'title' then a.title
			END
        ;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_search_desc
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_search_desc` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_search_desc`(IN str varchar(100), IN sort varchar(10))
BEGIN
    SELECT DISTINCT *
    FROM item_hashtagories AS ih, auctions_retrieve_all AS a
	
    WHERE (str = '' OR MATCH(ih.hashtagory_text) AGAINST(str IN BOOLEAN MODE))
    	AND ih.tagged_item_id = a.item_id
    GROUP BY a.auction_id
    ORDER BY CASE sort
				when 'start_time' then a.start_time
				when 'end_time' then a.end_time
				when 'views' then a.views
                when 'title' then a.title
			END
            DESC
        ;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE auctions_self
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `auctions_self` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `auctions_self`(IN auction_id INT(11))
BEGIN
UPDATE auctions SET auctions.views = auctions.views+1 WHERE auctions.auction_id = auction_id;
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
	SELECT bids.*, u.username FROM bids, users as u WHERE bids.bid_auction_id = bid_auction_id 
	AND u.user_id = bids.bidder_user_id
    ORDER BY bids.bid_price DESC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE bids_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `bids_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `bids_create`( IN bidder_user_id INT(11), IN bid_price_in DECIMAL(10,2), IN bid_auction_id INT)
BEGIN
DECLARE highest_bid DECIMAL(10,2) DEFAULT 0;

SELECT bid_price FROM `bids` WHERE bids.bid_auction_id = bid_auction_id ORDER BY bid_price DESC LIMIT 1 INTO highest_bid;

SELECT bid_price_in, highest_bid;
IF bid_price_in > highest_bid THEN

	INSERT INTO `bids` (bids.bidder_user_id, bids.bid_price, bids.bid_time, bids.bid_auction_id)
		VALUES(bidder_user_id, CAST(bid_price_in AS DECIMAL(10,2)), NOW(), bid_auction_id);
	SELECT last_insert_id();
ELSE
	 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bid price too low!';

END IF;

CALL watches_create(bidder_user_id, bid_auction_id);

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
	SELECT a.*, b.*, i.*, u.username FROM users AS u, auctions AS a
    LEFT JOIN items AS i ON a.auction_item_id = i.item_id
    LEFT JOIN bids AS b ON a.auction_id = b.bid_auction_id
    WHERE user_id = b.bidder_user_id AND i.owner_user_id = u.user_id 
	ORDER BY b.bid_time DESC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE event_end_expired_auctions
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `event_end_expired_auctions` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `event_end_expired_auctions`()
BEGIN

DECLARE reserve_price_tmp INT DEFAULT 0;
DECLARE highest_bid_tmp decimal(10,2) DEFAULT 0;
DECLARE auction_id_tmp INT DEFAULT 0;

DECLARE item_title_tmp varchar(200) DEFAULT 0;
DECLARE item_id_tmp INT DEFAULT 0;

DECLARE seller_url_tmp varchar(200) DEFAULT 0;
DECLARE buyer_url_tmp varchar(200) DEFAULT 0;
DECLARE seller_username_tmp varchar(200) DEFAULT 0;
DECLARE buyer_username_tmp varchar(200) DEFAULT 0;
DECLARE seller_email_tmp varchar(200) DEFAULT 0;
DECLARE buyer_email_tmp varchar(200) DEFAULT 0;
DECLARE seller_id_tmp INT DEFAULT 0;
DECLARE buyer_id_tmp INT DEFAULT 0;

DECLARE successful_tmp INT DEFAULT 0;

DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;

	# Drops the temporary table if it exists. Then creates it.
	DROP TABLE IF EXISTS `tmp_end_expired_auctions`;
	CREATE TABLE `tmp_end_expired_auctions` (
	  `auction_id` int(11) NOT NULL,
	  `seller_username` varchar(200) DEFAULT NULL,
	  `seller_email` varchar(200) DEFAULT NULL,
	  `seller_feedback_url` varchar(50) DEFAULT NULL,
	  `buyer_username` varchar(200) DEFAULT NULL,
	  `buyer_email` varchar(200) DEFAULT NULL,
	  `buyer_feedback_url` varchar(50) DEFAULT NULL,
	  `item_title` varchar(200) DEFAULT NULL,
	  `final_bid_price` varchar(200) DEFAULT NULL,
	  `successful` varchar(200) DEFAULT NULL,
	  PRIMARY KEY (`auction_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=latin1;

	SELECT count(*) FROM `auctions` WHERE end_time < now() AND is_complete=0 INTO n;	

	# This loops through the unclosed auctions in the auctions table select values
	# from other tables. It evaluates whether an auction failed or was successful
	# every loop inserts a row to the tmp table.
	SET i=0;
	WHILE i<n DO 

		# Auction table selects. Gets the auction_id, reserver_price and item_id.
		SELECT auction_id, reserve_price, auction_item_id  FROM `auctions` 
		WHERE end_time < now() AND is_complete=0 ORDER BY auction_id LIMIT i, 1 
			INTO auction_id_tmp, reserve_price_tmp, item_id_tmp;

		# Bids table selects. Gets the highest_bid on an item, and the user_id
		# of that bid.
		SELECT bid_price, bidder_user_id FROM `bids`
		WHERE bid_auction_id = auction_id_tmp ORDER BY bid_price DESC LIMIT 1
			INTO highest_bid_tmp, buyer_id_tmp;

		# Items table selects. Gets the user_id of the seller and the items title.
		SELECT owner_user_id, title FROM `items` 
		WHERE item_id = item_id_tmp INTO seller_id_tmp, item_title_tmp;

		# Users table selects seller. Gets seller username and email.
		SELECT username, email FROM `users`
		WHERE user_id = seller_id_tmp INTO seller_username_tmp, seller_email_tmp;


		# If it was successful and there is a buyer user_id
		IF buyer_id_tmp > 0 THEN
			# Users table selects buyer. Gets buyer username and email. 
			SELECT username, email FROM `users`
			WHERE user_id = buyer_id_tmp INTO buyer_username_tmp, buyer_email_tmp;

		END IF;

		# If successful auction: create feedback, set successful to 1
		IF highest_bid_tmp >= reserve_price_tmp AND highest_bid_tmp > 0 THEN
			
			# Create feedback
			INSERT IGNORE INTO `feedback`
				(`seller_id`,
				`feedback_auction_id`,
				`buyer_id`)
				VALUES
				(seller_id_tmp,
				auction_id_tmp,
				buyer_id_tmp);

			# Sold field in items is set to the buyer id.
			UPDATE `items` SET sold = buyer_id_tmp WHERE item_id = item_id_tmp;
	
			# Sets successful.
			SET successful_tmp = 1;
			SET seller_url_tmp = CONCAT('#/feedback?', seller_id_tmp);
			SET buyer_url_tmp = CONCAT('#/feedback?', buyer_id_tmp);

		ELSE 

			SET successful_tmp = 0;

		END IF;

		# Inserts all the values into the tmp table.
		INSERT INTO `tmp_end_expired_auctions`
		(`auction_id`,
		`seller_username`,
		`seller_email`,
		`seller_feedback_url`,
		`buyer_username`,
		`buyer_email`,
		`buyer_feedback_url`,
		`item_title`,
		`final_bid_price`,
		`successful`)
		VALUES
		(auction_id_tmp,
		seller_username_tmp,
		seller_email_tmp,
		seller_url_tmp,
		buyer_username_tmp,
		buyer_email_tmp,
		buyer_url_tmp,
		item_title_tmp,
		highest_bid_tmp,
		successful_tmp);

		SET i = i + 1;
	END WHILE;

	# Gets row count of tmp table.
	SELECT count(*) FROM `tmp_end_expired_auctions` INTO n;

	# Loops through the tmp table finally updating the is_complete in auctions table
	# to 1.
	SET i=0;
	WHILE i<n DO 
	
		SELECT auction_id FROM `tmp_end_expired_auctions` LIMIT i,1 INTO auction_id_tmp;
		
		# Closes every expired auction
		UPDATE `auctions` SET is_complete = 1 WHERE auction_id = auction_id_tmp;
		
		SET i = i + 1;
	END WHILE;

	# Finally does an output select that is returned to the user.
	SELECT * FROM `tmp_end_expired_auctions`;

	# Drops the tmp table.
	DROP TABLE IF EXISTS `tmp_end_expired_auctions`;
	
End */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE event_reset_auctions
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `event_reset_auctions` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `event_reset_auctions`()
BEGIN

	UPDATE `auctions` SET is_complete = 0 WHERE auction_id > 0;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE event_retrieve_watches
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `event_retrieve_watches` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `event_retrieve_watches`()
BEGIN
SELECT b.bid_price, b.bidder_user_id, w.watch_user_id, u.username, IF (b.bidder_user_id != w.watch_user_id, u.email, NULL) as email, a.end_time, i.title, i.owner_user_id

FROM bids b, watches w, users u, auctions a, items i
WHERE b.bid_price = (SELECT max(bid_price) from bids where b.bid_auction_id = bid_auction_id)
AND w.watch_auction_id = b.bid_auction_id
AND w.watch_user_id = u.user_id
AND a.auction_id = w.watch_auction_id
AND a.auction_item_id = i.item_id
AND bid_time >= NOW() - INTERVAL 1 MINUTE
;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE feedback_for_auction
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `feedback_for_auction` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `feedback_for_auction`(IN feedback_auction_id INT(11))
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
	SELECT feedback.*,
		users.username as other_username
	FROM feedback,
		users
	WHERE (users.user_id = feedback.seller_id OR users.user_id = feedback.buyer_id) AND users.user_id != user_id
	AND (feedback.seller_id = user_id OR feedback.buyer_id = user_id); 

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE feedback_update
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `feedback_update` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `feedback_update`(IN feedback_text VARCHAR(140), IN feedback_rating DECIMAL(5,2), IN user_id INT(11), IN feedback_auction_id INT(11))
BEGIN
	IF feedback_rating <= 100 AND feedback_rating >= 0 THEN
		set @v1 = (select seller_id from feedback where feedback.feedback_auction_id = feedback_auction_id);
		
		IF @v1 = user_id THEN
			UPDATE feedback SET feedback.seller_text = feedback_text, seller_rating = feedback_rating where feedback.feedback_auction_id = feedback_auction_id;
		ELSE
			UPDATE feedback SET feedback.buyer_text = feedback_text, buyer_rating = feedback_rating where feedback.feedback_auction_id = feedback_auction_id;
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Feedback rating out of range!';
	END IF;
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
# Dump of PROCEDURE hashtagories_clear
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `hashtagories_clear` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `hashtagories_clear`(IN item_id INT(11))
BEGIN
DELETE FROM item_hashtagories WHERE tagged_item_id = item_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE hashtagories_search
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `hashtagories_search` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `hashtagories_search`(IN str varchar(20))
BEGIN
SELECT text FROM hashtagories
WHERE INSTR(text, str);
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
INSERT IGNORE INTO hashtagories VALUES (hashtag);
INSERT INTO item_hashtagories (tagged_item_id, hashtagory_text) VALUES(item_id, hashtag);
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
WHERE i.item_id = ih.tagged_item_id AND a.auction_item_id = i.item_id AND a.is_complete = 0
GROUP BY ih.hashtagory_text ORDER BY count DESC
LIMIT 10;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_create
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_create` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_create`(IN owner_user_id int(11), IN title varchar(50), IN description varchar(200), IN image_ref varchar(255))
BEGIN
	INSERT INTO `items` (`owner_user_id`, `title`, `description`, `image_ref`)
    VALUES(owner_user_id, title, description, image_ref);
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
	SELECT `item_id`, `owner_user_id`, `title`, `description`, `image_ref`, GROUP_CONCAT(`hashtagory_text` ORDER BY `hashtagory_text` SEPARATOR ',') AS 'hashtagory_text'
    FROM `items`, `item_hashtagories`
    WHERE items.item_id = item_id AND item_hashtagories.tagged_item_id = item_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_update
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_update` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_update`(IN item_id int(11), IN title varchar(50), IN description varchar(200), IN image_ref varchar(255))
BEGIN
	UPDATE `items`
    SET items.title = title, items.description = description, items.image_ref = image_ref
    WHERE items.item_id = item_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE items_user_items
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `items_user_items` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `items_user_items`(IN owner_user_id INT(11))
BEGIN
SELECT `sold`, `item_id`, `owner_user_id`, `title`, `description`, `image_ref`, GROUP_CONCAT(`hashtagory_text` ORDER BY `hashtagory_text` SEPARATOR ',') AS 'hashtagory_text'
    FROM `items` as I LEFT OUTER JOIN `item_hashtagories` as  IH
    ON I.item_id = IH.tagged_item_id
    WHERE I.owner_user_id = owner_user_id
    GROUP BY I.item_id ORDER BY I.item_id DESC;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE old_event_end_expired_auctions
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `old_event_end_expired_auctions` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `old_event_end_expired_auctions`()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;


	SELECT count(*) FROM `auctions` WHERE end_time < now() INTO n;	

SET i=0;
WHILE i<n DO 

	SELECT @auction_id := auction_id FROM `auctions` WHERE end_time < now() LIMIT i, 1;

	UPDATE `auctions` SET is_complete = 1 WHERE auction_id = @auction_id;

	SET i = i + 1;
END WHILE;


	SELECT count(*) FROM (SELECT *
	FROM `auctions` as a, (select * from `bids` order by bid_price desc) as b, `items` as i 
		where i.item_id = a.auction_item_id 
		AND a.auction_id = b.bid_auction_id
		AND a.end_time < curtime()
		#AND a.reserve_price < b.bid_price
		group by a.auction_id) as a INTO n;	

SET i=0;
WHILE i<n DO 

	SELECT 
		@reserve_price := reserve_price,
		@bid_price := bid_price,
		@seller_id := owner_user_id, 
		@buyer_id := bidder_user_id,
		@auction_id := auction_id 
	FROM (SELECT *
	FROM `auctions` as a, (select * from `bids` order by bid_price desc) as b, `items` as i 
		where i.item_id = a.auction_item_id 
		AND a.auction_id = b.bid_auction_id
		AND a.end_time < curtime()
		#AND a.reserve_price < b.bid_price
		group by a.auction_id) as made limit i, 1;

	IF @reserve_price < @bid_price THEN
		UPDATE `auctions` SET is_complete = 2 WHERE auction_id = @auction_id;
		INSERT IGNORE INTO `feedback` (`seller_id`, `feedback_auction_id`, `buyer_id`) 
			VALUES (@seller_id, @auction_id, @buyer_id);
	ELSE
		UPDATE `auctions` SET is_complete = 1 WHERE auction_id = @auction_id;
	END IF;



  SET i = i + 1;
END WHILE;
End */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_authenticate
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_authenticate` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_authenticate`(IN username varchar(20), IN password varchar(64))
BEGIN
	select user_id from users where BINARY users.username = username AND BINARY users.password = password;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_change_password
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_change_password` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_change_password`(IN userid int(11), IN old_password varchar(20), IN new_password varchar(64))
BEGIN
set @v1 = (select users.user_id from `users` where BINARY users.password = old_password AND users.user_id = userid);
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
IN pass varchar(64)
)
BEGIN
 INSERT INTO `users` (`username`, `first_name`, `last_name`, `email`, `password`)
 values (username, first_name, last_name, email, pass);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_rating
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_rating` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_rating`(IN user_id INT(11))
BEGIN

	select IFNULL((IFNULL(s.seller_rating,b.buyer_rating) + IFNULL(b.buyer_rating,s.seller_rating))/2, 0) as rating FROM 
	(select avg(buyer_rating) as seller_rating FROM `feedback` WHERE seller_id = user_id AND buyer_rating is not null) as s,
	(select avg(seller_rating) as buyer_rating FROM `feedback` WHERE buyer_id = user_id AND seller_rating is not null) as b;
	
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_search
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_search` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_search`(in unstring varchar(20))
BEGIN
	SELECT username FROM users
WHERE INSTR(username, unstring);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE users_self
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_self` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_self`(IN user_id int(11))
BEGIN
 SELECT users.username, users.user_id, users.first_name, users.last_name, users.email FROM `users` WHERE users.user_id = user_id;
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
# Dump of PROCEDURE users_username
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `users_username` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`auctioneer`@`%`*/ /*!50003 PROCEDURE `users_username`(IN id INT(11))
BEGIN
	SELECT username FROM users
    WHERE user_id LIKE id;
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
	SELECT u.username, a.*, i.*, w.* FROM users AS u, auctions AS a
    LEFT JOIN items AS i ON a.auction_item_id = i.item_id
    LEFT JOIN watches AS w ON a.auction_id = w.watch_auction_id
    WHERE w.watch_user_id = user_id AND u.user_id = i.owner_user_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
