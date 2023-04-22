select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager where emp_no=110022;
select * from salaries;
select * from titles;

/*Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. */

select e.emp_no,e.first_name,e.last_name,dm.dept_no,e.hire_date 
from employees as e
inner join 
dept_manager as dm
ON
e.emp_no=dm.emp_no;

/*Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
See if the output contains a manager with that name.  
‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.*/

select e.emp_no,e.first_name,e.last_name,dm.dept_no,dm.from_date  from employees as e
left join 
dept_manager AS dm
ON e.emp_no=dm.emp_no
where e.last_name='Markovitch'
order by dm.dept_no desc,e.emp_no desc;

/*Extract a list containing information about all managers’ employee number, first and last name, 
department number, and hire date. Use the old type of join syntax to obtain the result.*/
/*Old style*/

select e.emp_no,e.first_name,e.last_name,e.hire_date ,dm.dept_no from employees as e
 inner join
dept_manager as dm
on e.emp_no=dm.emp_no
order by dept_no desc,emp_no desc;

/*Select the first and last name, the hire date, 
and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.*/

select e.first_name,e.last_name,e.hire_date,t.title 
from employees as e
inner join 
titles as t
on e.emp_no=t.emp_no
where e.first_name='Margareta' and last_name='Markovitch';

/*cross join with Department Manager and Departments to see possible combination*/

select dm.emp_no,d.dept_name from departments AS d
cross join
dept_manager AS dm;

/*cross join with Department Manager and Departments to see possible combination
but except for the department he/she already in*/
select dm.emp_no,d.dept_name from departments AS d
cross join
dept_manager AS dm
WHERE dm.dept_no <> d.dept_no
;

/*Use a CROSS JOIN to return a list with all possible combinations between managers 
from the dept_manager table and department number 9.*/
select dm.*,d.*
 from departments 
 AS d
cross join
dept_manager 
AS dm
WHERE d.dept_no='d009';

/*Return a list with the first 10 employees with all the departments they can be assigned to.*/

select e.*,d.* from employees
cross join
departments
where employees.emp_no<=10010;

/*t.title,t.from_date as start_date*/
/*Select all managers’ first and last name, hire date, job title, start date, and department name.*/

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.from_date AS start_date,
    t.title,
    dm.dept_no
FROM
    employees e
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    t.title = 'Manager';


/*How many male and how many female managers do we have in the ‘employees’ database?*/

select gender,count(*) from
(
select e.emp_no,t.title,e.gender from employees e
inner join titles t
on
e.emp_no=t.emp_no
where t.title='Manager'
) as all_managers
group by gender;

-- Second method

SELECT e.gender, COUNT(e.gender) AS total_managers
FROM employe0es e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender;


/*Average salary of employees by each department */

select de.dept_no,avg(s.salary) as avg_salary from employees e
inner join salaries s
on e.emp_no=s.emp_no
inner join dept_emp de
on de.emp_no=e.emp_no
group by de.dept_no
order by dept_no;

-- Second way
SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON s.emp_no = de.emp_no
GROUP BY d.dept_no
ORDER BY 2 DESC;

