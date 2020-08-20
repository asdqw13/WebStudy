<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DateFormat, java.util.Date" %>
<!DOCTYPE html>
<%
	boolean sw = false;
	String message = "<h2>설정 된 쿠키 정보</h2>";
	Cookie date = null; // 방문 일자
	Cookie cnt = null; // 방문 횟수
	Cookie cook[] = request.getCookies(); // 모든 쿠키를 얻음
	
	if(cook != null)
	{
		for(int i = 0; i < cook.length; i++)
		{
			message += "쿠키 이름 : " + cook[i].getName() + "/ 쿠키 값 :" + cook[i].getValue() + "<br>";
			System.out.println("aa = " + cook[i].getName());
			if(cook[i].getName().equals("dateCookie"))
			{
				date = cook[i];
				sw = true;
			}
			else if(cook[i].getName().equals("cntCookie"))
			{
				cnt = cook[i];
			}
		}
	}
	else
	{
		message = "첫 방문을 환영합니다.<br/>";	
	}
	
	String dateValue = String.valueOf(System.currentTimeMillis());
	System.out.println(dateValue);
	
	if(!sw) // sw = false 인 경우
	{
		date = new Cookie("dateCookie", dateValue);
		date.setMaxAge(365*24*60*60); // 유효기간 365일
		date.setPath("/"); // 유효 경로 설정
		response.addCookie(date); // 쿠키추가
		
		cnt = new Cookie("cntCookie", String.valueOf(1));
		cnt.setMaxAge(365*24*60*60); // 유효기간 365일
		cnt.setPath("/");
		response.addCookie(cnt);
	}	
	else // sw = true 인 경우
	{
		long conv = Long.parseLong(date.getValue());
		int count = Integer.parseInt(cnt.getValue()) + 1;
		
		message += "<hr>마지막 방문 : " + new Date(conv) + "<br>방문 횟수 : " + count;
		
		// 쿠키에 새 값을 추가
		date.setValue(dateValue);
		date.setMaxAge(365*24*60*60); // 365일
		date.setPath("/");
		response.addCookie(date);
		
		cnt.setValue(String.valueOf(count));
		cnt.setMaxAge(365*24*60*60); // 365일
		cnt.setPath("/");
		response.addCookie(cnt);
	}
	System.out.println("msg = " + message);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= message %>
</body>
</html>