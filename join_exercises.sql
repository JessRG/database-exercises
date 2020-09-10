USE employees;

SELECT * FROM dept_manager;

# write a query that shows each department along with the name of the
# current manager for that department.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name,' ', e.last_name) AS 'Manager Name'
FROM employees as e
    JOIN dept_manager AS dm
        ON e.emp_no = dm.emp_no
    JOIN departments as d
        ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

# Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name,' ', e.last_name) AS 'Manager Name'
FROM employees as e
         JOIN dept_manager AS dm
              ON e.emp_no = dm.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY d.dept_name;

# Find the current titles of employees currently working
# in the Customer Service department.
SELECT t.title, COUNT(*) AS Count
FROM titles AS t
    JOIN dept_emp AS de
        ON de.emp_no = t.emp_no
    JOIN departments as d
        ON d.dept_no = de.dept_no
WHERE t.to_date LIKE '9999%'
  AND de.to_date LIKE '9999%'
  AND d.dept_name = 'Customer Service'
GROUP BY t.title
ORDER BY t.title;

# Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name,' ', e.last_name) AS 'Name',
       s.salary AS Salary
FROM employees AS e
    JOIN salaries AS s
        ON e.emp_no = s.emp_no
    JOIN dept_manager AS dm
        ON e.emp_no = dm.emp_no
    JOIN departments as d
        ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

# Bonus
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
       d.dept_name AS 'Department Name',
       CONCAT(e2.first_name, ' ', e2.last_name) AS 'Manager Name'
FROM employees AS e
    JOIN dept_emp AS de
        ON e.emp_no = de.emp_no
    JOIN departments AS d
        ON de.dept_no = d.dept_no
    JOIN dept_manager AS dm
        ON d.dept_no = dm.dept_no
    JOIN employees AS e2
        ON e2.emp_no = dm.emp_no
WHERE de.to_date LIKE '9999%'
    AND dm.to_date LIKE '9999%'
ORDER BY d.dept_name;
