<%@page import="pro.BoardDBBeans"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditOK</title>
</head>
<body>
<jsp:useBean id="board" class="pro.BoardBeans"/>
<jsp:setProperty property="*" name="board"/>
<%
	BoardDBBeans db=BoardDBBeans.getInstance();
	int re=db.EditBoard(board);
	if(re==1) {
		response.sendRedirect("List.jsp");
	}
	else if(re==0) {
%>
	<script language="javascript">
		alert("비밀번호가 틀렸습니다.")
		history.back();
	</script>
<%
	}
	else if(re==-1) {
%>
	<script language="javascript">
		alert("삭제를 실패하였습니다.")
		history.back();
	</script>
<%
	}
%>
</body>
</html>