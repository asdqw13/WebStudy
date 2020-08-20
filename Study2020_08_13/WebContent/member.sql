drop table member;

create table member
(
	id varchar2(20) primary key,
	name varchar2(20),
	pwd varchar2(20),
	age number(5),
	juso varchar2(50)
);

insert into member(id, name, pwd) values('hong', '홍길동', 'hong');
insert into member values('lee', '이기동', 'lee', 18, '대구');

select * from member;