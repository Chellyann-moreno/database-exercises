/* In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? 7
Answer that in a comment in your SQL file. */
Select distinct title
from titles;

/* Write a query to to find a list of all unique last names of all employees that start and end with 'E' 
using GROUP BY. */
Select last_name
from employees
where last_name like 'e%e'
group by last_name;

/*Write a query to to find all unique combinations of first and last names of all employees 
whose last names start and end with 'E'.*/

Select first_name,last_name
from employees
where last_name like 'e%e'
group by first_name, last_name;

/* Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code. Chleq, Lindqvist, Qiwen */
select last_name
from employees
where last_name like ('%q%')
and last_name not like ('%qu%')
group by last_name;

/* Add a COUNT() to your results (the query above) to find the number of employees with the same last name.  */
select count(last_name)
from employees
where last_name like ('%q%')
and last_name not like ('%qu%')
group by last_name;

/* Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. */

select first_name, gender, count(gender) as gender_count
from employees
where first_name IN ('Irena','Vidya','Maya')
group by first_name, gender;

/* Using your query that generates a username for all of the employees, 
generate a count employees for each unique username. */

 select distinct lower( concat(left(first_name,1),left(last_name,4),'_',substr(birth_date,6,2), substr(birth_date,-8,2))) as username,
 count(*) as count_username
 from employees
 group by username
 order by count_username DESC;
 
 /* From your previous query, are there any duplicate usernames? y
 What is the higest number of times a username shows up? 6
 Bonus: How many duplicate usernames are there from your previous query? */
 
 select  lower( concat(left(first_name,1),left(last_name,4),'_',substr(birth_date,6,2), substr(birth_date,-8,2))) as username,
  count(*) as count_username
 from employees
 group by username
 having count_username >1
 order by count_username DESC;
 
 
 
 
------------------------------------------------------------------------------------------------------------------------------------- 
 -- BONUS --
 /* Determine the historic average salary for each employee. 
 When you hear, read, or think "for each" with regard to SQL, 
 you'll probably be grouping by that exact column. */
 select emp_no, avg(salary) 
 from salaries
 group by emp_no;
 
 /* Using the dept_emp table, count how many current employees work in each department.
 The query result should show 9 rows, one for each department and the employee count. */
 select  dept_no, count(*) 
 from dept_emp
 where to_date like '9999-01-01'
 group by dept_no;

 /* Determine how many different salaries each employee has had. 
 This includes both historic and current. */
 select emp_no, count(salary) as count_salary
 from salaries
group by  emp_no;

-- Find the maximum salary for each employee.
 select emp_no, max(salary) as max_salary
 from salaries
group by  emp_no;

-- Find the minimum salary for each employee.
  select emp_no, min(salary) as min_salary
 from salaries
group by  emp_no;

-- Find the standard deviation of salaries for each employee.
 select emp_no, STDDEV(salary) as STD_salary
 from salaries
group by  emp_no;

-- Now find the max salary for each employee where that max salary is greater than $150,000.

  select emp_no, max(salary) as max_salary
 from salaries
 where salary > 150000
group by  emp_no;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
 select emp_no, avg(salary) as avg_salary
 from salaries
  where salary between 80000 and 90000
group by  emp_no;
 
 
 

