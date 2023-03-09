use employees;
select database();
show tables;
select * from employees.employees;
/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
Irena Reurenauer, Vidya Simmen
 */
select * 
from employees
where first_name IN ('Irena','Vidya','Maya')
order by first_name;
/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
Irena Acton, Vidya Zweizig
*/
Select * from employees
where first_name IN ('Irena','Vidya','Maya')
order by first_name, last_name;
/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
Irena Acton, Maya Zyda */
select * 
from employees
where first_name IN ('Irena','Vidya','Maya')
order by last_name, first_name;

/* Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. 
Enter a comment with the number of employees returned, the first employee number and their first and last name, 
and the last employee number with their first and last name.
899 employees, Ramzi Erde, Tadahiro Erde*/
select  *
from employees
where last_name like 'E%'
and last_name  like '%E'
order by emp_no;
/* 
Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 
Enter a comment with the number of employees returned, the name of the newest employee, a
nd the name of the oldest employee. 899 employees
Teiji Eldrige 1999-11-27, Sergi Erde 1985-02-02 */
select  *
from employees
where last_name like 'E%'
and last_name  like '%E'
order by hire_date desc;
/* Find all employees hired in the 90s and born on Christmas. 
Sort the results so that the oldest employee who was hired last is the first result. 
Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, 
and the name of the youngest employee who was hired first. 362 employes
Khun Bermini, Alselm Cappello */
select * 
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like ('%12-25')
order by hire_date desc;



 

