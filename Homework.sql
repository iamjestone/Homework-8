--query.sql
--One
--
select employees.employee, employees.last_name, employees.first_name, employees.gender,salary.salary
from employees
left JOIN salary
ON salary.employee=employees.employee;


--Two
--Simple request for employees hired in 1986
select * from employees
where hire_date between '01/01/1986' and '12/31/1986';


--Three

CREATE VIEW managers AS
SELECT dept_manager.dept_no,departments.dept_name,dept_manager.employee,employees.last_name,employees.first_name,dept_manager.from_date, dept_manager.to_date
FROM dept_manager
INNER JOIN employees ON (employees.employee = dept_manager.employee)
inner join departments on (departments.dept_no=dept_manager.dept_no);


--Four

CREATE VIEW employee AS
SELECT employees.employee,employees.first_name,employees.last_name,departments.dept_name,dept_emp.dept_no
FROM employees
inner JOIN dept_emp ON (employees.employee = dept_emp.employee)
inner join departments on (departments.dept_no=dept_emp.dept_no);

--Five


select first_name, last_name from employees
where first_name = 'Hercules'
and last_name like 'B%';

--Six

select employee, last_name, first_name, dept_name from employee
where dept_name='Sales';

--Seven

select employee, last_name, first_name, dept_name from employee
where dept_name='Sales'
or dept_name='Development';

--Eight

select last_name, count(last_name) from employees
group by last_name 
order by count(last_name) desc;
