<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String memberID = request.getParameter("memberID");
	String memberPW = request.getParameter("memberPW");
	String memberNAME = request.getParameter("memberNAME");
	String memberEMAIL = request.getParameter("memberEMAIL");
%>
<table border=1>
	<tr>
		<td>아이디</td>
		<td><%=memberID %></td>
	</tr>
	<tr>
		<td>암호</td>
		<td><%=memberPW %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=memberNAME %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=memberEMAIL %></td>
	</tr>
</table>
</body>
</html>