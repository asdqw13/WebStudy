<%@page import="pro.BoardDBBeans"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteOK</title>
</head>
<body>
<jsp:useBean id="board" class="pro.BoardBeans"/>
<jsp:setProperty property="*" name="board"/>
<%
	board.setB_ip(request.getRemoteAddr()); // 클라이언트의 ip주소
	board.setB_date(new Timestamp(System.currentTimeMillis())); // 현재시간
	BoardDBBeans db=BoardDBBeans.getInstance(); // 모듈자체를 객체화
	
	int re=db.InsertBoard(board);
	if(re==1) response.sendRedirect("List.jsp");
	else response.sendRedirect("Write.jsp");
%>
</body>
</html>