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
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
%>
<%=name %><br><%=id %><br><%=pw %> --%>

<jsp:useBean id="log" class="Glory.login"/>
<jsp:setProperty property="name" name="log"/>
<jsp:setProperty property="id" name="log"/>
<jsp:setProperty property="pw" name="log"/>

<%
	if(!log.checkid()) out.print("로그인 실패");
	else out.print("로그인 성공");
%>

<jsp:getProperty property="name" name="log"/>
<jsp:getProperty property="id" name="log"/>
<jsp:getProperty property="pw" name="log"/>
</body>
</html>