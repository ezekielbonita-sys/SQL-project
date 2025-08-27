# SQL Practice Project: Employee Database

This project demostrates my learning journey in SQL, covering a wide range of topics from basic queries to advanced window functions. It is designed as a hands-on portfolio piece showcasing pratical applications of SQL concepts.

## Topics Covered
- Basic SELECT statements
- Filtering with WHERE
- Aggregate functions (SUM, AVG, COUNT)
- GROUP BY and HAVING
- Joins (INNER, LEFT, RIGHT)
- Subqueries (single-value, list, correlated)
- Window functions (ROW_NUMBER, RANK, DENSE_RANK)

## Project Overview
The project uses a **mock employee dataset** ('employees.csv') to practice SQL queries. The dataset includes:
- Employee ID
- First and Last Name
- Department
- Job Title
- Salary
- Hire Date

## Key Queries and Learning Highlights:
1. **Basic SELECT**
    '''sql
SELECT first_name, last_name, department, salary
FROM employees;

2. Aggregate Functions: **Average salary by department**
    '''sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY departments;

3. Subqueries: **Employees earning above their department average**
    '''sql
SELECT first_name, last_name, department, salary
FROM employee e
WHERE salary > (SELECT AVG(salary)
                FROM employees
                WHERE department = e.department);

4. Window Functions: **Rank employees by salary in each department**
     '''sql
SELECT first_name, last_name, department, salary,
                              RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

**Top 3 highest earners overall**
   '''sql
SELECT first_name, last_name, department, salary
FROM (SELECT first_name, last_name, department, salary,
                                                 ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees) ranked
WHERE row_num <= 3;
