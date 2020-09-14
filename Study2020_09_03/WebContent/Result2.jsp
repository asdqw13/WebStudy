<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result2</title>
</head>
<body>
<%
	request.setAttribute("name", "홍길동");
	request.setAttribute("id", "hong");
%>

1) : <%=request.getAttribute("name") %> <br/>
2) : ${requestScope["name"] } <br/>
3) : ${requestScope.name } <br/>
4) : ${name } <br/>

1) : <%=request.getParameter("userid") %> <br/>
2) : ${param["userid"] } <br/>
3) : ${param.userid } <br/>
</body>
</html>