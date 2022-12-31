/* 
CREATE SCHEMA AND SET AS DEFAULT
*/
CREATE SCHEMA FOOTBALLSCHEMA;
USE FOOTBALLSCHEMA;

/*
CREATE TABLES
*/
CREATE TABLE INJURIES (
INJURY_ID INT,
INJURY_NAME VARCHAR(45),
DOWNTIME INT
);

CREATE TABLE PLAYER_INJURIES (
PLAYER_ID INT,
INJURY_ID INT,
GAME_ID INT
);

CREATE TABLE PLAYER (
PLAYER_ID INT,
PLAYER_NAME VARCHAR(45),
AWARD_NAME VARCHAR(45),
CONTRACT VARCHAR(45),
INCOME INT,
YEARS_ACTIVE INT
);

CREATE TABLE PLAYER_PLAYER_AWARDS (
PLAYER_ID INT,
AWARD_ID INT
);

CREATE TABLE PLAYER_AWARDS (
AWARD_ID INT,
AWARD_NAME VARCHAR(45)
);

CREATE TABLE TEAM_PLAYERS (
TEAM_ID INT,
PLAYER_ID INT
);

CREATE TABLE TEAM (
TEAM_ID INT,
TEAM_NAME VARCHAR(45)
);

CREATE TABLE GAME (
GAME_ID INT,
GAME_DATE VARCHAR(45),
LOCATION VARCHAR(45),
OPPONENT VARCHAR(45),
RESULT VARCHAR(45),
TEAM_ID INT
);

/*
IMPORT CSV
#LOAD DATA INFILE 'filepath'
#INTO TABLE thistable
#FIELDS TERMINATED BY ','
#IGNORE 1 ROWS;
*/

/* 
A report query that uses a JOIN (any type) to report on some aggregate value based on a group by clause. 
*/
SELECT PLAYER.PLAYER_NAME, PLAYER.INCOME, INJURIES.INJURY_NAME, INJURIES.DOWNTIME
FROM PLAYER JOIN PLAYER_INJURIES ON PLAYER.PLAYER_ID = PLAYER_INJURIES.PLAYER_ID
JOIN INJURIES ON PLAYER_INJURIES.INJURY_ID = INJURIES.INJURY_ID
WHERE PLAYER.INCOME > 1000000
GROUP BY INJURIES.INJURY_NAME, INJURIES.DOWNTIME, PLAYER.PLAYER_NAME, PLAYER.INCOME
ORDER BY INJURIES.DOWNTIME DESC;

/*
A query that includes a subquery.
*/
SELECT PLAYER.PLAYER_ID, PLAYER.PLAYER_NAME FROM PLAYER WHERE PLAYER_ID IN 
(SELECT PLAYER_ID FROM PLAYER_INJURIES WHERE INJURY_ID IN
(SELECT INJURY_ID FROM INJURIES WHERE DOWNTIME > 50 ));

/*
A query that creates a view.
*/
CREATE VIEW THISVIEW AS
SELECT PLAYER.PLAYER_ID, PLAYER.PLAYER_NAME, PLAYER_AWARDS.AWARD_NAME
FROM PLAYER JOIN PLAYER_PLAYER_AWARDS ON PLAYER.PLAYER_ID = PLAYER_PLAYER_AWARDS.PLAYER_ID
JOIN PLAYER_AWARDS ON PLAYER_PLAYER_AWARDS.AWARD_ID = PLAYER_AWARDS.AWARD_ID
WHERE PLAYER_AWARDS.AWARD_NAME = 'MVP';

/*
A query that demonstrates the view's use.
*/
SELECT * FROM THISVIEW;

/*
A stored procedure that can be called by a query to perform some math operation on the data 
and returns a value(s).
*/
CREATE PROCEDURE getAverageIncome(IN activeY int, In pos varchar(3) ) 
select avg(INCOME) from player
where YEARS_ACTIVE = activeY
and player.CONTRACT = pos; 

/*
A stored procedure that uses a cursor to access and manipuate (update/change) data.
*/
DELIMITER //
create procedure addYear(in yearin int)
BEGIN
declare finished int default 0;
declare yearA int;

declare year_cursor cursor for 
select YEARS_ACTIVE from player
where YEARS_ACTIVE = yearin;

declare continue handler for not found set finished =1;

open year_cursor;
fetch next from year_cursor into yearA;
while finished <> 1 do 

    update player set YEARS_ACTIVE  =  yearA + 1; 
    Fetch next from year_cursor into yearA;
end while;
close year_cursor;

END //

/*
A trigger that updates/inserts data based on an insert. 
*/
DROP TRIGGER IF EXISTS player_INSERT;
CREATE TRIGGER  player_INSERT 
AFTER INSERT ON PLAYER FOR EACH ROW
INSERT INTO PlayerLogs VALUES(NEW.PLAYER_ID, 'Inserted')

/*
demonstrate trigger
*/
INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, AWARD_NAME, CONTRACT, INCOME, YEARS_ACTIVE)
VALUES( 299299, 'noname', 'someaward', 'bbb', 120, 120);
SELECT * FROM PLAYERLOGS;