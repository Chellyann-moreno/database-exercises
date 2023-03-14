
select * from salaries as s
join employees as emp using(emp_no)
where s.salary > ( select avg(salary)
from salaries )
and s.to_date > now();
 select * from titles;
-- --
-- Find all the current employees with the same hire date as employee 101010 using a subquery.
select * from  (
select concat(emp.first_name,' ',emp.last_name) as full_name,
emp.hire_date
from dept_emp as demp
join employees as emp using (emp_no)
where demp.to_date > now()
and emp.hire_date in ('1990-10-22')
or emp_no = 101010
) a
;
select * 
from employees 
join dept_emp as demp using(emp_no)
where hire_date= (select hire_date from employees where emp_no= 101010)
and demp.to_date > curdate();

-- Find all the titles ever held by all current employees with the first name Aamod.
select title
 from  (
select title,
concat(emp.first_name,' ',emp.last_name) as full_name
from dept_emp as demp
join employees as emp using (emp_no)
join titles as t using (emp_no)
where demp.to_date > curdate()
and emp.first_name in ('Aamod')
) a
group by title;

-- How many people in the employees table are no longer working for the company? 
-- Give the answer in a comment in your code. 91479
select count(emp_no)
from ( 
 Select distinct t.emp_no, concat(emp.first_name,' ',emp.last_name) as full_name, t.to_date
from employees as emp
join titles as t on emp.emp_no=t.emp_no
where t.to_date < curdate()) a
;

-- Find all the current department managers that are female. List their names in a comment in your code.
select * from (
 Select concat(emp.first_name,' ', emp.last_name) as full_name,
 dep.dept_name
from departments as dep
join dept_manager as mang on dep.dept_no=mang.dept_no
join employees as emp on mang.emp_no=emp.emp_no
join titles as t on mang.emp_no=t.emp_no
where t.to_date > now() and mang.to_date > now()
and emp.gender = 'F') a ;

--    --

use employees;
select * from salaries;

--  --
-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.

select full_name, 
 Max(a_salary), 
a.to_date
from (
select concat(emp.first_name,' ', emp.last_name) as full_name, 
avg(s.salary) as a_salary, s.to_date, s.salary
from salaries as s
join employees as emp using (emp_no)
group by full_name,s.to_date,s.salary ) a

where a.to_date > now()
group by full_name, a.to_date
order by max(a_salary) desc;


select * from dept_emp;

/* How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) 
What percentage of all salaries is this? */
 select a.emp_no,
 a.full_name,
 max(STD_salary) 
 from (
 select concat(emp.first_name,' ', emp.last_name) as full_name,
 s.emp_no, round(STD(s.salary),2) as STD_salary
 from salaries as s
 join dept_emp as demp using (emp_no)
 join employees as emp using (emp_no)
  where demp.to_date > now()
group by  s.emp_no
limit 5) a
group by a.emp_no, a.full_name
order by max(STD_salary) desc
limit 2;

select a.emp_no, STDDEV(max_salary)
from (
 select emp_no, max(salary) as max_salary
 from salaries
group by  emp_no
order by max(salary) desc
limit 5) a
group by a.emp_no;

select round(max(salary),0) from salaries as s where to_date > curdate();
select round(std(salary),0) from salaries as s where to_date > curdate();
select round(max(salary),0) - round(std(salary),0) from salaries as s where to_date > curdate();
select * from salaries 
where salary > ( select round(max(salary),0) - round(std(salary),0) from salaries as s where to_date > curdate())
and to_date > curdate();

select round( (select * from salaries 
where salary > ( select round(max(salary),0) - round(std(salary),0) from salaries as s where to_date > curdate())
and to_date > curdate())
/ (select count(*) from salaries as s where s.to_date > curdate()) *100,2) as pctmaxstd
