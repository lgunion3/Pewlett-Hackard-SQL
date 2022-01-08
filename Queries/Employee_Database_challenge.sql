DROP TABLE retiring_titles, unique_titles

SELECT em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY em.emp_no

--Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rtm.emp_no)emp_no,
rtm.first_name,
rtm.last_name,
rtm.title
INTO unique_titles	
FROM retirement_titles as rtm
ORDER BY rtm.emp_no ASC, rtm.to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT (ut.title),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT (ut.title) DESC;

SELECT DISTINCT ON (em.emp_no)em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as em
INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' AND
em.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no ASC;

-- DELV 3 SUMMARY COD
DROP TABLE mentorship_eligibilty_mod

SELECT DISTINCT ON (em.emp_no)em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty_mod
FROM employees as em
INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' AND
em.birth_date BETWEEN '1960-01-01' AND '1965-12-31'
ORDER BY emp_no ASC;

SELECT COUNT(emp_no) FROM mentorship_eligibilty_mod