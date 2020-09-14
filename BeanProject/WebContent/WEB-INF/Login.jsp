<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="LoginOK.jsp">
		<table border="1">
			<tr>
				<td>사용자ID</td>
				<td><input type="text" name="mem_uid"></td>
			</tr>
			<tr>
				<td>사용자PW</td>
				<td><input type="password" name="mem_upw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>