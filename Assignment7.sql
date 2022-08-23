use student;
go
create or alter procedure employeeinformation @baseoffice varchar(10) as 
select EmpId,Name,BaseOffice from EmpInfo where BaseOffice=@baseoffice;

select * from results;

insert into results values('mansa',1,90,87,76,97,87,' ');
insert into results values('sana',2,92,77,56,97,67,' ');
insert into results values('tina',3,90,37,76,57,81,' ');
insert into results values('karan',4,91,87,71,90,87,' ');
insert into results values('nayan',5,90,43,76,76,87,' ');
insert into results values('shriya',6,90,98,76,97,87,' ');
insert into results values('priya',7,90,27,76,91,87,' ');
insert into results values('sai',8,90,61,76,97,27,' ');
insert into results values('harsha',9,54,87,76,43,87,' ');
insert into results values('rahul',10,65,65,76,32,87,' ');

create or alter  procedure rankdetails as
select sum(Maths+Economics+Commerce+English+ComputerScience) as total,id from results group by id order by total desc;

exec rankdetails