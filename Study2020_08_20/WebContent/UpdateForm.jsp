<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateForm</title>
</head>
<body>
	<form action="Update.jsp" method="get">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
					<input type="button" value="삭제" onclick="location.href='Delete.jsp'">
					<input type="button" value="목록보기" onclick="location.href='Select.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>