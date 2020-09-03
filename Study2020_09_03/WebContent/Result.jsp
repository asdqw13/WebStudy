<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="Temp.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
(1)REQUEST :
<%=request.getParameter("firstName")%>
<%=request.getParameter("lastName")%> <br/>
(2)EL :
${param.firstName} ${param.lastName} <br/>
(3)BEAN 객체 :
<%=user.getFirstName()%>
<%=user.getLastName()%> <br/>
(4)BEAN 객체 EL :
${user.firstName} ${user.lastName} <br/>
</body>
</html>