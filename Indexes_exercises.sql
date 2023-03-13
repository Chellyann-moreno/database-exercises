show databases;
use employees;
select * from employees;
show create table employees;
/* CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */
show tables;
show create table quotes;
/* CREATE TABLE `quotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL,
  `content` varchar(240) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */

Create table  dept_manager ( ID INT NOT NULL,
first_name varchar(100) NOT NULL,
last_name varchar(100) NOT NULL,
PRIMARY KEY (ID),
UNIQUE ( hire_date, first_name, Last_name));
