<%@page import="pro.BoardDBBeans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteOK</title>
</head>
<body>
<% 
	int b_id=Integer.valueOf(request.getParameter("b_id"));
	String b_pwd=request.getParameter("b_pwd");
	
	BoardDBBeans db=BoardDBBeans.getInstance();
	int re=db.DeleteBoard(b_id, b_pwd);
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