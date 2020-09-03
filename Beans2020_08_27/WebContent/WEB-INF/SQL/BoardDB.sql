drop table board;

create table board (
	b_id number(5) primary key, /*1. 글번호 */
	b_name varchar2(20), /*2. 글쓴이 */
	b_email varchar2(50), /*3. 글쓴이 메일 */
	b_title varchar2(80), /*4. 글 제목 */
	b_content varchar2(3000), /*5. 글 내용 */
	b_pwd varchar(12), /*6. 비밀번호 */
	b_date date, /*7. 글쓴 날짜 */
	b_hit number(5) default 0, /*8. 조회 횟수 */
	b_ip varchar2(15), /*9. 글쓴이의 아이피 주소 */
	b_ref number(5), /*10. 글 그룹 번호 */
	b_step number(5), /*11. 화면에 출력되는 글 위치*/
	b_level number(5)); /*12. 답변 순위*/

insert into board(b_id, b_name, b_pwd, b_email, b_title, b_content)
	values(1, '홍길동', 'hong', 'hong@hanmail.net', '연습', '지금은 연습자료입니다.');
insert into board(b_id, b_name, b_pwd, b_email, b_title, b_content)
	values(2, '이순자', 'lee', 'lee@hanmail.net', '연습', '지금은 연습자료입니다.');

alter table board add(b_fname varchar(50));
alter table board add(b_fsize number(5));

alter table board modify(b_fsize number(20));
 
select * from board;