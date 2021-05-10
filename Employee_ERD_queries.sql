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

-- Pulling information from tables --

-- Employee number, Name, sex, salary

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salaray
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

-- Name, hire date, employees hired in 1986 only

select employees.last_name, employees.first_name, employees.hire_date from employees
where (employees.hire_date >= '1986-1-1') and (employees.hire_date <= '1986-12-31');

-- Dept Manager, department number, department name, manager's employee number, and Name

select department_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from department_manager
inner join departments on department_manager.dept_no = departments.dept_no
inner join employees on department_manager.emp_no = employees.emp_no;

-- Employee number, Name, Department name --

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join department_employees on employees.emp_no = department_employees.emp_no
inner join departments on department_employees.dept_no = departments.dept_no;

-- Name and Sex where first name is "Hercules" and last name starts with "B" --

select employees.last_name, employees.first_name, employees.sex
from employees
where (employees.first_name = 'Hercules') and (employees.last_name like 'B%');

-- Name and department for all sales department employees --

select employees.emp_no,employees.last_name, employees.first_name, departments.dept_name
from employees
inner join department_employees on employees.emp_no = department_employees.emp_no
inner join departments on department_employees.dept_no = departments.dept_no
where departments.dept_no = 'd007';

-- Name and department for all sales and development department employees --

select employees.emp_no,employees.last_name, employees.first_name, departments.dept_name
from employees
inner join department_employees on employees.emp_no = department_employees.emp_no
inner join departments on department_employees.dept_no = departments.dept_no
where departments.dept_no = 'd007' or departments.dept_no = 'd005';

-- frequency of last names in descending order --

select employees.last_name, count(employees.last_name)
from employees
group by employees.last_name
order by count(employees.last_name) desc;




