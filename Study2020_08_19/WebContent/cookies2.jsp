<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = null;
	String value = null;
	Cookie cook[] = request.getCookies();
	for(int i=0; i<cook.length; i++)
	{
		name=cook[i].getName(); // getName() 쿠키 변수명을 가져오기
		value=cook[i].getValue(); // getValue() 쿠키 값을 가져오기
		/* out.print("<li>" + name + "=" + value + "</li>"); */
		out.print(name+" = "+URLDecoder.decode(value)+"<br/>");
	}
%>
<hr/>
<%
	String url = response.encodeURL("cookies1.jsp");
	out.println(URLDecoder.decode(cook[0].getValue()));
%>
</body>
</html>