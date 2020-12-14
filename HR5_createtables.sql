--creating table
--- SUPERHEROS
-- HERO_ID as number
-- Name    as (varchar2) STRING
-- Power   as (varchar2) string
-- CostumeColor as  as (varchar2) string
-- Company as (varchar2) string

create table super_heros(
                        hero_id INTEGER primary key,
                        powers varchar(20),
                        CustomeColor varchar(20),
                        Company varchar(20)
);

select * from super_heros;


INSERT INTO super_heros (
    hero_id,
    name,
    power,
    costume_color,
    company
) VALUES (
    102,
    'Batman',
    'rich and gagets',
    'black',
    'DC'
);

INSERT INTO super_heros (hero_id,name,power,costume_color,company)
                 VALUES (104,   'Batman','Intelligence','Black', 'DC') ;
INSERT INTO super_heros (hero_id,name,power,costume_color,company)
                 VALUES (105,   'Capitan Marvel','Fly','Golden', 'Marvel') ;
                 
UPDATE super_heros
SET
    power ='super size'
WHERE
    hero_id = 104;
    


ALTER table super_heros RENAME COLUMN name TO names;


DELETE FROM super_heros
WHERE
        hero_id = 104;
    
--this gives error bc there is already a record which has the same name bc name is unique     
INSERT INTO super_heros (hero_id,names,power,costume_color,company)
                 VALUES (103,   'Capitan Marvel','Fly','Golden', 'Marvel') ;

--lets check the check contsrain in costome_color
INSERT INTO super_heros (hero_id,names,power,costume_color,company)
                 VALUES (103,   'Flash','Fly','R', 'Marvel') ;


--Error starting at line : 58 in command -
--INSERT INTO super_heros (hero_id,names,power,costume_color,company)
--                 VALUES (103,   'Flash','Fly','R', 'Marvel')
--Error report -
--ORA-02290: check constraint (HR.SUPER_HEROS_CHK1) violated

create table comic_company(
company varchar(20),
full_companyName varchar(20),
book_count integer
);


insert into comic_company(company,full_companyName,book_count) 
                    values('DC','DC Entertainment',1000); 
                    

insert into comic_company(company,full_companyName,book_count) 
                    values('Marvel','Marvel unlimited',887); 
