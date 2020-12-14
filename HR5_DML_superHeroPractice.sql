-- DDL -- Data Definition Language 
-- is for creating/updating/deleting Database objects like Tables ... 

--- SUPERHEROS
-- HERO_ID as number 
-- Name    as (varchar2) STRING 
-- Power   as (varchar2) string 
-- CostumeColor as  as (varchar2) string 
-- Company as (varchar2) string 

SELECT * FROM SUPER_HEROS ; 
-- This is the query for inserting data into our SUPER_HEROS table
INSERT INTO super_heros (hero_id,name,power,costum_color,company)
                 VALUES (103,   'Hulk','Anger','Green', 'Marvel') ;

INSERT INTO super_heros (hero_id,name,power,costum_color,company)
                 VALUES (104,   'Batman','Intelligence','Black', 'DC') ;
INSERT INTO super_heros (hero_id,name,power,costum_color,company)
                 VALUES (105,   'Capitan Marvel','Fly','Golden', 'Marvel') ;


-- update hulk power to --> super size 
UPDATE SUPER_HEROS
SET
    POWER = 'SUPER SIZE'
WHERE
    name = 'Hulk' ; 



INSERT INTO super_heros (hero_id,name,power,costum_color,company)
                 VALUES (106,   'Miss Marvel','Elasiticity','Red yellow', 'Marvel') ;



INSERT INTO super_heros (hero_id,name,power,costum_color,company)
                 VALUES (107,   'JOKER','bad joke','purper', 'DC') ;
-- DELETING DATA

DELETE FROM SUPER_HEROS WHERE NAME = 'JOKER' ; 

-- CRUD OPERATION : CREATED - READ - UPDATE - DELETE 



INSERT INTO super_heros (hero_id,name,power,costum_color,company)
                 VALUES (108,   'FLASH','FAST@@','RED, GOLD', 'DC') ;


-- COMIC_COMPANY
--- COMPANY  FOR NAME  String  PRIMARY KEY (Short name for the company)
--- FULL_NAME VARCHAR2 30 CHARS
--- Count NUMBER

CREATE TABLE COMIC_COMPANY 
(
  COMPANY VARCHAR2(20 BYTE) NOT NULL 
, FULL_NAME VARCHAR2(30 BYTE) 
, COUNT NUMBER 
, CONSTRAINT COMIC_COMPANY_PK 
    PRIMARY KEY (COMPANY)
) ; 

INSERT INTO comic_company (company,full_name,count) VALUES ('DC','DC Entertainment',1000);
INSERT INTO comic_company (company,full_name,count) VALUES ('Marvel','Marvel Unlimited Entertainment',999);

SELECT * FROM COMIC_COMPANY ; 

CREATE TABLE SUPER_HEROS 
(
  HERO_ID NUMBER NOT NULL 
, NAME VARCHAR2(20 BYTE) NOT NULL 
, POWER VARCHAR2(40 BYTE) 
, COSTUM_COLOR VARCHAR2(20 BYTE) 
, COMPANY VARCHAR2(20 BYTE) 
, CONSTRAINT SUPER_HEROS_PK 
            PRIMARY KEY (HERO_ID )
, CONSTRAINT SUPER_HEROS_UK1 
            UNIQUE (NAME )
, CONSTRAINT SUPER_HEROS_FK1 
            FOREIGN KEY(COMPANY )REFERENCES COMIC_COMPANY( COMPANY )
, CONSTRAINT SUPER_HEROS_CHK1 
            CHECK (LENGTH( COSTUM_COLOR) > 2)
) ;

Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (100,'SUPERMAN','FLY, LASER EYE','RED and Blue','DC');
Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (101,'WONDER WOMAN','SUPER STRENGTH','RED','DC');
Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (102,'Iron Man','Tech','Red Gold','Marvel');
Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (103,'Hulk','SUPER SIZE','Green','Marvel');
Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (104,'Batman','Intelligence','Black','DC');
Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (105,'Capitan Marvel','photon energy managemnt','Golden','Marvel');
Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (106,'Miss Marvel','Elasiticity','Red yellow','Marvel');
Insert into SUPER_HEROS (HERO_ID,NAME,POWER,COSTUM_COLOR,COMPANY) values (108,'FLASH','FAST@@','RED, GOLD','DC');

COMMIT ; 

SELECT * FROM SUPER_HEROS;

select * from Regions;
Select * from countries;
