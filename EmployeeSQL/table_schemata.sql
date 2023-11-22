-- Table: public.departments
-- Stores department data
CREATE TABLE IF NOT EXISTS public.departments (
    dept_no   VARCHAR(30) PRIMARY KEY, 
    dept_name VARCHAR(30) NOT NULL
);
SELECT * FROM public.departments;

-- Table: public.dept_emp
-- Stores employee department data
CREATE TABLE IF NOT EXISTS public.dept_emp (
    emp_no  VARCHAR(30),
    dept_no VARCHAR(30),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES public.employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES public.departments (dept_no)
);
SELECT * FROM public.dept_emp;

-- Table: public.dept_manager
-- Stores department manager data
CREATE TABLE IF NOT EXISTS public.dept_manager (
    dept_no VARCHAR(30),
    emp_no  VARCHAR(30),
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES public.employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES public.departments (dept_no)
);
SELECT * FROM public.dept_manager;

-- Table: public.employees
-- Stores employee data
CREATE TABLE IF NOT EXISTS public.employees (
    emp_no     VARCHAR(30) PRIMARY KEY,
    emp_title  VARCHAR(30),
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name  VARCHAR(30) NOT NULL,
    sex        CHAR(1) CHECK (sex IN ('M', 'F')),
    hire_date  DATE NOT NULL
);
SELECT * FROM public.employees;

-- Table: public.salaries
-- Stores employee salary data
CREATE TABLE IF NOT EXISTS public.salaries (
    emp_no  VARCHAR(30),
    salary  INTEGER CHECK (salary > 0),
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES public.employees (emp_no)
);
SELECT * FROM public.salaries;

-- Table: public.titles
-- Stores job title data
CREATE TABLE IF NOT EXISTS public.titles (
    title_id VARCHAR(30),
    title    VARCHAR(30),
    PRIMARY KEY (title_id)
);
SELECT * FROM public.titles;
