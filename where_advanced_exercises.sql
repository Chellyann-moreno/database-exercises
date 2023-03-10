use employees;
select database();
show tables;
select * from employees.employees;
/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
What is the employee number of the top three results?  10200, 10397, 10610 */
select emp_no,first_name, last_name from employees
where first_name IN ('Irena','Vidya','Maya');
/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN.
 What is the employee number of the top three results? Does it match the previous question? 10200, 10397, 10610. It does match */
select emp_no,first_name, last_name 
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
What is the employee number of the top three results. 10200, 10397, 10821 */
select emp_no,first_name, last_name, gender
from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
and gender= 'M';
-- Find all unique last names that start with 'E'.
select distinct emp_no,first_name, last_name
from employees
where last_name like 'E%';
-- Find all unique last names that start or end with 'E'.
select distinct  last_name
from employees
where last_name like 'e%' or last_name= '%e';
-- Find all unique last names that end with E, but does not start with E?
select distinct first_name, last_name
from employees
where last_name like '%e'
and last_name not like 'e%';
-- Find all unique last names that start and end with 'E'.
select distinct emp_no,first_name, last_name
from employees
where last_name like 'e%e';
/*  Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers. 
10008, 10011, 10012 */
select * 
from employees
where hire_date between '1990-01-01' and '1999-12-31';

/*Find all current or previous employees born on Christmas. 
Enter a comment with top three employee numbers. 10078, 10115, 10261 */
select * 
from employees
where birth_date like ('%12-25');
/* Find all current or previous employees hired in the 90s and born on Christmas. 
Enter a comment with top three employee numbers. 10261, 10438, 10681 */
select * 
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like ('%12-25');
-- Find all unique last names that have a 'q' in their last name.
select distinct emp_no, last_name
from employees
where last_name like ('%q%');
-- Find all unique last names that have a 'q' in their last name but not 'qu'.
select distinct emp_no,last_name
from employees
where last_name like ('%q%')
and last_name not like ('%qu%');
