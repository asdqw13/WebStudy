<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<% 
	String b_id=request.getParameter("b_id");
	System.out.println(b_id);
%>
<body>
<h1>글 삭제</h1>
<form action="DeleteOK.jsp" method="get">
	<table border="1">
		<tr>
			<td colspan="2">비밀번호를 입력하세요.</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="b_id" value="<%=b_id %>">
				<input type="password" name="b_pwd">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글 삭제"/>
				<input type="reset" value="다시 입력"/>
				<input type="button" value="글 목록" onclick="location.href='List.jsp'"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>