--Tasks : general
--from the sql interview questions: 
--from oracle univeristy: instead of join ...on ---- join ....using()
select employee_id , first_name , last_name , department_name
from employees join departments 
using (department_id);


--15.Find duplicate names in employees
SELECT first_name, COUNT (first_name) FROM employees GROUP BY first_name
HAVING (COUNT(first_name)>1);


--16.	How to find employees whose salaries are below the average?
select first_name, salary from employees 
where salary < (select avg(salary) from employees);

--17.	How to find maximum salaries in each department?
select e.department_id , MAX(salary) "Maximum" from employees e
inner join departments d  on e.department_id =d.department_id
group by e.department_id , d.department_name; 

--18.	How to find lowest salaries?
select min(salary) from employees;

--18.	How to find lowest salaries in each department?
select department_id ,min(salary) from employees
group by department_id
order by 2;

--18.	How to find employees who has lowest salaries in each department?
select e.first_name , e.department_id, salary from employees e
inner join departments d on e.department_id = d.department_id
where salary = (select min(salary) from employees group by e.department_id);
--the above one is not completed




----warmup question:Find out the name of top earner in each departments in HR Database
--outcome should have 3 columns
--department name , first_name, salary
--step1: find out the ma salary in each department
select department_id, max(salary) from employees 
group by department_id;


select department_name, max(salary) from employees e
inner join departments d on e.department_id = d.department_id
group by department_name;

select max(salary) from employees e
inner join departments d on e.department_id = d.department_id
group by department_name;

--solution 
select e.first_name, d.department_name, e.salary from employees e
inner join departments d on e.department_id = d.department_id
where salary in (select max(salary) from employees e
inner join departments d on e.department_id = d.department_id
group by department_name);

-----second attemp
select first_name from employees e1 
inner join (select department_id, max(salary) from employees 
group by department_id) Salaries on Salaries.department_id = e1.department_id;

select department_id, max(salary) from employees 
group by department_id;

--second attemps solution-approved
select first_name, e1.salary, e1.department_id 
from  (select department_id, max(salary) MaxSalary from employees group by department_id) Salaries  
inner join employees e1 on Salaries.MaxSalary = e1.salary and Salaries.department_id = e1.department_id
order by 2;


--solution with department names--approved
select first_name, last_name ,e1.salary, e1.department_id , d.department_name
from  (select department_id, max(salary) MaxSalary from employees group by department_id) Salaries  
inner join employees e1 on Salaries.MaxSalary = e1.salary and Salaries.department_id = e1.department_id
inner join departments d on d.department_id = Salaries.department_id
order by 3;

--Abduweli's solution
select FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_NAME
    from
    (select * from EMPLOYEES e
    join DEPARTMENTS d
    USING (DEPARTMENT_ID)) firstTable
right  join
      (select d.DEPARTMENT_NAME,max(SALARY) as Salary from employees
        join DEPARTMENTS d USING(DEPARTMENT_ID)
        group by d.DEPARTMENT_NAME) secondTable
USING (DEPARTMENT_NAME,Salary)
order by 3;




select department_id, max(salary) from employees e1 
group by department_id 
having  salary = (select max(salary) from employees 
group by department_id);


--0. Display employee_count,max and min salary, rounded average salary, 
--sum of salary of employees in each region
--the result should have 4 rows for each region and 5 columns
--for (count, max,min.avg,sum)
Select * from employees;



--1. list the initials of all the employees
select concat(substr(first_name,1,1),concat('.',concat(substr(last_name,1,1),'.'))) as "initials"
from employees;
--another solution without points
select substr(first_name,1,1)||substr(last_name,1,1) "Initials" from employees;


--2. list the full names of all employees ( fullname: Lastname FirstName)

select last_name ||' '||first_name "fullname" from employees;





--3. who has the longest name in the employees table?
select max(length(first_name)) from employees;
select first_name, last_name from employees where length(first_name)  = (select max(length(first_name)) from employees);
select first_name||' '||last_name from employees where length(first_name||last_name)  = (select max(length(first_name||last_name)) from employees);


--4. Show all employees who work in any one of these department id  90, 60, 100, 130, 120
select first_name, last_name from employees where department_id in(90,60,100,130,120);



--5. Show all employees who does not work in any one of these department id 90, 60,  100, 130, 120
select first_name, last_name, department_id from employees where department_id not in(90,60,100,130,120);

--6. divide employees into groups by using thier job id
select job_id,count(*) from employees group by job_id;

--  6.1 display the maximum salaries in each groups
select max(salary), job_id from employees group by job_id;

--to verify max salary in It_prog
select salary , job_id from employees where job_id like '%PRO%'; 

--  6.2 display the minium salaries in each groups
select min(salary) , job_id from employees group by job_id;


--  6.3 display the average salary of each group
select avg(salary), job_id from employees group by job_id;


--  6.4 how many employees are there in each group that have minimum salary of 5000 ?
select count(*),job_id from employees group by job_id having min(Salary)<=5000;

--checking quesries for the above 
select salary, job_id from employees order by 2;
select salary, job_id from employees where salary = 5000 order by 2;
select count(*),job_id from employees where salary= (select min(salary) from employees) group by job_id;



--  6.5 display the total budgests of each groups
select job_id , sum(salary) Budget from employees group by job_id;



--7. display employees' full email addresses and full names (assume that the domain of the email is @gmail)


--8. display full addresses from locations table in a single column(full address: Street_Addtess,  CityName  ZipCode,  Country_id)
--
--TASK
-- 
--  
--  1.1  GET UNIQUE MANAGER_IDs from Employees Table 
select distinct manager_id from employees;

