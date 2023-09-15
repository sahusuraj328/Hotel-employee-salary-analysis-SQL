use myproject;
show tables;
----- 1 show all columns and rows from table ---------
select * from salaries;

-------- 2 show only employeename and job toitle----------
select EmployeeName,JobTitle from salaries;

-------- 3 show the number of employees from table-------
select count(EmployeeName) from salaries;

----- 4 to count all rows in table---------
select count(*) from salaries;

--  5 show unique jobtitle in the table --------
select distinct JobTitle from salaries;

                -- 6 count unique jobtitles from table--------
select count(distinct JobTitle) from salaries;

-- 7 show the job title and overtime pay for all the employees with overtime pay greater than 50000.

select JobTitle , OvertimePay from salaries
where OvertimePay>50000;

-- 8 show the average base pay of all the employees as Average base pay.
select avg( BasePay) as Average_Base_pay from salaries;

-- 9 show the Top 10 highest paid employee.----------------
select EmployeeName,TotalPay from salaries
order by TotalPay desc limit 10;

-- 10 average of basepay , overtime pay and other pay for each employee. ---
select EmployeeName, (BasePay+OvertimePay+OtherPay)/3 as avg_pay from salaries;

-- 11 show all the employee who have "manager" in their title. ---
select * from salaries
where JobTitle like '%Manager%' ;

-- 12 show all the employees with a job title not equal to 'manager' ----
select * from salaries
where JobTitle !='Manager';

-- 13 show all employees with a total pay between 50000 and 75000 ----
select * from salaries
where TotalPay between 200000 and 550000;

-- 14 show all employees with basepay less than 50000  or/and a total pay greater than 1 LAKH -----

select * from salaries
where BasePay <50000 or TotalPay>100000;

select * from salaries
where BasePay <50000 and TotalPay>100000;


-- 15 show all the employees total pay benefits value between 505000 and 1500000 and a job 
-- title containing word 'Director' ---
select * from salaries
where TotalPayBenefits between 125000 and 1500000
and JobTitle like '%Director%';

-- 16 show all employees with totalpay benifits in desending order -----
select * from salaries order by TotalPayBenefits desc;

-- 17 show all jobtitles with an average basepay of atleast 1 lAKH and order them by
-- average basepay in descending order;

select JobTitle,avg(BasePay) from salaries
group by JobTitle having avg(BasePay)>=100000 
order by avg(BasePay) desc;

-- 18 delete specific column ----------
select * from salaries;
alter table salaries
drop column Notes;
select * from salaries;

-- 19 update the base pay of all employees with jobtitle  containing 'manager' by increasing it 10%.
update salaries
set BasePay = BasePay* 1.1
where JobTitle like '%Manager%';
select * from salaries;

-- delete all employees who have no overtime pay ----
select count(*) from salaries
where OvertimePay=0;

delete from salaries 
where OvertimePay = 0;

select count(*) from salaries
where OvertimePay = 0;