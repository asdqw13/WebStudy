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
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="join" class="Glory.member"/>
	<jsp:setProperty property="*" name="join"/>

당신의 이름은 : <jsp:getProperty property="name" name="join"/>
당신의 주소는 : <jsp:getProperty property="address" name="join"/>
</body>
</html>