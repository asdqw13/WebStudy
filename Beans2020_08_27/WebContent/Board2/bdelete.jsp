<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제 bdelete</title>
</head>
<%
String pageNUM=request.getParameter("pageNUM");
String b_id=request.getParameter("b_id");
System.out.println(b_id);
%>

<body>
<h1>글삭제하기</h1>
<form action="bdelete_ok.jsp" method="get">
<table border="1">
   <tr>
       <td colspan="2">암호를 입력하세요</td>
   </tr>
   <tr>
       <td>암호</td>
       <td>
       <input type="hidden" name="b_id" value="<%=b_id%>" /> 
       <input type="text" name="b_pwd"></td>
   </tr>
   <tr>
       <td colspan="2">
            <input type="submit" value="글삭제" />
            <input type="reset" value="다시입력" />
            <input type="button" value="글목록" onclick="location.href='list.jsp'"/>
       </td>
   </tr>
</table>
</form>
</body>
</html>