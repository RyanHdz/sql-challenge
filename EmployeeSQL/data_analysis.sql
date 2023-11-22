--emp number, last name, first name, sex,  and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--first name, last name, and hire date in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--manager of each dept, dept number, dept name, emp number, last name, and first name
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

--dept. number for each emp, emp number, last name, first name, and dept. name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

--first name, last name, sex of each employee named Hercules & whose last name begins with letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--each emp in sales dept., emp number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--each emp in sales & development dept., emp number, last name, first name, and dept. name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--frequency counts in descending order of all employees last names that each share last name
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

