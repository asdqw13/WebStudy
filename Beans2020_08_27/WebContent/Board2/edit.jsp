<%@page import="pro.boardDBBean"%>
<%@page import="pro.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정 edit</title>
<link href="" rel="stylesheet" />
</head>
<%
	String pageNUM=request.getParameter("pageNUM");
	String b_id=request.getParameter("b_id");
    boardDBBean db=boardDBBean.getInstance();
    boardBean board=db.getBoard(b_id,false);
%>

<body>
<h1>글 수 정</h1>
<form action="edit_ok.jsp" method="get">
<table border="1">
   <tr>
       <td>작성자<input type="hidden" name="b_id" value="<%=b_id %>" /></td>
       <td><input type="text" name="b_name" value="<%=board.getB_name() %>" /></td>
       <td>이메일</td>
       <td><input type="text" name="b_email" value="<%=board.getB_email() %>" /></td>
   </tr>
	<tr>
       <td>글제목</td>
       <td colspan="3"><input type="text" name="b_title" value="<%=board.getB_title()%>" /></td>
   </tr>
   <tr>
       <td colspan="4"><textarea><%=board.getB_content() %></textarea></td>
   </tr>
   <tr>
      <td>암호</td>
       <td colspan="3"><input type="password" name="b_pwd" value="<%=board.getB_pwd() %>" /> </td>
   </tr>
   <tr>
       <td colspan="4">
            <input type="submit" value="글수정" />
            <input type="reset" value="다시작성" />
            <input type="button" value="글목록"  onclick="location.href='list.jsp'" />
       </td>
   </tr>
</table>
</form>
</body>
</html>