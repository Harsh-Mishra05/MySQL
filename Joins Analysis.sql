CREATE DATABASE Ass;
USE Ass;
CREATE TABLE employees (
emp_id INT NOT NULL,
emp_name VARCHAR(100),
dept_id INT NOT NULL,
salary DECIMAL(10, 2));
INSERT INTO employees (emp_id, emp_name, dept_id, salary)
VALUES
(1, 'Alice', 10, 60000),
(2, 'Bob', 20, 70000),
(3, 'Charlie', 30, 75000),
(4, 'David', 10, 65000),
(5, 'Eve', 40, 80000);
SELECT * FROM employees;

CREATE TABLE departments (
dept_id INT NOT NULL,
dept_name VARCHAR(100));
INSERT INTO departments (dept_id, dept_name)
VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT'),
(40, 'Admin'),
(50, 'Marketing');
SELECT * FROM DEPARTMENTS;

CREATE TABLE projects (
project_id INT NOT NULL,
emp_id INT NOT NULL,
project_name VARCHAR(100));
INSERT INTO projects (project_id, emp_id, project_name)
VALUES
(101, 1, 'Alpha'),
(102, 2, 'Beta'),
(103, 3, 'Gamma'),
(104, 4, 'Delta');
SELECT * FROM PROJECTS;

# 1. Write a query to get Employee and Department details using join. 
SELECT e.emp_id, e.emp_name,d.dept_id, e.salary, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

# 2. Write a query to retrieve all employees with their departments, even if the department is missing.
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

# 3. Write a query to get department details even if there are no employees in that department. 
SELECT e.emp_id, e.emp_name, d.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

# 4. Write a query to get all employees and departments, whether matched or not. 
SELECT 
    e.emp_id AS Employee_ID, 
    e.emp_name AS Employee_Name, 
    e.salary AS Salary, 
    e.dept_id AS Employee_Dept_ID, 
    d.dept_id AS Department_ID, 
    d.dept_name AS Department_Name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
UNION SELECT 
    e.emp_id AS Employee_ID, 
    e.emp_name AS Employee_Name, 
    e.salary AS Salary, 
    e.dept_id AS Employee_Dept_ID, 
    d.dept_id AS Department_ID, 
    d.dept_name AS Department_Name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

# 5. JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information. 
SELECT e.emp_id, e.emp_name, e.salary, d.dept_id, d.dept_name, p.project_id, p.project_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN projects p ON e.emp_id = p.emp_id;


# 6. Find employees who are not assigned to any projects.
SELECT e.emp_id, e.emp_name, e.dept_id
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

# 7. Find departments with no employees using a RIGHT JOIN. 
SELECT d.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

# 8. Write a query to get Employee and Department details using join with aliases. 
Select *
from employees e
right join departments d
on e.dept_id = d.dept_id;

# 9. Write a query to find employees in the same department as other employees. 
select e.emp_name , d.emp_name
from employees e 
join employees d
on e.dept_id = d.dept_id
where e.emp_name != d.emp_name;

# 10. Write a query to find projects managed by employees in the 'IT' department.
SELECT p.project_id, p.project_name, e.emp_id, e.emp_name, d.dept_name
FROM projects p
JOIN employees e ON p.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

# 11. Write a query to show employees and their project information (even if not assigned to a project). 
SELECT e.emp_id, e.emp_name, e.salary, p.project_id, p.project_name
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id;

# 12. Find employees who work in departments with names starting with 'A'.
select e.emp_name , d.dept_name
from employees e
join departments d
on e.dept_id = d.dept_id
where e.emp_name like 'A%';

# 13. Find the total number of employees in each department using GROUP BY and JOIN. 
SELECT d.dept_id, d.dept_name, COUNT(e.emp_id) AS "Total Employees"
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name;

# 14. Get the list of departments with more than one employee.
SELECT d.dept_id, d.dept_name, COUNT(e.emp_id) AS "Total Employees"
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) > 1;

























