
--Substring

select 'Rose'
select substring('Scodeen',2,4);
select * from MyEmployee;

select * from employee1
select Emp_name, SUBSTRING(Emp_name,1,3) as SuBstrinG_Name from MyEmployee;

--Concat
select *, CONCAT(FirstName,' ', LastName) as Full_Name from employee1;
select FirstName, reverse(FirstName) from employee1;
--Replicate
select REPLICATE(FirstName +'  ',4) from employee1;

--Replace
select replace(FirstName, 'S','G') from employee1;
select REPLACE('Rose','R','M');

--Trim 

select '     Class    ';
     Class    
select LTRIM('     Class    ');
Class  
select RTRIM('     Class    ');
     Class
select trim('     Class    ');
Class
select trim(FirstName) from employee1;
select ltrim(FirstName) from employee1;
select Rtrim(FirstName) from employee1;

--Convert

select * from DOJ
select convert(varchar, Join_date) from DOJ;
select convert(varchar, Join_date,1) from DOJ;
select convert(varchar, Join_date,2) from DOJ;
select convert(varchar, join_date,3) from DOJ;
select convert(varchar, Join_date,10) from DOJ;
select convert(varchar, Join_date,100) from DOJ;


--CharIndex
select * from Emp1

select CHARINDEX('@','rose@gmail.com');

select SUBSTRING(email,charindex('@',email)+1,len(email)) as DomainName from Emp1;   ---get string after @
---select substring(col_name,position vlue,length)
select Email, SUBSTRING(email,1,charindex('@',email)-1) as UserName from Emp1;    ----get string before @
select Email, SUBSTRING(email,1,charindex('@',email)-1) as UserName from Emp1;

select * from MyEmployee;
select * from MyDepartment;

select A.Emp_name,A.Gender,A.Salary,B.Dept_Name from MyEmployee as A Right join MyDepartment as B
on A.Dpt_id = B.Id
select A.Emp_name,A.Gender,A.Salary,B.Dept_Name from MyEmployee as A Right join MyDepartment as B
on A.Dpt_id = B.Id


select * from set1;
select * from set2

select * from MyEmployee;

----always pune city in top and rest one is Desc order condition
select * from MyEmployee
order by
(case
when City = 'Pune' then 0
else 1
end),
city desc