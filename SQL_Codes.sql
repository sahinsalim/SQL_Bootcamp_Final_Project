--
-- CH1 CREATING TABLES --
--

CREATE TABLE Player (
    player_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    register_date DATE NOT NULL,
    last_login_date DATE ,
    total_play_time INT,
    total_score INT DEFAULT 0,
    friend_count INT DEFAULT 0
);


CREATE TABLE Level (
    level_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    difficulty VARCHAR(50) NOT NULL,
    score INT DEFAULT 0,
);


CREATE TABLE Item (
    item_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    class VARCHAR(50),
    strength INT DEFAULT 0,
    intelligence INT DEFAULT 0,
    agility INT DEFAULT 0,
    critical INT DEFAULT 0,
    defense INT DEFAULT 0,
);



CREATE TABLE Friend (
    friend_id INT PRIMARY KEY IDENTITY(1,1),
    player_id INT NOT NULL,
    friend_player_id INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Player(player_id),
    FOREIGN KEY (friend_player_id) REFERENCES Player(player_id)
);



CREATE TABLE Character (
    character_id INT PRIMARY KEY IDENTITY(1,1),
    player_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    level_id INT NOT NULL,
    class VARCHAR(50) ,
    health INT DEFAULT 0,
    mana INT DEFAULT 0,
    strength INT DEFAULT 0,
    intelligence INT DEFAULT 0,
    agility INT DEFAULT 0,
    critical INT DEFAULT 0,
    defense INT DEFAULT 0,
    item_count INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES Player(player_id),
    FOREIGN KEY (level_id) REFERENCES Level(level_id)
);



