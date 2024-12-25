Create database ass6;
use ass6;




CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (emp_id, name, department, salary)
VALUES
(1, 'John', 'HR', 5000),
(2, 'Alice', 'IT', 7000),
(3, 'Bob', 'Finance', 6000),
(4, 'Eve', 'IT', 8000),
(5, 'Charlie', 'Finance', 7500);
select * from employees;

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
select * from departments;

# 1. Find employees with salaries greater than the average salary of all employees. 
SELECT emp_id, name, department, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


# 2. Find employees whose salary is higher than the salary of 'Alice'. 
SELECT emp_id, name, department, salary
FROM employees
WHERE salary > ( SELECT MAX(salary) FROM employees WHERE name = 'Alice');

SELECT emp_id, name, department, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE name = 'Alice');


# 3. List employees who belong to a department that has the name 'IT'.
SELECT emp_id, name, department, salary
FROM employees
WHERE department = (SELECT dept_name FROM departments WHERE dept_name = 'IT');



# 4. Get the names of employees who earn the highest salary in their department. 
select name,department,salary
from employees 
where salary in ( select max(salary) from employees group by department);


# 5. Retrieve the departments where at least one employee earns more than 7000. 
select dept_name 
from departments 
where dept_name in ( select department from employees where salary > 7000);


# 6. List employees who do not belong to any department in the departments table. 
SELECT emp_id, name, department
FROM employees
WHERE department NOT IN (SELECT dept_name FROM departments);

SELECT dept_name
from departments
where dept_name not in(select department from employees);


# 7. Find the second-highest salary among employees. 
SELECT emp_id, name, department, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));



# 8. Retrieve the names of employees who work in the department with the highest number of employees. 
SELECT name,department
FROM employees
WHERE department in (SELECT department FROM employees GROUP BY department HAVING COUNT(department) > 1);


# 9. Find employees who earn more than the average salary in their department. 
SELECT emp_id, name, department, salary
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department = e.department);


# 10. Retrieve employees whose salary is above 7000 and belong to departments in the departments table. 
SELECT emp_id, name, department, salary
FROM employees e
WHERE salary > 7000
AND department IN (SELECT dept_name FROM departments);

# 11. List all departments that have no employees. 
SELECT dept_name
FROM departments
WHERE dept_name NOT IN (SELECT DISTINCT department FROM employees);

# 12. Find employees who have the same salary as another employee in a different department. 
SELECT emp_id, name, department, salary
FROM employees 
WHERE salary IN (SELECT salary FROM employees WHERE department <> department);


# 13. Get the total salary of the department with the maximum total salary. 
SELECT SUM(salary) AS "total salary"
FROM employees
WHERE department = (SELECT department FROM employees GROUP BY department ORDER BY SUM(salary) DESC LIMIT 1);



# 14. Retrieve employees whose department has more than two employees. 
SELECT emp_id, name, department, salary
FROM employees
WHERE department IN (SELECT department FROM employees GROUP BY department HAVING COUNT(department) >= 2);


# 15. Find employees whose salary is higher than the average salary of employees in the IT department. 
SELECT emp_id, name, department, salary
FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees WHERE department = 'IT');


