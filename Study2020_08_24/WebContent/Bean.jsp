<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
	user u=new user();
	u.setFirstname("홍");
	u.setLastname("길동");
%>

<% u.getFirstname(); %>
<% u.getLastname(); %> --%>

	<jsp:useBean id="u" class="Glory.user" scope="page"/>
	<jsp:setProperty property="firstname" name="u" value="홍"/>
	<jsp:setProperty property="lastname" name="u" value="길동"/>
	
	당신의 이름 = <jsp:getProperty property="firstname" name="u"/>
	<jsp:getProperty property="lastname" name="u"/>
</body>
</html>