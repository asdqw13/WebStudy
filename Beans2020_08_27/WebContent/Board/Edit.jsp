<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<link href="" rel="stylesheet"/>
</head>
<%
	String b_id=request.getParameter("b_id");
	BoardDBBeans db=BoardDBBeans.getInstance();
	BoardBeans board=db.getBoard(b_id);
%>
<body>
<h1>글 수정</h1>
<form action="EditOK.jsp" method="get">
	<table border="1">
		<tr>
			<td>작성자<input type="hidden" name="b_id" value="<%=b_id %>" /></td>
			<td><input type="text" name="b_name" value="<%=board.getB_name() %>" /></td>
			<td>이메일</td>
			<td><input type="email" name="b_email" value="<%=board.getB_email() %>" /></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td colspan="3"><input type="text" name="b_title" value="<%=board.getB_title() %>" /></td>
		</tr>
		<tr>
			<td colspan="4"><textarea><%=board.getB_content() %></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan="3"><input type="password" name="b_pwd" value="<%=board.getB_pwd() %>" /></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" value="글 수정" />
				<input type="reset" value="다시 작성" />
				<input type="button" value="글 목록" onclick="location.href='List.jsp'" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>