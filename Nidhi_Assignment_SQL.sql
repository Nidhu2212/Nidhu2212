SELECT * FROM hr.departments;

29/1'Display all information in the tables EMP and DEPT.' 
select *
from employees, departments;

29/2:'Display only the hire date and employee name for each employee.'
select first_name,last_name, hire_date
from employees;

29/3 'Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title'
select concat(first_name, ",","   ", job_id) as EMPLOYEE
from employees;

29/4'Display the hire date, name and department number for all clerks'
SELECT first_name, last_name, hire_date , job_id , department_id
from employees 
where  job_id like "%_clerk";

29/5'Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT'
select concat(employee_id, ",", manager_id,",", phone_number) as OUTPUT
FROM employees;

29/6'Display the names and salaries of all employees with a salary greater than 2000'
select first_name, last_name, salary
from employees
where salary > 2000;

29/7 'Display the names and dates of employees with the column headers "Name" and "Start Date"'
select concat(first_name," ", last_name) as NAME, employee_id, start_date
from employees join job_history using (employee_id);

29/8 'Display the names and hire dates of all employees in the order they were hired'
select concat(first_name," ", last_name) as NAME, concat(hire_date) as DATE
from employees
order by date asc;

29/9 'Display the names and salaries of all employees in reverse salary order'
select concat(first_name, " ", last_name) as NAME, concat(hire_date) as DATE
from employees
order by date desc;

29/10 Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.'
Select first_name, department_id, commission_pct 
from employees
where reverse(salary)
and commission_pct is not null;

29/11 ' Display the last name and job title of all employees who do not have a manager'
select last_name, job_title, manager_id
from employees join jobs using (job_id)
where manager_id is null;

29/12 'Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000'
select last_name, job_title, salary
from jobs join employees using (job_id)
where job_title like "%sales_representative" 
and salary not in (2500,3500,5000);

select last_name, job_title, salary
from jobs join employees using (job_id)
where job_title like "%stock_clerk" 
and salary not in (2500,3500,5000);


 page 30;
30/1  'Display the maximum, minimum and average salary and commission earned'
select max(salary), min(salary), avg(salary),max(commission_pct), min(commission_pct), avg(commission_pct)
from employees;

30/2 'Display the department number, total salary payout and total commission payout for each department.' 
select department_id, sum(salary), sum(commission_pct)
from employees
group by department_id;

30/3 'Display the department number and number of employees in each department'.
select department_id, count(*)
from employees 
group by department_id having count(*);

select concat(first_name, " ", last_name) as NAME, employee_id, commission_pct
from employees
where commission_pct is not null;

30/4 'Display the department number and total salary of employees in each department'
select department_id, count(*), sum(salary)
from employees 
group by department_id;

30/5 'Display the employee's name who doesn't earn a commission. Order the result set without using the column name'
select concat(first_name," ", last_name) as NAME, commission_pct
from employees
where commission_pct is null;

30/6 'Display the employees name, department id and commission. If an Employee doesnt earn the commission, then display as No commission. Name the columns appropriately'
select concat(first_name," ", last_name) as NAME,department_id, commission_pct,
case
when commission_pct is null then "No Commission" else Commission_pct
end "appropriately"
from employees;

30/7 'Display the employees name, salary and commission multiplied by 2.
If an Employee doesnt earn the commission, then display as No commission. Name the columns appropriately'
select concat(first_name," ", last_name)"Name", salary,commission_pct,
case
when commission_pct is null then "No Commission" else salary*2
end "appropriately"
from employees;

30/8 'display employee name department id who have the first name same as another employee in the same department'
select first_name,department_id
from employees
group by first_name,department_id having count(first_name)>1;

30/9 'Display the sum of salaries of the employees working under each Manager'
select manager_id, sum(salary)
from employees
group by manager_id;

30/10 'Select the Managers name, the count of employees working under and the department ID of the manager'

select m.employee_id, m.first_name, m.last_name, count(e.manager_id)
from employees as e join employees as m
on e.manager_id = m.employee_id
group by m.employee_id;

30/11) 'Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter a'
select m.last_name "MANAGER NAME", e.last_name"EMPLOYEE NAME", m.department_id, m.salary
from employees as e join employees as m on e.manager_id=m.employee_id
where m.last_name like "_a%" and e.last_name like "_a%";

