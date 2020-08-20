<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");

	String userID="hong"; //db에서 가져옴
	String userPWD="1234"; //db에서 가져옴
	String userNAME="홍길동";
	
	// db에서 id에 해당하는 사람의 비밀번호를 가져 옴
	if(id.equals(userID) && pwd.equals(userPWD))
	{
		session.setAttribute("s_Name", userNAME); // 세션정보를 서버에 셋팅
		session.setAttribute("s_Id", userID);
		response.sendRedirect("main1.jsp"); // 홈페이지로 이동
	}
	else
	{
		response.sendRedirect("login1.jsp");
	}
%>