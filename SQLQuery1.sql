use student;
go
create procedure example1 as
select * from EmpInfo;
select * from EmpSalary;
go
exec example1

alter procedure example1 as
select * from EmpInfo;
select * from EmpSalary;
go

create procedure example3 as
create table mytable(
id int primary key,
name varchar(20),
age int,
address varchar(20));

insert into mytable values(1,'manasa',22,'hyd');
insert into mytable values(2,'sana',22,'hyd');
insert into mytable values(3,'riya',22,'hyd');
insert into mytable values(4,'nayan',22,'hyd');
insert into mytable values(5,'karan',22,'hyd');
insert into mytable values(6,'kiran',22,'hyd');
insert into mytable values(7,'manasa',22,'hyd');

select * from example3 where age>20;

select * from mytable;
exec example3;
drop procedure example3;
drop  table mytable;

create or alter procedure example3 @aadhar bigint as
create table mytable1(
id1 int identity,
aadhar bigint
foreign key(id1) references mytable(id));
insert into mytable1 values(@aadhar);



insert into mytable1 values(5869870);
insert into mytable1 values(6860908);
insert into mytable1 values(3,3637469);
insert into mytable1 values(4,4776879);
insert into mytable1 values(5,4565788);
insert into mytable1 values(6,7886454);
insert into mytable1 values(7,7656545);

exec example3;

select * from mytable1;

drop procedure example3;

drop table mytable1;

if OBJECT_ID ('joinprocedure', 'P') is not null
drop procedure joinprocedure;
go
create procedure joinprocedure @age int, @name varchar(10) 
as
select a.id,a.name from mytable a join
mytable1 b on a.id=b.id1
where age>@age and name like @name;

execute joinprocedure 20, '%an'

drop procedure joinprocedure;

use demo;
go
alter table orders add foreign key(salesman_id) references salesman(salesman_id);


create  or alter procedure join1 @salesman_id int, @purch_amt float 
with execute as owner
as
set nocount on
select * from orders a join salesman b on a.salesman_id=b.salesman_id
where b.salesman_id>@salesman_id
and a.purch_amt>@purch_amt;

select a.ord_no,a.purch_amt,b.city,b.name from 
orders a join salesman b on a.salesman_id=b.salesman_id
where purch_amt<@purch_amt-10;

exec join1 5002,150.5

set nocount off
select * from salesman;

begin transaction
select * from orders

declare @transaction1 varchar(20)
begin transaction @transaction1
insert into orders values(70020,451.23,'2012-10-23', 3002,5003);
insert into salesman values(5011,'manasa','hyd',0.20);
commit  transaction @transaction1 

create login user1 with password = 'xw745f3s'

create  or alter procedure orderexample @ord_no int,@purch_amt float, @ord_date date, @customer_id int, @salesman_id int as 
insert into orders values( @ord_no ,@purch_amt , @ord_date , @customer_id , @salesman_id );


exec orderexample 70023,451.23,'2012-10-23', 3002,5008


insert into orders values(70021,451.23,'2012-10-23', 3002,5010);

delete t1,t2  from orders as t1 full join salesman as t2 on t1.salesman_id=t2.salesman_id where t2.salesman_id=5008;

delete t2 from orders as t1 inner join salesman as t2 on t1.salesman_id=t2.salesman_id where t2.salesman_id=5008;

delete t2  from orders as t1 full join salesman as t2 on t1.salesman_id=t2.salesman_id where t2.salesman_id=5008;reu

create or alter  procedure Mathoperation @num1 int , @num2 int as
declare @total int 
set @total=@num1+@num2
print('the total is '+str(@total));

exec Mathoperation 23,56
select * from student;

create or alter  procedure checkstudent @name varchar(10) as
if exists( select * from student where name =@name)
begin 
print('student record is present')
select * from student where name=@name;
end
else
begin
print('student record is not present')

print('create the student')
select * from student where name=@name;
end
exec checkstudent manasa

create procedure schemacheck  @inputtablename varchar(50) as
select table_name,column_name, data_type from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME=@inputtablename;

exec schemacheck orders

create procedure studentinformation @course varchar(10) as 
select (name+course) as studentcourse from student where course=@course;

exec studentinformation eee

