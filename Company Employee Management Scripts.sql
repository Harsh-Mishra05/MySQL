CREATE DATABASE company;
USE company;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10,2),
    date_of_joining DATE);

INSERT INTO employees (name, position, salary, date_of_joining)
VALUES 
("John Doe", "Manager", 55000.00, "2020-01-15"),
("Jane Smith", "Developer", 48000.00, "2019-07-10"),
("Alice Johnson", "Designer", 45000.00, "2021-03-22"),
("Bob Brown", "Developer", 50000.00, "2018-11-01");

SELECT * FROM employees WHERE position = "Developer";

set sql_safe_updates=0;
update employees
SET salary = 46000.00 WHERE name = "Alice Johnson";

DELETE FROM employees WHERE name = "Bob Brown";

SELECT * FROM employees WHERE salary > 48000;

ALTER TABLE employees ADD COLUMN email VARCHAR(100);

UPDATE employees SET email = "john.doe@company.com" WHERE name = "John Doe";

SELECT name, salary FROM employees;

SELECT COUNT(*) FROM employees WHERE date_of_joining > "2020-01-01";

SELECT * FROM employees ORDER BY salary DESC;

ALTER TABLE employees DROP COLUMN email;

SELECT * FROM employees ORDER BY salary DESC LIMIT 1;




