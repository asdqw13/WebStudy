<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글내용 view</title>
</head>
<%
      boardDBBean db=boardDBBean.getInstance();
	  String b_id=request.getParameter("b_id");
	  String pageNUM=request.getParameter("pageNUM");
	  boardBean board=db.getBoard(b_id,true);
	  if(board!=null){
%>
<body>
<h1>글 내 용</h1>
<table border="1">
   <tr> 
       <th>글번호</th>
       <td><%=board.getB_id() %></td>
       <th>조회수</th>
       <td><%=board.getB_hit() %></td>
   </tr>
   <tr> 
       <th>작성자</th>
       <td><%=board.getB_name() %></td>
       <th>작성일</th>
       <td><%=board.getB_date() %></td>
   </tr> 
   <tr> 
       <th>글제목</th>
       <td colspan="3"><%=board.getB_title() %></td>
   </tr>  
   <tr> 
       <th>글내용</th>
       <td colspan="3"><%=board.getB_content() %></td>
   </tr> 
   <tr> 
       <td colspan="4">
          <input type="button" value="글수정" 
             onclick="location.href='edit.jsp?b_id=<%=board.getB_id() %>&pageNUM=<%=pageNUM%>'">
          <input type="button" value="글삭제" 
             onclick="location.href='bdelete.jsp?b_id=<%=board.getB_id() %>&pageNUM=<%=pageNUM%>'">
          <input type="button" value="답변글" 
             onclick="location.href='write.jsp?b_id=<%=board.getB_id() %>&pageNUM=<%=pageNUM%>'">
          <input type="button" value="글목록" onclick="location.href='list.jsp'">
       </td>
   </tr> 
</table>
</body>
<%
} else response.sendRedirect("list.jsp");
%>

</html>