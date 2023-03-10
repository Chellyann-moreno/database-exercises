use employees;
select database();
show tables;
select * from employees.employees;

/* Write a query to to find all employees whose last name starts and ends with 'E'. 
Use concat() to combine their first and 
last name together as a single column named full_name. */

select  concat(first_name,' ', last_name) as Full_Name 
from employees
where last_name like 'e%e' ;

-- Convert the names produced in your last query to all uppercase.
select  UPPER(concat (first_name,' ',last_name) ) as Full_Name
from employees
where last_name like 'e%e' ;
-- Use a function to determine how many results were returned from your previous query
select  COUNT( UPPER(concat (first_name,' ',last_name) ) ) as Full_Name
from employees
where last_name like 'e%e';
/* Find all employees hired in the 90s and born on Christmas. 
Use datediff() function to find how many days they have been working at the company 
(Hint: You will also need to use NOW() or CURDATE()), */
select UPPER(concat (first_name,' ',last_name) ) as Full_Name, 
hire_date, DATEDIFF(hire_date,now()) as DateDiff
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like ('%12-25');

-- Find the smallest and largest current salary from the salaries table.
show tables;
select max(salary) as max_salary, min(salary) as min_salary
from salaries;
/* Use your knowledge of built in SQL functions to generate a username for all of the employees.
 A username should be all lowercase, and consist of the first character of the employees first name, 
 the first 4 characters of the employees last name, an underscore, the month the employee was born, 
 and the last two digits of the year that they were born. */
 select* from employees;
 select emp_no, lower( concat(left(first_name,1),left(last_name,4),'_',substr(birth_date,6,2), substr(birth_date,-8,2)))
 from employees
 