30/12) 'Display the average of sum of the salaries and group the result with the department id. Order the result with the department id'
select sum(salary), avg(salary), department_id
from employees
group by department_id;

30/13) 'Select the maximum salary of each department along with the department id'
select MAX(salary), department_id
from employees
group by department_id;

30/14) 'Display the commission, if not null display 10% of salary, if null display a default value 1'
select commission_pct,
case
when commission_pct>0 then "10%"*salary
when commission_pct is null then "1"
end
from employees
order by commission_pct;

 page:31
31/1. 'Write a query that displays the employees last names only from the strings 2-5th position with the first letter
 capitalized and all other letters lowercase, Give each column an appropriate label.'
 

31/2. 'Write a query that displays the employees first name and last name along with a  in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined.'
select concat( first_name ,"  ", last_name) as NAME , monthname(start_date) as MONTH
from employees join job_history using (employee_id);

31/3. 'Write a query to display the employees last name and if half of the salary is greater than ten thousand then increase
 the salary by 10% else by 11.5% along with the bonus amount of 1500 each.Provide each column an appropriate label.'
select last_name,salary,
case
when  salary/2>10000 then salary*"10%"
when salary*"11.5%" then salary+"1500"
end
"increase"
from employees;

31/4. 'Display the employee ID by Appending two zeros after 2nd digit and E in the end, department id, salary and 
the manager name all in Upper case, if the Manager name consists of Z replace it with $!'
select concat(substring(e.employee_id,1,2), substring(e.employee_id,3),"E") 
as "EMPLOYEE ID", e.department_id,e.salary, replace(m.last_name,"Z","$")"REPLACED NAMES"
from employees as e join employees as m on e.manager_id=m.employee_id;

31/5. 'Write a query that displays the employees last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees last names'


31/6 'Create a query to display the last name and salary for all employees.Format the salary 
to be 15 characters long, left-padded with $.Label the column SALARY'
SELECT last_name,lpad(CONCAT('$', salary), 15, '$') as SALARY
FROM employees;

31/7. 'Display the employees name if it is a palindrome'
select first_name,
case
when first_name = reverse(first_name) then "palindrome" else "not palindrome"
end as palindrome
from employees;

31/8. 'Display First names of all employees with initcaps.'
select concat(upper( substring(first_name,1,1)), lower(substring(first_name,2))) as NAME
from employees;

31/9. 'From LOCATIONS table, extract the word between first and second space from the
STREET ADDRESS column.'
select substring_index(substring_index(street_address," ",2)," ",-1) as "STREET ADDRESS"
from locations;

31/10. 'Extract first letter from First Name column and append it with the Last Name. Also add"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name.'
select first_name, concat(Upper(substring(first_name,1,1)), lower(last_name), "@systechusa.com") as "E-MAIL ADDRESS"
from employees;

31/11. 'Display the names and job titles of all employees with the same job as Trenna.'
select first_name, job_title
from employees join jobs using (job_id)
where first_name like "%trenna";

31/12. 'Display the names and department name of all employees working in the same city as Trenna.'
select first_name, department_name, city
from employees join departments join locations;

31/13. 'Display the name of the employee whose salary is the lowest.'
select first_name, salary
from employees
order by salary
limit 1;

31/14. 'Display the names of all employees except the lowest paid.'
select first_name, salary
from employees
order by salary desc ;

 page:32;
32/1. 'Write a query to display the last name, department number, department name for all employees.'
select last_name, department_id, department_name
from employees join departments using(department_id);

32/2. 'Create a unique list of all jobs that are in department 40. Include the location of the department in the output.'
select distinct(job_id), department_id, location_id
from departments join locations using (location_id) join jobs 
where department_id = 40;

32/3.' Write a query to display the employee last name,department name,location id and city of all employees who earn commission.'
select last_name, department_name, location_id, city, commission_pct
from employees join departments using (department_id) join locations using (location_id)
where commission_pct is not null;

32/4. 'Display the employee last name and department name of all employees who have an 'a' in their last name'
select last_name, department_name
from employees join departments
where last_name like "%a%";

32/5. 'Write a query to display the last name,job,department number and department name for
all employees who work in INDIA AND  CANADA'
select last_name, job_id, department_name, country_name
from employees join departments using (department_id) join locations using (location_id) join countries
where country_name like "INDIA";
select last_name, job_id, department_name, country_name
from employees join departments using (department_id) join locations using (location_id) join countries
where country_name like "CANADA";

