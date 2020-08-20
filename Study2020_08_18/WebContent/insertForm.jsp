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
	String memberNAME=request.getParameter("memberNAME");
%>
<form action="insertResult.jsp" method="get" name="insertForm">
<table border=1>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="memberID"/></td>
		<td>암호</td>
		<td><input type="password" name="memberPW"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="memberNAME"/></td>
		<td>이메일</td>
		<td><input type="email" name="memberEMAIL"/></td>
	</tr>
	<tr>
		<td colspan="4"><input type="submit" value="삽입"/></td>
	</tr>
</table>
</form>
</body>
</html>