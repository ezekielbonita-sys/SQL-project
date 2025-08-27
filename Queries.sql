SQL PRACTICE PROJECT: EMPLOYEE DATABASE
   This file contains sample queries showcasing my SQL learning journey from Basics to advanced (joins, subqueries, window functions).

1. BASIC QUERIES
- view all employees
SELECT * FROM employees;

- Select specific columns
SELECT first_name, last_name, department, salary
FROM employees;

-Filter employees earning more than 60000
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 60000;

-Sort employees by highest salary
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

2. AGGREGATIONS & GROUP BY
-Average salary per department
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-Total number of employees per department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

- Departments with average salary greater than 70000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;

3. JOINS
-Inner join: employees with their managers
SELECT e.first_name AS employee, m.first_name AS manager
FROM employees
INNER JOIN employees m ON e.manager_id = m.employee_id;

-Left join: all employees and their managers (if any)
SELECT e.first_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

4. SUBQUERIES
- Employees earning above the company average
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

- Employees in departments with max salary above 80000
SELECT first_name, last_name, department, salary
FROM employees
WHERE department IN (SELECT department 
                     FROM employees
                     GROUP BY department
                     HAVING MAX(salary) > 80000);

5. WINDOW FUNCTIONS
-Rank employees by salary witin their department
SELECT first_name, last_name, department, salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_ranK
FROM employees;

- Running total of salaries by department
SELECT department, first_name, last_name, salary,
          SUM(salary) OVER (PARTITION BY department ORDER BY salary) AS running_totals 
FROM employees;

- Top 3 highest earners overall
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
