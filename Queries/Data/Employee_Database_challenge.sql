-- Challenge Deliverable 1
SELECT e.emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti 
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- employees about to reitre by job title
SELECT title, COUNT (title)
INTO retiring_titles
from unique_titles
GROUP BY title
ORDER BY title DESC;


-- Deliverable 2 Mentorship Eligibility
-- SELECT DISTINCT ON (emp_no) e.emp_no, first_name, last_name, birth_date, from_date, to_date, --title
-- INTO mentorship_eligibility
-- from employees as e
-- INNER JOIN dept_emp as de
-- ON (e.emp_no = de.emp_no)
-- WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
--     AND (de.to_date = '9999-01-01')
-- ORDER BY e.emp_no;

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
from employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

-- Summary: Two more queries/tables 
-- count number of retirees per year
-- Compare to number of mentorship eligible employees


-- Silver tsumani
SELECT COUNT(DISTINCT e.emp_no) -- first_name, last_name, title, ti.from_date, ti.to_date
--INTO retirement_tsunami
FROM employees as e
INNER JOIN titles as ti 
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1956-01-01' AND '1960-12-31')
    AND (ti.to_date = '9999-01-01')
--ORDER BY e.emp_no;

