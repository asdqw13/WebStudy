<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.MemberDBBeans"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="pro.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<body>
<jsp:useBean id="mb" class="pro.MemberBeans"/>
<jsp:setProperty property="*" name="mb"/>

<%
	mb.setMem_regdate(new Timestamp(System.currentTimeMillis()));
	// String mem_uid=mb.getMem_uid();
	// MemberDBBeans manager=new MemberDBBeans();
	MemberDBBeans manager=MemberDBBeans.getInstance(); // 모듈(java) 객체생성
	
	if(manager.confirmID(mb.getMem_uid())==1) {
		System.out.print("중복되는 아이디가 존재합니다.");
%>
	<script language="javascript">
		alert("중복되는 아이디가 존재합니다.")
		history.back();
	</script>

<%
	}
	else {
		int re=manager.insertMember(mb);
		if(re==1) {
			System.out.print("가입에 성공하셨습니다.");
%>
	<script language="javascript">
		alert("가입에 성공하셨습니다.")
		document.location.href="Login.jsp";
	</script>
<%
		}
		else {
			System.out.print("가입에 실패하셨습니다.");
%>
	<script language="javascript">
		alert("가입에 실패하셨습니다.")
		history.back();
	</script>
<%
		}
	}
%>
</body>
</html>