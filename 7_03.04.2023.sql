create table EmpNew
(Eid int primary key, Name varchar(10),
Age int, City varchar(10));

insert into EmpNew values(101,'izack',26,'Nagpur'),
						 (102,'Sneha',29,'Pune'),
						 (103,'grace',27,'Mumbai'),
						 (104,'Madhuri',25,'Sangali');

select * from EmpNew;

create table NewDept(Did int,Department varchar(10),
					Salary int,Designation varchar(10),Eid int foreign key references EmpNew(Eid));

insert into NewDept values(1,'HR',45000,'Manager',102),
						  (2,'Engg',65000,'Sr.Engg',101),
						  (3,'Account',46000,'Manager',103),
						  (4,'Technical',65000,'Engg',104);
select * from NewDept;

select * from Newdept where salary <= 50000;
select * from NewDept where Salary = 45000;
select * from NewDept where salary < 50000 and Designation = 'Manager'
select * from EmpNew where Name = 'izack' or city = 'Sangali'
select * from Empnew where city in ('Pune','Nagpur')
select * from Empnew where city not in ('sangali') and age in (26,25)
select * from NewDept where salary between 45000 and 75000;
select * from Empnew where Name  not between 'A' and 'R'
select * from EmpNew where Name like 'R%'
select * from Empnew where name like '%a'
select * from Empnew where name like 'R%n'
select * from EmpNew where name like '[ram]%'
select * from EmpNew where name like'[^a-r]%'

select*, NewSal = salary + 5000,
		Bonus = Salary+ Salary*10/100 from NewDept;
select *, AbSalary = (Salary - (salary/30)*5) from NewDept

select * from Empnew where city  in ('pune','nagpur') order by City desc;
select * from NewDept where Designation in ('manager','Engg') order by Salary
select *, NewBonus = Salary + salary*25/100,
		absalary = salary - (salary/30)*15 from NewDept;

select * from NewDept order by Salary desc
select * from EmpNew order by Eid desc

select * from EmpNew join NewDept on EmpNew.Eid = NewDept.Eid order by Salary desc, Age asc

create table A_New(id int primary key identity(10,10),name varchar(10));

insert into A_New values('izack'),
						('grace'),
						('Kat'),
						('Madhuri');
select * from A_New
alter table A_new add Age int;
update A_New set Age = 25 where id = 20;
update A_New set Age = 29 where id = 30;
update A_New set Age = 27 where id = 10;
update A_New set Age = 26 where id = 40;

alter table A_New add City varchar(10)

update A_New set City = 'Mumbai' where id = 20;
update A_New set City = 'Pune' where id = 40;
update A_New set City = 'Goa' where id = 30;
update A_New set City = 'Nagpur' where id = 10;


sp_rename 'A_New.id','Emp_id';
sp_rename 'A_New.name','Emp_Name';
select * from A_New;

select * from new_employee;
update new_employee set LastName = 'Bahetwar' where FirstName = 'izack'
select MIN(salary) as Min_salary from new_employee;
select MAX(salary) as max_sal from new_employee;
select SUM(salary) as Sum_sal from new_employee;
select AVG(salary) as AvgSal from new_employee;
select top 5 salary from new_employee order by Salary desc;
select top 3* from new_employee order by salary desc

select count(salary) from new_employee;
select count(*) from new_employee
select count(dept) from new_employee

select distinct(Dept) from new_employee
select * from new_employee
select count(distinct(LastName)) from new_employee

select city, sum(salary) as Tsal from new_employee group by City
having sum(salary)>= 20000 order by Tsal desc;

create table AA(Aid int primary key identity(10,10), Name varchar(10));

insert into AA values('izack'),('Ajay'),('Kamal'),('Nayan')

create table BB(Bid int, Dept varchar(15), Salary int, Aid int)

insert into BB values(101,'HR',45000,10)
insert into BB values(102,'Acc',65000,80)
insert into BB values(103,'Purchase',45000,70)
insert into BB values(104,'Engg',35000,30)
insert into BB values(105,'Design',50000,40)
insert into BB values(102,'Test',75000,20)

select * from AA
select * from BB

select * from AA as A full outer join BB as B on A.Aid = B.Aid order by Salary desc

select getdate() as Today
select getdate() -1 as Yesterday
select GETDATE() +1 as Tommarow

select * from Account_details

select*,DATEDIFF(YY,ACCT_OPEN_DATE,GETDATE()) as Account_open_Years from Account_details

select DATEDIFF(YY,'1993/10/17',GETDATE())

select * from new_employee order by salary asc;

--2 nd max salary
with new_table as
(select *, DENSE_RANK() over(order by salary desc) as Row_ID from new_employee)
select * from new_table where Row_ID = 2;

--4 th max salary
with new_table as
(select *, DENSE_RANK() over(order by salary desc) as Row_id from new_employee)
select * from new_table where Row_id = 4;

--4 th max salary
select max(salary) from new_employee where Salary<(select MAX(salary) from new_employee where Salary<(select MAX(salary) from
new_employee where Salary<(select MAX(salary) from new_employee)))

--4 th min salary
select min(salary) from new_employee where Salary>(select min(salary) from new_employee  where Salary>(select min(salary)
from new_employee where Salary >(select MIN(salary) from new_employee)))

with new_table as
(select *, DENSE_RANK() over (order by salary desc) as Row_id from new_employee)
select * from new_table where Row_id =5;

--3 rd max salary
with new_table as
(select *, DENSE_RANK() over(order by salary desc) as Row_id from new_employee)
select * from new_table where Row_id = 3


with abc as
(select *, ROW_NUMBER() over (order by salary desc) as Row_id from new_employee)
select * from abc where Row_id = 3;
