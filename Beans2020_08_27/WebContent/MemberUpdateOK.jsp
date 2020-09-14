<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 확인</title>
</head>
<body>
<jsp:useBean id="mb" class="pro.MemberBeans"/>
<jsp:setProperty property="*" name="mb"/>
<%
	System.out.print(mb.getMem_uid());
	MemberDBBeans manager=MemberDBBeans.getInstance();
	int re=manager.updateMember(mb); // re=1 수정성공
	if(re==1) {
		System.out.println("수정성공");
%>
	<script langauage="javascript">
		alert("회원정보 수정을 성공하였습니다.")
		document.location.href="main.jsp";
	</script>
<%
	}
	else {
		System.out.println("수정실패");
%>
	<script langauage="javascript">
		alert("회원정보 수정을 실패하였습니다.")
		history.back();
	</script>
<%
	}
%>
</body>
</html>