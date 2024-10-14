create database book_management;
use book_management;
create table book(
                     id int primary key auto_increment,
                     name varchar(100),
                     page_size int,
                     author varchar(100)
);
insert into book (name, page_size, author) VALUES ('toán',45,'nguyễn thái học'),
                                                  ('văn',34,'trần minh hoàng'),
                                                  ('sử',56,'dương trung quốc'),
                                                  ('địa',76,'lê văn hiến'),
                                                  ('hoá',32,'hà văn minh');
select *from book;
drop database book_management;
drop table book;
DELETE FROM book
WHERE id = 5;
update book set page_size =50 where name='sử';