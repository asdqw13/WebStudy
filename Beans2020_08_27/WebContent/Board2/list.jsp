<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String pageNUM=request.getParameter("pageNUM"); // 현재페이지 3
   if(pageNUM==null) pageNUM="1";
   boardDBBean db=boardDBBean.getInstance(); //db는 boardDBBean의 객체
   ArrayList<boardBean> boardlist=db.listBoard(pageNUM); //전체레코드(10명)를 리턴
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd HH:mm");
   //변수 선언
   int b_id, b_hit;
   String b_title, b_name, b_email;
   Timestamp b_date;
%>
<h1>게시판</h1>
<a href="write.jsp">글쓰기</a>
<table border="1">
   <tr> 
       <th>번호</th>
       <th>글제목</th>
       <th>작성자</th>
       <th>작성일</th>
       <th>조회수</th>
   </tr>
   
<% 
for(int i=0;i<boardlist.size();i++){   //열고
	boardBean board=boardlist.get(i);
	b_id=board.getB_id();
	b_title=board.getB_title();
	b_name=board.getB_name();
	b_email=board.getB_email();
	b_date=board.getB_date();
	b_hit=board.getB_hit();
	
%>
  <tr>
     <td><%=b_id%></td>
     <td><a href="view.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM %>"><%=b_title%></a></td>
     <td><%=b_name%></td>
     <td><%=b_date%></td>
     <td><%=b_hit%></td>
  </tr>
 <%} %>
</table>

<%=boardBean.pageNumber(4) %> <br/>
</body>
</html>