--some examples to use update from line 158 to 168
select distinct employee_id from employees;
select * from employees where employee_id =100;


UPDATE employees
SET
    email = 'Seven'
WHERE
        employee_id = 100;
   

--
--  1.2  GET UNIQUE DEPARTMENTS_ID FROM EMPLOYEES TABLE
select distinct departments_id from employees;

--  1.3  COUNT UNIQUE DEPARTMENTS_ID FROM EMPLOYEES TABLE 
--
--  1.4  GET THE SUM OF ALL SALARY FOR JOB_ID FI_ACCOUNT
--
--  1.5  GET FULL_NAME (FIRST_NAME||LAST_NAME) AND LENTH OF EACH FULL NAME FROM EMPLOYEES TABLE 
--
--  1.6  GET THE ALL EMPLOYEES WITH first name SECOND CHARACTER 'A'
--
--  1.7  GET ALL EMPLOYEES WITH FIRST_NAME HAS 2 'a' no matter where case insenstive
--
--
--
--
-- how to comment all of them  
    -- select and COMMAND + OPTION + /  for mac 
    ---  CONTROL + / for windows 
--TASK -- GROUP BY 
--      HAVING
--
--1.    USING COUNTRIES TABLE -- 
--  FIND OUT HOW MANY COUNTRY IN REGION 
--  (REGION_ID , COUNT...)
    
    /* 
        to comment multiple lines  
    */
    SELECT region_id, COUNT(*) 
    FROM COUNTRIES 
    GROUP BY region_id
    ; 
--  1.1 USING COUNTRIES TABLE -- (continue from above)
--  FIND OUT REGIONS THAT HAVE EXACTLY 6 COUNTRIES
        -- IN ORDER TO PUT MORE CONDITION ON ALREADY GROUPED DATA USE HAVING AFTER GROUP BY 
    SELECT region_id, COUNT(*) AS COUNTRY_COUNT
    FROM COUNTRIES 
    GROUP BY region_id
    HAVING COUNT(*) = 6  -- CAN NOT USE ALIAS AFTER HAVING CLAUSE
  
    ; 
        
--
--2,  USING DEPARTMENTS TABLE -- 
--  FIND OUT HOW MANY DEPARTMENTS IN EACH LOCATIONS 
--
--  2.1 USING COUNTRIES TABLE -- (continue from above)
--  FIND OUT LOCATIONS THAT HAVE MORE THAN 1 DEPARTMENTS
--
--  2.2 FROM THE LOCATION ID RESULT ABOVE QUERY
--  IN SEPARATE QUERY (USING LOCATIONS TABLE)
--  FIND OUT STREET ADDRESS OF THAT LOCATION 
--
--3,  USING EMPLOYEES TABLE 
--  FIND OUT HOW MANY EMPLOYEES EACH MANAGER MANAGE (group by manager_id)
--
--  -- continue above 
--      3.1 -- find out manager who mange more than 10 employees 
--      3.2 -- find out manager who manage exactly 6 employees 
--
--
--4,  USING EMPLOYEES TABLE 
--  GROUP EMPLOYEES BY COMMISSION_PCT to count how many employee for each commission_pct value 
--
--
--5, USING EMPLOYEES TABLE 
--
--   5.0 GET THE COUNT OF EMPLOYEE THAT HAVE EXACTLY 5 CHARACTERS IN FIRST NAME (no need for group by)
select count(first_name) as name_with_5_chars from employees where length(first_name) = 5;

--   5.1 GET THE SUM OF SALARY , SUM OF DISTINCT SALARY FROM EMPLOEEYS TABLE 
--   5.2 GET THE SUM OF ALL SALARY FOR EACH DEPARTMENTS 
--   5.3 GET THE AVG SALARY OF EACH JOB_ID 
--   5.4 GET THE AVG SALARY OF EACH DEPARTMENTS 
--   5.5 GET THE MAX SALARY OF EACH FOLLOWING DEPARTMENT 90 , 100 , 50 
--
--
--
--6, USING EMPLOYEES TABLE   
--
--   6.1 FIND OUT HOW MANY EMPLOYEES WAS HIRED BEFORE '24-JUL-05'
--
--          -- There are specific function for date but for this task SUBSTR we know will just work
--   6.2 FIND OUT HOW MANY EMPLOYEES WAS HIRED ON YEAR 2005 
--          (CONDITION HINT : HIRE_DATE LIKE '%05'  OR  SUBSTR(HIRE_DATE, 8,2)= '05') 
--   6.3 FIND OUT HOW MANY EMPLOYEES WAS HIRED ON JULY 
--          (CONDITION HINT : HIRE_DATE LIKE '%JULY%'  OR  SUBSTR(HIRE_DATE,4,3)= 'JUL') 
--
--
--   6.4 GROUP THE EMPLOYEE TABLE BY HIRE_DATE YEAR TO GET HOW MANY EMPLOYEES WAS HIRED IN EACH YEAR 
--          (CONDITION HINT :  GROUP BY SUBSTR(HIRE_DATE, 8,2) ) 
--
--
--   6.5  GET FIRST 3 DIGIT OF PHONE NUMBER AS AREA_CODE FROM EMPLOYEES TABLE 
--      6.5.1  GROUP BY EMPLOYEE TBALES BY FIRST 3 DIGIT OF PHONE NUMBER
--              TO FIND OUT HOW MANY PHONE EMPLOYEES IN EACH AREA_CODE
--              515 21
--              590 5
--              603 1
--              011 35
--              650 45
--          SELECT SUBSTR(PHONE_NUMBER,1,3) AS AREA_CODE , COUNT(*) 
--          FROM EMPLOYEES 
--          GROUP BY SUBSTR(PHONE_NUMBER,1,3) ;
