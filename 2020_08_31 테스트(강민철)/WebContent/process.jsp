<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<%
	String name=request.getParameter("name");
	String age=request.getParameter("age");
%>
당신의 이름은 <%=name %> 이군요.<br/>
나이는 <%=age %>세 이군요.
</body>
</html>