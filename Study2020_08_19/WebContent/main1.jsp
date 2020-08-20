<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String checkName="";
	String checkId="";
	
	checkName=(String)session.getAttribute("s_Name");
	
	if(checkName==null)
	{
		response.sendRedirect("login1.jsp");
	}
	checkId=(String)session.getAttribute("s_Id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=checkName %>(<%=checkId %>)님, 로그인 상태입니다.
	<input type="button" value="로그아웃" onclick="location.href='logout1.jsp'">
</body>
</html>