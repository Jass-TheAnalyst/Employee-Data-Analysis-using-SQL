select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;


/*Select the information from the “dept_no” column of the “departments” table.*/

select * from departments;
select dept_no from departments;

/*Select all data from the “departments” table.*/
select * from departments;

/*Select all people from the “employees” table whose first name is “Elvis”.*/
select * from employees;
select * from employees where first_name='Elvis';

/*Retrieve a list with all female employees whose first name is Kellie. */
select * from employees where first_name='Kellie' and gender='F';

/*Retrieve a list with all employees whose first name is either Kellie or Aruna.*/
select * from employees where first_name IN ('Kellie','Aruna');

/*Retrieve a list with all female employees whose first name is either Kellie or Aruna.*/
select * from employees where first_name IN ('Kellie','Aruna') and gender='F';

/*Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.*/
select * from employees where first_name IN ('Denis','Elvis');

/*Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.*/

select * from employees where first_name not IN ('John','Mark','Jacob');

/*Working with the “employees” table, use the LIKE operator to select the data about all individuals, 
whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.*/

select * from employees where first_name like 'Mark%';

/*Retrieve a list with all employees who have been hired in the year 2000.*/
select * from employees where year(hire_date)='2000';

/*Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. */
select * from employees where emp_no like '1000_';

/*Extract all individuals from the ‘employees’ table whose first name contains “Jack”.*/
select * from employees where first_name like '%Jack%';

/*Once you have done that, extract another list containing the names of employees that do not contain “Jack”.*/
select * from employees where first_name not like '%Jack%';

/*Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.*/
select * from salaries;
select * from salaries where salary between 66000 and 70000;

/*Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.*/
select * from employees where emp_no not between 10004 and 10012;

/*Select the names of all departments with numbers between ‘d003’ and ‘d006’.*/
select * from departments where dept_no between 'd003' and 'd006';

/*Select the names of all departments whose department number value is not null.*/
select dept_name from departments where dept_no IS NOT NUll;

/*Retrieve a list with data about all female employees who were hired in the year 2000 or after.*/
/*Hint: If you solve the task correctly, SQL should return 7 rows.*/
select * from employees where gender='F' and year(hire_date)>='2000';

/*Extract a list with all employees’ salaries higher than $150,000 per annum.*/
select * from salaries where salary>150000;

/*Obtain a list with all different “hire dates” from the “employees” table. */
select distinct(hire_date) from employees;

/*How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?*/
select count(salary) from salaries where salary >= 100000;

/*How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.*/
select count(emp_no) from titles where title='manager';

/*Select all data from the “employees” table, ordering it by “hire date” in descending order.*/
select * from employees order by hire_date desc;

/*Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
Lastly, sort the output by the first column.*/
select salary,count(emp_no) AS 'employees_with_same_salary'
from salaries group by salary
having salary>80000
order by salary;

/*Select all employees whose average salary is higher than $120,000 per annum.
Hint: You should obtain 101 records.*/
select *,avg(salary) from salaries 
group by emp_no
having avg(salary)>120000;

/*Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
Hint: To solve this exercise, use the “dept_emp” table.*/
select *,count(emp_no) from dept_emp 
where from_date>'2000-01-01'
group by emp_no
having count(emp_no)>1;

/*Select the first 100 rows from the ‘dept_emp’ table. */
select * from dept_emp
limit 100;
