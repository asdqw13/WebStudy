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
	String name=(String) session.getAttribute("name");
	String id=(String) session.getAttribute("id");
	if(name==null) {
		response.sendRedirect("Login.jsp");
	}
%>
<form action="Logout.jsp" method="get">
	<table border="1">
		<tr>
			<td>안녕하세요<%=name %>님</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="로그아웃">
				<input type="button" value="회원정보변경" onclick="location.href='MemberUpdate.jsp?mem_uid=<%=id %>'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>