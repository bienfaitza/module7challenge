--
select 
e.emp_no,e.first_name,e.last_name,
t.title,t.from_date,t.to_date

into retirement_titles
	from employees e --HERE I USE ALIASES FOR TABLE NAMES e for employee and t for titles--
	inner join titles t
	on e.emp_no=t.emp_no 
	where extract(year from e.birth_date) between '1952' and '1955'
	
	 
--select*from retirement_titles

--THIS LINE IS FOR EXPORTING THE RETIREMENT_TITLES TABLE
copy retirement_titles to '/Users/bienfait/Desktop/challenge7/data_folder/retirement_titles.csv' delimiter ',' CSV HEADER;

--9

select emp_no,first_name,last_name,title from retirement_titles;

--10 USE OF DISTINCT

select distinct on(emp_no)emp_no,first_name,last_name,title

INTO unique_retirement_titles
from retirement_titles
ORDER BY emp_no, first_name DESC;

--11

select*From retirement_titles where to_date='9999-01-01';

--12
select distinct on(emp_no) emp_no,first_name,last_name,title
into unique_titles
from retirement_titles order by emp_no asc,to_date desc

--14
copy unique_titles to '/Users/bienfait/Desktop/challenge7/data_folder/unique_titles.csv' delimiter ',' CSV HEADER;


--16

selecT*from employees

where extract(year from birth_date) between '1952' and '1955'


selecT distinct(title) into unique_titles from titles

selecT*From titles

--19
selecT count(emp_no) as count,title
into retiring_titles
from titles
where to_date='9999-01-01' 
and 
emp_no in(select e.emp_no from employees e where  extract(year from e.birth_date) between '1952' and '1955')
group by title

--20
copy retiring_titles to '/Users/bienfait/Desktop/challenge7/data_folder/retiring_titles.csv' delimiter ',' CSV HEADER;

--DELIVERABLE 2

select distinct on(e.emp_no)e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date,title
into mentorship_eligibilty
from employees e,dept_emp d,titles t
where e.emp_no=d.emp_no and e.emp_no=t.emp_no and e.emp_no=t.emp_no
and d.to_date='9999-01-01' and e.birth_date between '1965-01-01' and '1965-12-31' order by e.emp_no;

 

copy mentorship_eligibilty to '/Users/bienfait/Desktop/challenge7/data_folder/mentorship_eligibilty.csv' delimiter ',' CSV HEADER;


