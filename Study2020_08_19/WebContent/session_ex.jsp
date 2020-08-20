<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Integer count = (Integer)session.getAttribute("count");
	
	if(count == null)
	{
		count = 1;
	}
	else
	{
		count = count + 1; //1씩증가
	}
	
	session.setAttribute("count", count); //서버->count속성->count값(1, 2, 3,...)이 세팅(서버에 고객정보 저장)
	
	out.println("방문 횟수: "+count+"<BR>");
	out.println("<P>");
	out.println("<H3>세션 정보 :</H3>");
	
	Enumeration names = session.getAttributeNames(); //서버에 저장된 속성명을 가져옴 -> name객체로
	
	String s_name ="";
	
	while(names.hasMoreElements()) // 값이 있는지
	{
		s_name = (String)names.nextElement(); // next로 가져옴
		out.println("세션변수명 ("+ s_name +")의 값 : "+ ((Integer)session.getAttribute(s_name)).intValue()
		+"<BR><BR>");
	}
	
	out.println("세션 ID: " + session.getId() + "<BR>");
	out.println("세션 생성: " + session.isNew() + "<BR>");
	out.println("생성 시간: " + session.getCreationTime());
	out.println("<I>(" + new Date(session.getCreationTime()) + ")</I><BR>");
	out.println("마지막 참조 시간: " + session.getLastAccessedTime());
	out.println("<I>(" + new Date(session.getLastAccessedTime()) + ")</I><BR>");
	out.println("세션 요청 여부(쿠키): " + request.isRequestedSessionIdFromCookie() + "<BR>");
	out.println("세션 유효 여부: " + request.isRequestedSessionIdValid() + "<BR>");
%>
</body>
</html>