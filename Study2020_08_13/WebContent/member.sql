drop table member;

create table member
(
	id varchar2(20) primary key,
	name varchar2(20),
	pwd varchar2(20),
	age number(5),
	juso varchar2(50)
);

insert into member(id, name, pwd) values('hong', 'ȫ�浿', 'hong');
insert into member values('lee', '�⵿̱', 'lee', 18, '�뱸');

select * from member;