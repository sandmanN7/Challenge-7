-- Select columns from respective tables, create and join them
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO r_titles
FROM employees AS e
INNER JOIN titles AS ti
ON e.emp_no= ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
SELECT*FROM r_titles;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO Unique_Titles
FROM r_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM Unique_Titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON(e.emp_no=de.emp_no)
INNER JOIN titles as ti
ON(ti.emp_no=e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT*FROM mentorship_eligibility;