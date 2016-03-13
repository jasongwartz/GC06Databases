
feedback_for_auction
# ------------------------------------------------------------



PROCEDURE `feedback_for_auction`(IN feedback_auction_id INT(11))
BEGIN
	SELECT * FROM feedback WHERE feedback.feedback_auction_id = feedback_auction_id;
END */;;


feedback_for_user
# ------------------------------------------------------------



PROCEDURE `feedback_for_user`(IN user_id INT(11))
BEGIN
	SELECT * FROM feedback WHERE user_id = feedback.seller_id OR user_id = feedback.buyer_id;
END */;;


feedback_update
# ------------------------------------------------------------



PROCEDURE `feedback_update`(IN feedback_text VARCHAR(140), IN feedback_rating DECIMAL(5,2), IN user_id INT(11), IN feedback_auction_id INT(11))
BEGIN
	set @v1 = (select seller_id from feedback where feedback.feedback_auction_id = feedback_auction_id);
	IF @v1 = user_id THEN
		UPDATE feedback SET feedback.seller_text = feedback_text, seller_rating = feedback_rating where feedback.feedback_auction_id = feedback_auction_id;
	ELSE
		UPDATE feedback SET feedback.buyer_text = feedback_text, buyer_rating = feedback_rating where feedback.feedback_auction_id = feedback_auction_id;
    END IF;
END */;;


hashtagories_all
# ------------------------------------------------------------



PROCEDURE `hashtagories_all`()
BEGIN
SELECT text FROM hashtagories;
END */;;


hashtagories_search
# ------------------------------------------------------------



PROCEDURE `hashtagories_search`(IN str varchar(20))
BEGIN
SELECT text FROM hashtagories
WHERE INSTR(text, str);
END */;;


hashtagories_self
# ------------------------------------------------------------



PROCEDURE `hashtagories_self`(IN hashtext VARCHAR(20))
BEGIN
	INSERT IGNORE INTO `hashtagories` values(hashtext);
END */;;


hashtagories_tag_item
# ------------------------------------------------------------



PROCEDURE `hashtagories_tag_item`(IN item_id INT(11), IN hashtag varchar(20))
BEGIN
    INSERT INTO hashtagories VALUES (hashtag);
INSERT IGNORE INTO item_hashtagories (tagged_item_id, hashtagory_text) VALUES(item_id, hashtag);
END */;;


hashtagories_trending
# ------------------------------------------------------------



PROCEDURE `hashtagories_trending`()
BEGIN
SELECT ih.hashtagory_text, COUNT(*) as count
FROM items i, item_hashtagories ih, auctions a
WHERE i.item_id = ih.tagged_item_id AND a.`auction_item_id` = i.`item_id` AND a.`is_complete` = 0
GROUP BY ih.hashtagory_text ORDER BY count DESC
LIMIT 10;
END */;;


items_create
# ------------------------------------------------------------



PROCEDURE `items_create`(IN owner_user_id int(11), IN title varchar(50), IN description varchar(200))
BEGIN
	INSERT INTO `items` (`owner_user_id`, `title`, `description`)
    VALUES(owner_user_id, title, description);
    SELECT last_insert_id();
END */;;


items_delete
# ------------------------------------------------------------



PROCEDURE `items_delete`(IN item_id INT(11))
BEGIN
	DELETE FROM `items` where items.item_id = item_id;
END */;;


items_self
# ------------------------------------------------------------



PROCEDURE `items_self`(in item_id int(11))
BEGIN
	SELECT `item_id`, `owner_user_id`, `title`, `description`, GROUP_CONCAT(`hashtagory_text` ORDER BY `hashtagory_text` SEPARATOR ',') AS 'hashtagory_text'
    FROM `items`, `item_hashtagories`
    WHERE items.item_id = item_id AND item_hashtagories.tagged_item_id = item_id;
END */;;


items_update
# ------------------------------------------------------------



PROCEDURE `items_update`(IN item_id int(11), IN title varchar(50), IN description varchar(200))
BEGIN
	UPDATE `items`
    SET items.title = title, items.description = description
    WHERE items.item_id = item_id;
END */;;


items_user_items
# ------------------------------------------------------------



PROCEDURE `items_user_items`(IN owner_user_id INT(11))
BEGIN
SELECT `item_id`, `owner_user_id`, `title`, `description`, GROUP_CONCAT(`hashtagory_text` ORDER BY `hashtagory_text` SEPARATOR ',') AS 'hashtagory_text'
    FROM `items` as I LEFT OUTER JOIN `item_hashtagories` as  IH
    ON I.item_id = IH.tagged_item_id
    WHERE I.owner_user_id = owner_user_id
    GROUP BY I.item_id;
END */;;


users_authenticate
# ------------------------------------------------------------



PROCEDURE `users_authenticate`(IN username varchar(20), IN password varchar(20))
BEGIN
	select user_id from users where BINARY users.username = username AND BINARY users.password = password;
END */;;


users_change_password
# ------------------------------------------------------------



PROCEDURE `users_change_password`(IN userid int(11), IN old_password varchar(20), IN new_password varchar(20))
BEGIN
set @v1 = (select users.user_id from `users` where BINARY users.password = old_password AND users.user_id = userid);
IF @v1 = userid THEN
	UPDATE `users` SET `password`= new_password WHERE `user_id` = userid;
ELSE
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'INCORRECT USER NAME AND/OR PASSWORD';
END IF;
END */;;


users_create
# ------------------------------------------------------------



PROCEDURE `users_create`(
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


users_search
# ------------------------------------------------------------



PROCEDURE `users_search`(in unstring varchar(20))
BEGIN
	SELECT username FROM users
WHERE INSTR(username, unstring);
END */;;


users_self
# ------------------------------------------------------------



PROCEDURE `users_self`(IN user_id int(11))
BEGIN
 SELECT users.username, users.user_id, users.first_name, users.last_name, users.email FROM `users` WHERE users.user_id = user_id;
END */;;


users_update
# ------------------------------------------------------------



PROCEDURE `users_update`(
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


users_username
# ------------------------------------------------------------



PROCEDURE `users_username`(IN id INT(11))
BEGIN
	SELECT username FROM users
    WHERE user_id LIKE id;
END */;;


watches_create
# ------------------------------------------------------------



PROCEDURE `watches_create`(IN watch_user_id INT(11), IN watch_auction_id INT(11))
BEGIN
	INSERT IGNORE INTO watches VALUES(watch_user_id, watch_auction_id);
    SELECT last_insert_id();
END */;;


watches_delete
# ------------------------------------------------------------



PROCEDURE `watches_delete`(IN watch_user_id INT(11), IN watch_auction_id INT(11))
BEGIN
	DELETE FROM watches
    WHERE watches.watch_user_id = watch_user_id
    AND watches.watch_auction_id = watch_auction_id; 
END */;;


watches_user_watches
# ------------------------------------------------------------



PROCEDURE `watches_user_watches`(IN user_id INT(11))
BEGIN
	SELECT * FROM auctions AS a
    LEFT JOIN items AS i ON a.auction_item_id = i.item_id
    LEFT JOIN watches AS w ON a.auction_id = w.watch_auction_id
    WHERE w.watch_user_id = user_id;
END */;;


DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
