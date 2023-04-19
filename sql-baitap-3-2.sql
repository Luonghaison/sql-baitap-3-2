create database quanlybanhank;
use quanlybanhank;

create table customer(
cid int primary key auto_increment,
cname varchar(255) not null,
cage int not null
);

create table product(
pid int primary key auto_increment,
pname varchar(255) not null,
pPrice float not null
);

create table `order`(
oid int primary key auto_increment,
odate date not null,
ototalprice float not null,
cid int,
foreign key(cid) references customer(cid)
);

create table orderdetail(
odi int,
foreign key(odi) references `order`(oid),
pid int,
foreign key(pid) references product(pid)
);



insert into customer(cname, cage ) values
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

insert into product(pname, pPrice) values
("May giat", 3),
("Tu lạnh", 5),
("Dieu hoa", 7),
("Quat", 1),
("Bep dien", 2);

insert into `order`(cID,oDate,oTotalPrice) values
(1,"2006-3-21",0),
(2,"2006-3-23",0),
(1,"2006-3-16",0);

alter table orderdetail
add column odQTY int not null;

insert into orderdetail(odi, pid, odQTY) values
(1,1,3),
(1,3,7),
(1,4,2),
 (2,1,1),
 (3,1,8),
(2,5,4),
(2,3,3);

select quanlybanhank.`order`.oid, quanlybanhank.`order`.odate, quanlybanhank.`order`.ototalprice;

select quanlybanhank.customer.cname, quanlybanhank.product.pname
from customer join quanlybanhank.`order` on customer.cid = quanlybanhank.`order`.cid
join orderdetail on orderdetail.odi = quanlybanhank.`order`.oid
join product on product.pid = orderdetail.pid;

select quanlybanhank.customer.cname from
quanlybanhank.customer where quanlybanhank.customer.cid not in (select cid from`order`);

select `order`.cid, `order`.odate,  product.pPrice, orderdetail.odQTY, product.pPrice*orderdetail.odQTY 
from `order` join orderdetail on orderdetail.odi = quanlybanhank.`order`.oid
join product on product.pid = orderdetail.pid;




