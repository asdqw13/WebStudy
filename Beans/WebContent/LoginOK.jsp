<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, pro.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
<%
	// Login에서 넘어온 파라미터
	String mem_uid=request.getParameter("mem_uid");
	String mem_pwd=request.getParameter("mem_pwd");
	// 자바Model 객체생성
	MemberDBBeans manager=MemberDBBeans.getInstance();
	int check=manager.userCheck(mem_uid, mem_pwd);
	
	if(check==1) out.print("아이디와 비밀번호 일치");
	else if(check==0) out.print("비밀번호 불일치");
	else out.print("아이디가 존재하지 않습니다.");
	/* MemberBeans mb=manager.getMember(mem_uid); */
%>
</body>
</html>