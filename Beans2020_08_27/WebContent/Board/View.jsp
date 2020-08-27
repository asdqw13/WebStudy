<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
<h1>글 내용</h1>
<table border="1">
	<tr>
		<th>글 번호</th>
		<td></td>
		<th>조회수</th>
		<td></td>
	</tr>
	<tr>
		<th>작성</th>
		<td></td>
		<th>작성일</th>
		<td></td>
	</tr>
	<tr>
		<th>글 제목</th>
		<td colspan="3"></td>
	</tr>
	<tr>
		<th>글 내용</th>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="글 수정" onclick="location.href='Edit.jsp'"/>
			<input type="button" value="글 삭제" onclick="location.href='Delete.jsp'"/>
			<input type="button" value="글 답변" onclick="location.href='Write.jsp'"/>
			<input type="button" value="글 목록" onclick="location.href='List.jsp'"/>
		</td>
	</tr>
</table>
</body>
</html>