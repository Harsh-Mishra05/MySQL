create database assignment;
use assignment;

CREATE TABLE Ass_3(
emp_id int not null,
first_name varchar(50),
last_name varchar(50),
department varchar(20),
salary int not null,
hire_date date);

SELECT * FROM Ass_3;

insert into Ass_3(emp_id,first_name,last_name,department,salary,hire_date)
values
(1,"John","Doe","IT",60000,"2019-01-10"),
(2,"Jane","Smith","HR",55000,"2018-03-05"),
(3,"Emily","Jones","IT",62000,"2020-07-23"),
(4,"Michael","Brown","FINANCE",70000,"2016-05-14"),
(5,"Sarah","Davis","FINANCE",69000,"2017-11-18"),
(6,"David","Johnson","HR",48000,"2021-09-10");



# Find the average salary of employees in each department. 
select department, avg(salary) as average_salary
from Ass_3
group by department;

# Find the total number of employees hired after 2019.
SELECT count(hire_date) as "employees hired after 2019"
from Ass_3
where hire_date >"2019-01-10";

# List the departments and the total salary of all employees in each department, ordered by the total salary.
SELECT department, SUM(salary) AS "total salary in each deparment"
FROM Ass_3
GROUP BY department
ORDER BY sum(salary) ASC;

# Find the highest salary in the Finance department. 
SELECT department, MAX(salary) AS highest_salary
FROM Ass_3
WHERE department = "Finance";

# Get the top 3 highest-paid employees. 
select first_name , max(salary) as "highest paid employee "
from Ass_3
group by first_name order by max(salary) desc
limit 3;

# Find the department with the minimum average salary.
SELECT department, AVG(salary) AS average_salary
FROM Ass_3
GROUP BY department
ORDER BY average_salary ASC
LIMIT 1;

#  Display the total number of employees in each department, ordered by the number of employees. 
SELECT department, COUNT(*) AS total_employees
FROM Ass_3
GROUP BY department
ORDER BY total_employees DESC;

#  Find the average salary of employees who were hired before 2020.
select hire_date, avg(salary) as "Average Salary"
from Ass_3
group by  hire_date having
hire_date < "2020-01-01" ;

# List the names of employees in the IT department ordered by hire date, with the most recently hired employees first.
SELECT CONCAT(first_name,' ', last_name) AS full_name, hire_date
FROM Ass_3
WHERE department = 'IT'
ORDER BY hire_date DESC;

#  Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary.
SELECT SUM(salary) AS total_salaries
FROM Ass_3
WHERE hire_date > '2019-01-01';

# Get the employee with the lowest salary in the HR department. 
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary
FROM Ass_3
WHERE department = 'HR'
ORDER BY salary ASC
LIMIT 1;

# Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.  
SELECT department, SUM(salary) AS total_salary
FROM Ass_3
GROUP BY department
ORDER BY total_salary DESC
LIMIT 2;

#  List all employees hired after 2018, ordered by salary, and show only the first 4 employees. 
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary
FROM Ass_3
WHERE hire_date > '2018-12-31'
ORDER BY salary DESC
LIMIT 4; 

#  Find the highest salary in the IT department, but limit the results to the top 1 result.   
SELECT department, MAX(salary) AS highest_salary
FROM Ass_3
WHERE department = 'IT';





# Get the average salary of employees in each department and list only departments with an average salary greater than $60,000.
SELECT department, AVG(salary) AS average_salary
FROM Ass_3
GROUP BY department
HAVING average_salary > 60000;








