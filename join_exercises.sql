use join_example_db;
show tables;
-- Use the join_example_db. Select all the records from both the users and roles tables
select * from roles;
select * from users;
/* Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
Before you run each query, guess the expected number of results. */

select u.name, u.email, r.name as role_name
from users as u
left outer join roles as r on u.id=r.id;

/* Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
Hint: You will also need to use group by in the query. */
select r.name as role_name, count(u.name)
from roles as r
right outer join users as u on u.id=r.id
group by role_name
;
--  --
/* Using the example in the Associative Table Joins section as a guide, 
write a query that shows each department along with the name of the current manager for that department. */
use employees;
show tables; 
select * from dept_emp;
select * from employees;
select * from dept_manager;
select * from departments;
select * from salaries;
select * from titles;

select * from titles;

select concat(emp.first_name,' ', emp.last_name) as full_name,
 dep.dept_name
 from departments as dep
join dept_manager as mang on dep.dept_no=mang.dept_no
join employees as emp on mang.emp_no=emp.emp_no
join titles as t on mang.emp_no=t.emp_no
where t.to_date > now() and mang.to_date > now();

-- Find the name of all departments currently managed by women.
select concat(emp.first_name,' ', emp.last_name) as full_name,
 dep.dept_name
from departments as dep
join dept_manager as mang on dep.dept_no=mang.dept_no
join employees as emp on mang.emp_no=emp.emp_no
join titles as t on mang.emp_no=t.emp_no
where t.to_date > now() and mang.to_date > now()
and emp.gender = 'F'; 

/* Find the current titles of employees currently working in the Customer Service department. */
select t.title, count(*)
from titles as t
join dept_emp as demp on demp.emp_no=t.emp_no
join departments as d on demp.dept_no=d.dept_no
where  demp.to_date > now() and t.to_date > now()
	and d.dept_name in ('Customer Service')
group by t.title
order by title;

-- Find the current salary of all current managers.

select mang.emp_no,concat(emp.first_name,' ', emp.last_name) as full_name, s.salary
from dept_manager as mang
join salaries as s on s.emp_no=mang.emp_no
join employees as emp on emp.emp_no=mang.emp_no
where s.to_date > now() and mang.to_date > now();

-- Find the number of current employees in each department.

select d.dept_name, count(*)
from departments as d
join dept_emp as demp on d.dept_no=demp.dept_no
where  demp.to_date > now() 
group by d.dept_name ;

-- Which department has the highest average salary? Hint: Use current not historic information. Sales
select d.dept_name, avg(s.salary)
from salaries as s
join dept_emp as demp on s.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
where s.to_date > now() and demp.to_date > now()
group by d.dept_name
order by avg(s.salary) desc;

-- Who is the highest paid employee in the Marketing department?

select concat(emp.first_name,' ', emp.last_name) as full_name, s.salary
from departments as d
join dept_emp as demp on d.dept_no=demp.dept_no
join employees as emp on demp.emp_no=emp.emp_no
join salaries as s on emp.emp_no=s.emp_no
where  demp.to_date > now()  
	and s.to_date > now()
	and dept_name in ('Marketing')
group by emp.first_name, emp.last_name, s.salary
order by s.salary desc;

-- Which current department manager has the highest salary?

select mang.emp_no, concat(emp.first_name,' ', emp.last_name) as full_name, s.salary
from dept_manager as mang
join salaries as s on s.emp_no=mang.emp_no
join employees as emp on emp.emp_no=mang.emp_no
where s.to_date > now()
   and mang.to_date > now()
order by s.salary desc;

-- Determine the average salary for each department. Use all salary information and round your results.

select d.dept_name, round(avg(s.salary), 0) as av_salary
from salaries as s
join dept_emp as demp on s.emp_no=demp.emp_no
join departments as d on demp.dept_no=d.dept_no
group by d.dept_name
order by avg(s.salary) desc;

-- Bonus Find the names of all current employees, their department name, and their current manager's name.

select concat(emp.first_name,' ', emp.last_name) as mang_full_name,
 dep.dept_name
from departments as dep
join dept_manager as mang on dep.dept_no=mang.dept_no
join employees as emp on mang.emp_no=emp.emp_no
join titles as t on mang.emp_no=t.emp_no
where t.to_date > now() 
and mang.to_date > now() 
and full_name IN (

select concat(emp.first_name,' ', emp.last_name) as full_name
from dept_emp as demp
join employees as emp using(emp_no)
join departments as d using(dept_no)
where demp.to_date > now() )






