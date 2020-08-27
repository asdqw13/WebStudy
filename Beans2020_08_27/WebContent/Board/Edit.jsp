<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<link href="" rel="stylesheet"/>
</head>
<body>
<h1>글 수정</h1>
<form action="EditOK.jsp" method="get">
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="b_name"/></td>
			<td>이메일</td>
			<td><input type="email" name="b_email"/></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td colspan="3"><input type="text" name="b_title"/></td>
		</tr>
		<tr>
			<td colspan="4"><textarea></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan="3"><input type="password" name="b_pwd"/></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" value="글 쓰기"/>
				<input type="reset" value="다시 작성"/>
				<input type="button" value="글 목록" onclick="location.href='List.jsp'"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>