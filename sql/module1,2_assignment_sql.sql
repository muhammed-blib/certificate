use [the first and second assignment]

create table customer(
first_name nvarchar(30),
last_name nvarchar(30),
email varchar(100),
[address] varchar(100),
city varchar(10),
[state] varchar(10),
zip smallint
)
drop table customer
insert into customer values(
'mohammed','aly','muhm.aly@outlook.com','egyptcairo','cairo','egypt',11137
)
insert into customer values(
'hussein','ahmed','huss.ahmed@outlook.com','egyptmadinty','madinty','egypt',11332
)
insert into customer values(
'aly','ibrahim','aly.ibrahim@outlook.com','egyptsuez','suez','Egypt',11332
)
insert into customer values(
'hazem','ahmed','hazem.ahmed@outlook.com','egyptgiZa','giza','Egypt',17222
)
insert into customer values(
'hassan','walid','hassan.walid@outlook.com','egyptCanal','canal','Egypt',17444
)
insert into customer values(
'Gamel','walid','kamel.walid@outlook.com','america','San Jose','america',17444
)
select * from customer;

select first_name,last_name from customer

select first_name from customer where first_name like 'G%' and city = 'San Jose'

