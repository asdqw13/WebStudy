<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="" rel="stylesheet" />
</head>
<%
//답변글 때문에~~
   String b_name="", b_title="";
   int b_ref=0,b_step=0,b_level=0, b_id=0;
   
   String pageNUM=request.getParameter("pageNUM");  //현재페이지 3
   
   if(request.getParameter("b_id")!=null){
	   b_id=Integer.valueOf(request.getParameter("b_id"));
   }
   boardDBBean db=boardDBBean.getInstance();
   boardBean board=db.getBoard(Integer.valueOf(b_id).toString(), false);   //?
	   if(board!=null) {
		    b_name=board.getB_name();
	   		b_title=board.getB_title();
	   	    b_ref=board.getB_ref();
	        b_step=board.getB_step();
	   		b_level=board.getB_level();
   	}
   
%>
<body>
<h1>글올리기</h1>
<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
<table border="1">
   <tr>
       <td>작성자</td>
       <td>
       <input type="hidden" name="b_id" value="<%=b_id %>" />     
       <input type="hidden" name="b_ref" value="<%=b_ref %>" />
       <input type="hidden" name="b_step" value="<%=b_step %>" />
       <input type="hidden" name="b_level" value="<%=b_level %>" />
       
       <input type="text" name="b_name" /></td>
       <td>이메일</td>
       <td><input type="text" name="b_email" /></td>
   </tr>
	<tr>
       <td>글제목</td>
       <td colspan="3">
       <% if(b_id!=0)  { %> 
       <input type="text" name="b_title" value="[답변:]<%=b_title%>"/>
       <% } else { %>
       <input type="text" name="b_title" />
       <% } %>
       </td>
   </tr>
   <tr>
       <td colspan="4"><textarea name="b_content"></textarea></td>
   </tr>
   <tr>
       <td>파일첨부</td>
       <td><input type="file" name="b_fname"></td>
   </tr>
   <tr>
      <td>암호</td>
       <td colspan="3"><input type="text" name="b_pwd" /></td>
   </tr>
   <tr>
       <td colspan="4">
            <input type="submit" value="글쓰기" />
            <input type="reset" value="다시작성" />
            <input type="button" value="글목록"  onclick="location.href=''"/>
       </td>
   </tr>
</table>
</form>
</body>
</html>