32/6. 'Display the employee last name and employee number along with their manager s last name and manager number.'
select e.employee_id, e.last_name, m.employee_id, m.last_name "MANAGER LAST NAME"
from employees as e join employees as m on e.manager_id=m.employee_id;

32/7. 'Display the employee last name and employee number along with their managers last
name and manager number (including the employees who have no manager).'
select e.employee_id, e.last_name , m.employee_id, m.last_name as "MANAGER LAST NAME"
from employees as e left join employees as m on e.manager_id=m.employee_id;

32/8. 'Create a query that displays employees last name,department number,and all the
employees who work in the same department as a given employee. HALL'
Select last_name, department_id, department_name
from employees join departments using (department_id);

32/9. 'Create a query that displays the name,job,department name,salary,grade for all
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)'
select first_name, job_id, department_name, salary,
case
when salary >= 5000 then "A"
when salary >=3000 then "B"
when salary < 3000 then "C"
end as GRADE
from employees join departments using (department_id);

32/10. 'Display the names and hire date for all employees who were hired before their
managers along withe their manager names and hire date. Label the columns as Employee
name, emp_hire_date,manager name,man_hire_date'
select E.first_name as "EMPLOYEE NAME", E.hire_date , M.first_name as "MANGER NAME", M.hire_date 
from employees as E join employees as M on E.manager_id=M.employee_id
where E.hire_date < M.hire_date;

 page: 34;
34/1 'Write a query to display the last name and hire date of any employee in the same department as SALES'
select last_name, hire_date, department_name
from employees join departments using (department_id)
where department_name like "SALES";

34/2.'Create a query to display the employee numbers and last names of all employees who
earn more than the average salary. Sort the results in ascending order of salary.'
select employee_id, last_name, avg(salary)
from employees
where salary > (select avg(salary) from employees)
group by employee_id
order by salary asc;

34/3. 'Write a query that displays the employee numbers and last names of all employees who
work in a department with any employee whose last name contains a U'
select  distinct(department_id), last_name, employee_id
from employees join departments using (department_id)
where last_name like "%u%";

34/4. 'Display the last name, department number, and job ID of all employees whose department location is CANADA.'
select last_name, department_id, job_id, department_name, country_id, country_name
from employees join departments using (department_id) join locations using (location_id) join countries using(country_id)
where country_name like "%CANADA";

34/5. 'Display the last name and salary of every employee who reports to FILLMORE.'
select m.last_name as "MANAGER NAME",  e.salary, e.last_name as "EMPLOYEE NAME"
from employees as e join employees as m on e.manager_id=m.employee_id
where m.last_name like "KING";

34/6. 'Display the department number, last name, and job ID for every employee in the IT department'.
select last_name, department_id, job_id, department_name
from employees join departments using (department_id)
where department_name like "IT";

34/7. 'Modify the above query to display the employee numbers, last names, and salaries of all
employees who earn more than the average salary and who work in a department with any employee with a U in their name.'
select distinct(department_id) employee_id, last_name ,salary
from employees 
where salary < (select avg(salary) from employees) and last_name like "%U%";

34/8. 'Display the names of all employees whose job title is the same as anyone in the sales dept.'
select concat( first_name,"  ",last_name) as NAME, job_title
from employees join jobs using (job_id)
where job_title like "%sales%";

34/9. 'Write a compound query to produce a list of employees showing raise percentages,
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
given a 15% raise, and employees in department 6 are not given a raise.'
select employee_id, salary, department_id,
case
when department_id = 10  then salary*"5%"
when department_id = 30 then salary*"5%"
when department_id = 20 then salary*"10%"
when department_id = 40 then salary*"15%"
when department_id = 50 then salary*"15%"
when department_id=60 then salary*1
end
as RAISE
from employees;

34/10'Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.'
select last_name, salary
from employees
limit 3;

34/11.'Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column'
select  concat(first_name,"  ",last_name) as NAME, salary, 
case
when commission_pct is null then "NULL"
end
"COMMISSION"
from employees;

34/12'.Display the Managers (name) with top three salaries along with their salaries and
department information.'
select m.first_name , m.salary, dense_rank()over(order by salary desc) as "RANK" , m.department_id
from employees as e join employees as m on e.manager_id=m.employee_id
group by m.employee_id
limit 3;
