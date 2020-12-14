CREATE TABLE FIRST_TABLE AS (
    SELECT FIRST_NAME , SALARY FROM EMPLOYEES 
    WHERE SALARY BETWEEN 10500 AND 13000
    
) ORDER BY 2 ;  


CREATE TABLE SECOND_TABLE AS (
    SELECT FIRST_NAME , SALARY FROM EMPLOYEES 
    WHERE SALARY BETWEEN 12000 AND 24000
    
) ORDER BY 2 ;  

COMMIT ;


--In order for SET Operators to work , two tables or result of two query being used MUST HAVE 
--same exact column count , same exact column name , same exact column data type or set operator
--will not work at all !  Unlike join which require primary key and foreign key relationship,
--SET Operator must have above pre-requisite

--union : remove duplicates and order accoding to first column
select * from first_table 
union 
select * from second_table;


--just appends the seoncd table to the end of first table.
select * from first_table
union all
select * from second_table;

--minus : remove the elements in the second from first
select * from first_table
minus 
select * from second_table;

select * from second_table
minus 
select * from first_table;


--intersect: gives the common ones
select * from first_table
intersect
select * from second_table;


INSERT INTO jobs (
    job_id,
    job_title,
    min_salary,
    max_salary
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3
);
