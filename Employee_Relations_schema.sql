-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/A705dC
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.



CREATE TABLE titles (
    title_id varchar   NOT NULL,
    title varchar   NOT NULL,
    	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title varchar   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar   NOT NULL,
    hire_date date   NOT NULL,
    	PRIMARY KEY (emp_no),
		foreign key (emp_title) references titles(title_id)
);

CREATE TABLE departments (
    dept_no varchar   NOT NULL,
    dept_name varchar   NOT NULL,
    	PRIMARY KEY (dept_no)
);

CREATE TABLE department_employees (
    emp_no int   NOT NULL,
    dept_no varchar   NOT NULL,
		foreign key (emp_no) references employees(emp_no),
		foreign key (dept_no) references departments(dept_no)
);

CREATE TABLE department_manager (
    dept_no varchar   NOT NULL,
    emp_no int   NOT NULL,
		foreign key (emp_no) references employees(emp_no),
		foreign key (dept_no) references departments(dept_no) 
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
		foreign key (emp_no) references employees(emp_no)
);
