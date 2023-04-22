select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;

/*How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.*/
select count(distinct dept_no) from departments;

/*What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?*/
select sum(salary) AS Total_Amount_of_Money from salaries
where from_date>'1997-01-01';

/*1. Which is the lowest employee number in the database?*/
select min(emp_no) from employees;

/*2. Which is the highest employee number in the database?*/
select max(emp_no) from employees;

/*What is the average annual salary paid to employees who started after the 1st of January 1997?*/
select avg(salary) from salaries where from_date>'1997-01-01';

/*Round the average amount of money spent on salaries for all contracts that 
started after the 1st of January 1997 to a precision of cents.*/

select round(sum(salary),2) AS Total_Amount_of_Money from salaries
where from_date>'1997-01-01';

/*Select the department number and name from the ‘departments_dup’ table and add a third column 
where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’.*/

select *,coalesce(dept_no,dept_name) as dept_info from departments order by dept_no;

/*Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function 
to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, 
and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.*/

select ifnull(dept_no,'N/A') as dept_no,
ifnull(dept_name,'Department name not provided') as dept_name from departments 
order by dept_no;
