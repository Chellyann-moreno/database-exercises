SHOW DATABASES;
USE albums_db;
select database();
show tables;
use employees;
select database();
show tables;
show create table employees;
/* CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 
*/
select * from employees.employees;
select * from employees.departments;


-- What different data types are present on this table? numeric, DATE, VARCHAR (text)
-- Which table(s) do you think contain a numeric type column? dept_emp, dept_manager, employees, salaries, titles
-- Which table(s) do you think contain a string type column? departments, dept_emp, dept manager, employees, titles
-- Which table(s) do you think contain a date type column? employees, dept_emp, dept_manager, salaries, titles
-- What is the relationship between the employees and the departments tables? these two tables connects to dept_emp table.
-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
Show create table dept_manager;
