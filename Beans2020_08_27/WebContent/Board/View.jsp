<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<%
	BoardDBBeans db=BoardDBBeans.getInstance();
	String b_id=request.getParameter("b_id");
	BoardBeans board=db.getBoard(b_id);
	if(board!=null) {
%>
<body>
<h1>글 내용</h1>
<table border="1">
	<tr>
		<th>글 번호</th>
		<td><%=board.getB_id() %></td>
		<th>조회수</th>
		<td><%=board.getB_hit() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=board.getB_name() %></td>
		<th>작성일</th>
		<td><%=board.getB_date() %></td>
	</tr>
	<tr>
		<th>글 제목</th>
		<td colspan="3"><%=board.getB_title() %></td>
	</tr>
	<tr>
		<th>글 내용</th>
		<td colspan="3"><%=board.getB_content() %></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="글 수정"
			onclick="location.href='Edit.jsp?b_id=<%=board.getB_id() %>'"/>
			<input type="button" value="글 삭제"
			onclick="location.href='Delete.jsp?b_id=<%=board.getB_id() %>'"/>
			<input type="button" value="글 답변"
			onclick="location.href='Write.jsp?b_id=<%=board.getB_id() %>'"/>
			<input type="button" value="글 목록"
			onclick="location.href='List.jsp'"/>
		</td>
	</tr>
</table>
</body>
<%
} else response.sendRedirect("List.jsp");
%>
</html>