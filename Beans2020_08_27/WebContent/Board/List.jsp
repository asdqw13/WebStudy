<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
<%
	BoardDBBeans db=BoardDBBeans.getInstance(); // db는 BoardDBBeans의 객체
	ArrayList<BoardBeans> BoardList=db.ListBoard(); // 전체레코드(10명)를 리턴
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd HH:mm");
	// 변수 선언
	int b_id, b_hit;
	Timestamp b_date;
	String b_title, b_name, b_email;
%>

<h1>게시판</h1>
<a href="Write.jsp">글 쓰기</a>
<table border="1">
	<tr>
		<th>글 번호</th>
		<th>글 제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
<%
for(int i=0;i<BoardList.size();i++) {
	BoardBeans board=BoardList.get(i);
	b_id=board.getB_id();
	b_title=board.getB_title();
	b_name=board.getB_name();
	b_date=board.getB_date();
	b_hit=board.getB_hit();
%>
	<tr>
		<td><%=b_id %></td>
		<td><a href="View.jsp?b_id=<%=b_id%>"><%=b_title %></a></td>
		<td><%=b_name %></td>
		<td><%=b_date %></td>
		<td><%=b_hit %></td>
	</tr>
	<%} %>	
</table>
</body>
</html>