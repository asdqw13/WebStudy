<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form action="LoginOK.jsp" method="get">
	<table border="1">
		<tr>
			<td>사용자 ID</td>
			<td><input type="text" name="mem_uid"></td>
		</tr>
		<tr>
			<td>사용자 PW</td>
			<td><input type="password" name="mem_pwd"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='Register.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>