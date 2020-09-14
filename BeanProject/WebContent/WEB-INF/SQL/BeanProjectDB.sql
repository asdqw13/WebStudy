drop table memberT;

create table memberT (
mem_uid varchar(15) primary key,
mem_pwd varchar(15) not null,
mem_name varchar(10) not null,
mem_email varchar(50),
mem_regdate date,
mem_addr varchar(100));

insert into memberT(mem_uid, mem_pwd, mem_name, mem_email)
values('100','111','홍길동', 'hong@han.com');
insert into memberT(mem_uid, mem_pwd, mem_name, mem_email)
values('1001','222','홍길동', 'hong@han.com');

select * from memberT;