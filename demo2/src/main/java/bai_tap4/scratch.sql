create database ss2_query_database;
use ss2_query_database;

create table category
(
    id_category int primary key auto_increment,
    name        varchar(50)
);

insert into category(name)
values ('Tự nhiên'),
       ('Xã hội'),
       ('Truyện'),
       ('Tiểu thuyết'),
       ('Khác');

create table authors
(
    id_authors int primary key auto_increment,
    name       varchar(50)
);

insert into authors (name)
values ('Nguyễn Thái Học'),
       ('Trần Minh Hoàng'),
       ('Dương Trung Quốc'),
       ('Lê Văn Hiến'),
       ('Hà Văn Minh');

create table students
(
    id_students int primary key auto_increment,
    name        varchar(50),
    birthday    date,
    class_name  varchar(50)
);

insert into students(name, birthday, class_name)
values ('Nguyễn Văn A', '1999-10-11', 'C0722G1'),
       ('Nguyễn Văn B', '1999-11-10', 'C0722G1'),
       ('Nguyễn Văn C', '1999-09-02', 'C0622G1'),
       ('Nguyễn Văn D', '1999-08-04', 'C0422G1'),
       ('Nguyễn Văn E', '1999-12-08', 'C0522G1');

create table books
(
    id_books    int primary key auto_increment,
    name        varchar(50),
    page_size   int,
    id_authors  int,
    id_category int,
    foreign key (id_authors) references authors (id_authors),
    foreign key (id_category) references category (id_category)
);

insert into books (name, page_size, id_authors, id_category)
values ('Toán', 45, 1, 1),
       ('Văn', 34, 2, 2),
       ('Sử', 56, 3, 2),
       ('Địa', 76, 4, 2),
       ('Hóa', 32, 5, 1);
CREATE INDEX idx_books_name ON books (name);
create table borrows
(
    id_borrows  int primary key auto_increment,
    id_students int,
    id_books    int,
    borrow_date date,
    return_date date,
    foreign key (id_students) references students (id_students),
    foreign key (id_books) references books (id_books)
);

insert into borrows (id_students, id_books, borrow_date, return_date)
values (1, 1, '2022-12-12', '2022-12-13'),
       (2, 2, '2022-12-12', '2022-12-13'),
       (3, 3, '2022-12-12', '2022-12-13'),
       (4, 4, '2022-12-13', '2022-12-14'),
       (5, 1, '2022-12-15', '2022-12-16');
#  Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả
select b.id_books, b.name as book_name, b.page_size, a.name as author_name, c.name as category_name
from books b
         join authors a on b.id_authors = a.id_authors
         join category c on b.id_category = c.id_category;
# Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z
select s.id_students, s.name AS student_name
from students s
         join borrows b on s.id_students = b.id_students
order by s.name asc;
#  Lấy ra  2 quyển sách được mượn nhiều nhất
select b.id_books, b.name as book_name, count(borrows.id_borrows) as borrow_count
from books b
         left join borrows on b.id_books = borrows.id_books
group by b.id_books
order by borrow_count desc
limit 2;
#  Thông kê các đầu sách được mượn nhiều nhất

select b.id_books, b.name AS book_name, count(br.id_borrows) AS borrow_count
from books b
         left join borrows br on b.id_books = br.id_books
group by b.id_books
order by borrow_count desc;
# Thông kê các đầu sách chưa được mượn
select b.id_books, b.name as book_name
from books b
         left join borrows br on b.id_books = br.id_books
where br.id_borrows is null;
#  Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ
select s.id_students, s.name as student_name, count(b.id_books) as borrow_count
from students s
         join borrows b on s.id_students = b.id_students
group by s.id_students
order by borrow_count desc;
# Lấy ra các học viên mượn sách nhiều nhất của thư viện
select s.id_students, s.name as student_name, count(b.id_books) as borrow_count
from students s
         left join borrows b on s.id_students = b.id_students
group by s.id_students, s.name
order by borrow_count;
# bài tập 5
# Tao index cho cột  title của bảng books
create index idx_books on books(name);
#  Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn
create view borrowed_books as
select b.id_books, b.name as book_name, count(br.id_borrows) as borrow_count
from books b
         join borrows br on b.id_books = br.id_books
group by b.id_books, b.name
having count(br.id_borrows) > 0;
#  Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN

create procedure add_new_books(
    in b_id_books int,
    in b_name varchar(50),
    in b_page_size int,
    in b_id_authors int,
    in b_id_category int
)
begin  insert into books(id_books, name, page_size, id_authors, id_category)
       VALUES (b_id_books,b_name,b_page_size,b_id_authors,b_id_category);
end;

