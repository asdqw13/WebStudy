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
	String irum=request.getParameter("irum");
	String juso=request.getParameter("juso");
	String gender=request.getParameter("gender");
	String pet[]=request.getParameterValues("pet");
%>

<%=irum %>님, 반갑습니다.<br/>
당신의 주소는? <%=juso %><br/>
당신의 성별은? 
<%
	if(gender.equals("남자")) out.print("남자");
	else out.print("여자");
%><br/>
당신이 좋아하는 동물은? 
<%
	for(int i=0; i<pet.length; i++)
	{
		if(i==0) out.print("강아지");
		else if(i==1) out.print("고양이");
		else out.print("돼지");
	}
%><br/>
<%
	response.sendRedirect("insertFrom.jsp");
%>
</body>
</html>