CREATE TABLE Character_Item (
    character_item_id INT PRIMARY KEY IDENTITY(1,1),
    character_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT DEFAULT 0,
    FOREIGN KEY (character_id) REFERENCES Character(character_id),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

--
-- CH2 CREATING TRIGGERS --
--

 CREATE TRIGGER AddFriend
 ON Friend
 AFTER INSERT
 AS
 BEGIN
     UPDATE Player
     SET friend_count = friend_count + 1
     WHERE player_id IN (SELECT friend_player_id FROM inserted);
 END;


CREATE TRIGGER DeleteFriend
ON Friend
AFTER DELETE
AS
BEGIN
    UPDATE Player
    SET friend_count = friend_count - 1
    WHERE player_id IN (SELECT friend_player_id FROM deleted);
END;


 CREATE TRIGGER AddItem
 ON Character_Item
 AFTER INSERT
 AS
 BEGIN
     UPDATE Character
     SET item_count = item_count + 1
     WHERE character_id IN (SELECT character_id FROM inserted);
 END;


CREATE TRIGGER DeleteItem
ON Character_Item
AFTER DELETE
AS
BEGIN
    UPDATE Character
    SET item_count = item_count - 1
    WHERE character_id IN (SELECT character_id FROM deleted);
END;


CREATE TRIGGER AddScore
ON Character
AFTER INSERT
AS
BEGIN
    UPDATE Player
    SET total_score = total_score + (SELECT L.score FROM inserted I JOIN Level L ON I.level_id = L.level_id)
    WHERE player_id IN (SELECT player_id FROM inserted);
END;


CREATE TRIGGER DeleteScore
ON Character
AFTER DELETE
AS
BEGIN
    UPDATE Player
    SET total_score = total_score - (SELECT L.score FROM deleted D JOIN Level L ON D.level_id = L.level_id)
    WHERE player_id IN (SELECT player_id FROM deleted);
END;

--
-- CH3 RANDOM DATA INPUTS --
--

 DECLARE @name VARCHAR(50);
 DECLARE @class VARCHAR(50);
 DECLARE @strength INT;
 DECLARE @intelligence INT;
 DECLARE @agility INT;
 DECLARE @critical INT;
 DECLARE @defense INT;
 DECLARE @i INT = 1;
  
 WHILE @i <= 50000
 BEGIN
     SET @name = 'Item ' + CAST(@i AS VARCHAR);
     SET @class = CASE @i % 3
         WHEN 0 THEN 'warrior'
         WHEN 1 THEN 'mage'
         WHEN 2 THEN 'rogue'
     END;
     SET @strength = ROUND(RAND() * 10, 0);
     SET @intelligence = ROUND(RAND() *10, 0);
     SET @agility = ROUND(RAND() * 10, 0);
     SET @critical = ROUND(RAND() * 10, 0);
     SET @defense = ROUND(RAND() * 10, 0);
 
     INSERT INTO Item (name, class, strength, intelligence,agility,critical,defense)
     VALUES (@name, @class, @strength,@intelligence,@agility,@critical,@defense);
     SET @i = @i + 1;
 END




DECLARE @name VARCHAR(50);
DECLARE @difficulty VARCHAR(50);
DECLARE @score INT;
DECLARE @i INT = 1;
WHILE @i <= 9999
BEGIN
    SET @name = 'Level ' + CAST(@i AS VARCHAR);
    SET @difficulty = 
	CASE
		WHEN @i<= 2500 THEN 'easy'
		WHEN @i<=6750 THEN 'normal'
		WHEN @i>6750 THEN 'hard'
	END;
    SET @score = @i*5;

    INSERT INTO Level (name, difficulty, score)
    VALUES ( @name, @difficulty, @score);

    SET @i = @i + 1;
END





DECLARE @username VARCHAR(50);
DECLARE @email VARCHAR(50);
DECLARE @password VARCHAR(50);
DECLARE @register_date DATE;
DECLARE @last_login_date DATE;
DECLARE @total_play_time INT;

DECLARE @i INT = 1;

WHILE @i <= 50000
BEGIN
    SET @username = 'user' + CAST(@i AS VARCHAR); ;
    SET @email = @username + '@gmail.com';
    SET @password = 'password' + CAST(ROUND(RAND() * 1000, 0) AS VARCHAR);
    SET @register_date = DATEADD(DAY, ROUND(RAND() * 365, 0), '2024-01-01'); 
    SET @last_login_date = DATEADD(DAY, ROUND(RAND() * 365, 0), @register_date); 
    SET @total_play_time = ROUND(RAND() * 2000, 0);
    INSERT INTO Player (username, email, password, register_date, last_login_date, total_play_time)
    VALUES (@username, @email, @password, @register_date, @last_login_date, @total_play_time);

    SET @i = @i + 1;
END






DECLARE @player_id INT;
DECLARE @friend_player_id INT;


DECLARE @i INT = 1;

WHILE @i <= 50000
BEGIN
    SET @player_id = ROUND(RAND() * 24999 + 1, 0);
    SET @friend_player_id = ROUND(RAND() * 24999 + 1, 0);

    INSERT INTO Friend (player_id,friend_player_id)
    VALUES (@player_id,  @friend_player_id);

    SET @i = @i + 1;
END









DECLARE @player_id INT;
DECLARE @name VARCHAR(50);
DECLARE @level_id INT ;
DECLARE @class VARCHAR(50) ;
DECLARE @health INT ;
DECLARE @mana INT ;
DECLARE @strength INT;
DECLARE @intelligence INT;
DECLARE @agility INT ;
DECLARE @critical INT;
DECLARE @defense INT ;
DECLARE @money INT;
DECLARE @item_count INT;

DECLARE @i INT = 1;


WHILE @i <= 100000
BEGIN
    SET @player_id = ROUND(RAND() * 24999 + 1, 0); 
    SET @name = 'character' + CAST(@i AS VARCHAR);
    SET @level_id = ROUND(RAND() * 3999 + 1, 0);
    SET @class = CASE @i%3 
        WHEN 0 THEN 'warrior'
        WHEN 1 THEN 'mage'
		WHEN 2 THEN 'rogue'
    END;
    SET @health = ROUND(RAND() * 1000, 0);
    SET @mana = ROUND(RAND() * 100, 0);
    SET @strength = ROUND(RAND() * 100, 0);
    SET @intelligence = ROUND(RAND() * 100, 0);
    SET @agility = ROUND(RAND() * 100, 0);
    SET @critical = ROUND(RAND() * 50, 0); 
    SET @defense = ROUND(RAND() * 100, 0);
    SET @money = ROUND(RAND() * 10000, 0); 
    SET @item_count = ROUND(RAND() * 10, 0); 

    INSERT INTO Character (player_id, name, level_id, class, health, mana, strength, intelligence, agility, critical, defense, item_count )
    VALUES (@player_id, @name, @level_id, @class, @health, @mana, @strength, @intelligence, @agility, @critical, @defense, @item_count);

    SET @i = @i + 1;
END





 DECLARE @character_id INT;
 DECLARE @item_id INT;
 DECLARE @quantity INT;
 
 DECLARE @i INT = 1;
 
 WHILE @i <= 100000
 BEGIN
     SET @character_id = ROUND(RAND() * 49999 + 1, 0); 
     SET @item_id = ROUND(RAND() * 999 + 1, 0);
     SET @quantity = ROUND(RAND() * 9 + 1, 0);
 
     INSERT INTO Character_Item (character_id, item_id, quantity)
     VALUES (@character_id, @item_id, @quantity);
 
     SET @i = @i + 1;
 END

--
-- CREATING STORED PROCEDURES --
--	 

 CREATE PROCEDURE GetPlayerCharacters 
     @player_id INT
 AS
 BEGIN
     SELECT * 
     FROM Character 
     WHERE player_id = @player_id;
 END;

 EXEC GetPlayerCharacters @player_id = 1;


--
-- CREATING VIEWS --
--

 CREATE VIEW PlayerCharacters AS
 SELECT 
     P.player_id, 
     P.username, 
     C.character_id, 
     C.name AS character_name, 
     C.class
 FROM 
     Player P
 INNER JOIN 
     Character C ON P.player_id = C.player_id

 SELECT * FROM PlayerCharacters
 ORDER BY player_id, character_id;

--
-- SQL QUERIES --
--

  --Max level character of the designated player
 DECLARE @player_id INT;
 SET @player_id = 5;
 
 SELECT TOP 1 C.*
 FROM Character AS C
 JOIN Level AS L ON C.level_id = L.level_id
 WHERE C.player_id = @player_id
 ORDER BY L.score DESC;

 
  --the character with the max level among all players 
 SELECT TOP 100 C.*, P.username
 FROM Character AS C
 JOIN Level AS L ON C.level_id = L.level_id
 JOIN Player AS P ON C.player_id = P.player_id
 ORDER BY L.score DESC;
 
-- Find the most powerful found Item.
 SELECT TOP 1 I.name, I.strength
 FROM Item I
 WHERE I.strength = (SELECT MAX(strength) FROM Item);
 
 --The 100 players with the highest total score.
 select top 100 username, total_score from Player
 order by total_score desc





