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
<jsp:useBean id="board" class="pro.boardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
  boardDBBean db=boardDBBean.getInstance();
  int re=db.editBoard(board);
  if(re==1) response.sendRedirect("list.jsp");
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
	    	alert("수정실패");
	    	history.back();
	    </script>

<%			
		}

%>>
</body>
</html>