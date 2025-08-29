- Schema.sql
- This file creates the employees table and inserts sample data.
  CREATE TABLE employees (
        employee_id INT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        department VARCHAR(50) NOT NULL,
        salary DECIMAL(10, 2) NOT NULL,
        hire_date DATE NOT NULL
  );

- Insert sample data
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date)
VALUES (1, 'Alice', 'Johnson', 'IT', 75000, '2019-04-12'),
       (2, 'Bob', 'Smith', 'HR', 50000, '2020-01-15'),
       (3, 'Carol', 'Williams', 'Finance', 65000, '2018-07-23'),
       (4, 'David', 'Brown', 'Sales', 80000, '2017-03-19'),
       (5, 'Eva', 'Davis', 'IT', 72000, '2021-10-05'),
       (6, 'Frank', 'Miller', 'Finance', 55000, '2022-06-11'),
       (7, 'Grace', 'Wilson', 'Sales', 90000, '2016-11-02'),
       (8, 'Henry', 'Moore', 'HR', 48000, '2021-09-28'),
       (9, 'Ivy', 'Taylor', 'IT', 67000, '2019-08-16'),
       (10, 'Jack', 'Anderson', 'Finance', 62000, '2020-02-10')
