create table employee1
(EID int,
FirstName varchar(20),
LastName varchar(20),
Loc varchar(20),
Dept varchar(20),
salary int)

insert into employee1 values (1,'Rohan','Mane','Sangali','HR',15000)
insert into employee1 values (2,'Sheetal','Chavan','Parbhani','Finance',25000)
insert into employee1 values (3,'Amit','Patil','Latur','HR',16000)
insert into employee1 values (4,'Riya','Verma','Pune','Account',20000)
insert into employee1 values (5,'Sita','Sharma','Patna','HR',15000)
insert into employee1 values (6,'Kirti','Gold','Solapur','Staffing',35000)
insert into employee1 values (7,'Sohan','Jadhav','Miraj','Account',45000)
insert into employee1 values (8,'Priyanka','Sharma','Nagpur','Finance',46000)
insert into employee1 values (9,'Virat','Patil','Jaipur','Staffing',34000)
insert into employee1 values (10,'Sohil','Khan','Mumbai','HR',33000)
insert into employee1 values (11,'Ronit','Patil','Miraj','Admin',NULL)

select * from employee1
select * from employee1 where Loc = 'Pune'
select * from employee1 where Loc= 'mumbai'
select * from employee1 where loc != 'mumbai'
select * from employee1 where salary = 25000;
select * from employee1 where salary > 20000;
select * from employee1 where salary >= 20000;
select * from employee1 where salary<=25000;


--logical operator  AND/OR
select * from employee1 where loc = 'Mumbai' and salary = 22000;
select * from employee1 where loc = 'Mumbai' and salary = 33000;
select * from employee1 where loc = 'pune' or salary = 45000;
select * from employee1 where EID = 5 or salary>25000
select * from employee1 where loc = 'patna' and salary!=35000;
select * from employee1 where loc = 'patna' or salary<=35000;


--IN / NOT IN multiple values
select * from employee1 where Loc in ('sangali','mumbai','pune');
select * from employee1 where salary not in (25000,45000) and loc != 'sangali';
select * from employee1 where Dept in ('HR','Account') and salary<25000;

--Between operator

select * from employee1 where salary between 30000 and 50000 order by salary asc;
select * from employee1 where FirstName between 'A' and 'R'
select * from employee1 where EID between 1 and 5 and salary<=20000;
select * from employee1 where EID not between 1 and 5

--like operator
select * from employee1 where FirstName like 's%';     --firstname start with s char
select * from employee1 where FirstName like '%l';	   -- firstname end with l char
select * from employee1 where FirstName like 'R%n';    --firstname start with R and end with n
select FirstName, LastName,salary from employee1 where LastName like 's%a';
select * from employee1 where FirstName like '%o%';     -- o char in between firstname
select * from employee1 where FirstName like '[RS]%';   ---firstname start with R and S seperately
select * from employee1 where FirstName not like '[RS]%' ---firstname not start with R and S
select * from employee1 where FirstName like '[^RS]%'    ---firstname not start with R and S
select * from employee1 where FirstName like '[A-R]%'    --- firstname start with char from A to R
select * from employee1 where FirstName like '[^A-R]%'   ------ firstname not start with char from A to R

---Arithmatic Operation
select*, Bonus = salary+5000,
		 Deduct_sal = salary - 5000 from employee1;

select*, new_sal = salary+(salary*10/100) from employee1;
select *, new_sal = salary+(salary*15/100) from employee1; ----15% salary increament
select*, LOP = salary-((salary/30)*2) from employee1;   ---LOP = loss of pay 2 days salary 
select * from employee1 order by salary


--order by operation

select * from employee1 order by salary asc;
select * from employee1 order by salary desc;

select * from employee1 where loc in ('Pune','mumbai','nagpur') order by salary asc;

select * from employee1 order by Dept asc, salary desc;

delete employee1 where EID = 4
delete employee1 where loc = 'latur';
delete employee1 where LastName = 'Gold';
delete from employee1 where LastName = 'khan';

create table T(id int primary key,ename varchar(10) not null,price int default 0);
drop table T
select * from T;

insert into T values(2,'raman',150);
alter table T alter column ename varchar(10);
alter table T add Nemp varchar(10);
alter table T drop column Nemp;
alter table T add Nemp varchar(10)
