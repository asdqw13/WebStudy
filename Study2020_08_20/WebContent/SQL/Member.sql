drop table member;

create table member
(
	memberid varchar(10) not null primary key,
	password varchar(10) not null,
	name varchar(20),
	email varchar(10)
)

insert into member(memberid, password, name) values
('madvirus', '1234', '홍길동');

insert into member values
('kim', '12345', '김씨', 'kim@han');

select * from member;