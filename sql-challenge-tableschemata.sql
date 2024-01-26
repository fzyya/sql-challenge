/*
Data Engineering (70 Points)
-----------------------------
All required columns are defined for each table (10 points)
Columns are set to the correct data type (10 points)
Primary Keys set for each table (10 points)
Correctly references related tables (10 points)
Tables are correctly related using Foreign Keys (10 points)
Correctly uses NOT NULL condition on necessary columns (10 points)
Accurately defines value length for columns (10 points)

*/

--Generate Tables

CREATE TABLE IF NOT EXISTS departments ( 
dept_no CHAR(10) NOT NULL PRIMARY KEY,
dept_name CHAR(50)
);

CREATE TABLE IF NOT EXISTS titles ( 
title_id CHAR(10) NOT NULL PRIMARY KEY,
title CHAR(30)
);

CREATE TABLE IF NOT EXISTS employees ( 
emp_no INT NOT NULL PRIMARY KEY,
emp_title_id CHAR(10) ,
birth_date DATE ,
first_name CHAR(30)  ,
last_name CHAR(30)  ,
sex NCHAR,
hire_date DATE,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE IF NOT EXISTS salaries ( 
emp_no INT NOT NULL,
PRIMARY KEY (emp_no),
salary MONEY,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_manager ( 
dept_no CHAR(10) NOT NULL,
emp_no INT NOT NULL,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emp ( 
emp_no INT NOT NULL,
dept_no CHAR(20) NOT NULL,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Import data for each table above
--View each table to ensure all data has been imported correctly
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;