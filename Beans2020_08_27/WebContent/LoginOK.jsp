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
	int check=manager.userCheck(mem_uid, mem_pwd); // id, pwd일치 확인
	MemberBeans mb=manager.getMember(mem_uid); // id를 가져 옴
	if(mb==null) {
		System.out.println("조회결과없음");
%>
		<script language="javascript">
			alert("조회결과없음")
			history.back();
		</script>
<%
	}
	else {
		String name=mb.getMem_name();
		String id=mb.getMem_uid();
		if(check==1) { // 아이디와 비번이 일치 함
			System.out.println("id, pwd일치");
			session.setAttribute("name", name);
			session.setAttribute("id", id);
%>
		<script language="javascript">
			alert("축하합니다.")
			document.location.href="Main.jsp";
		</script>
<%	
		}
		else if(check==0) {
			System.out.println("pwd불일치");
%>
		<script language="javascript">
			alert("비밀번호가 틀립니다.")
			history.back();
		</script>
<%			
		}
	}
%>
</body>
</html>