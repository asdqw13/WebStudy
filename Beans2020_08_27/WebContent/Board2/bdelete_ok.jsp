<%@page import="pro.boardDBBean"%>
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

	int b_id=Integer.valueOf(request.getParameter("b_id"));
	String b_pwd=request.getParameter("b_pwd");
	
	boardDBBean db=boardDBBean.getInstance(); 
	int re=db.deleteBoard(b_id, b_pwd);
	if(re==1){
		response.sendRedirect("list.jsp");
	}
	else if(re==0) {
%>
	    <script language="javascript">
	    	alert("비번을 맞지 않습니다.");
	    	history.back();
	    </script>
<%		
		
		} else if(re==-1){
%>
	    <script language="javascript">
	    	alert("삭제실패");
	    	history.back();
	    </script>

<%			
		}

%>
</body>
</html>