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
   String b_email=request.getParameter("b_email");
%>
<h1>메일 보내기</h1>
<form action="mail_ok.jsp" method="get">
<table border="1">
<tr>
   <td>보내는이</td>
   <td><input type="text" name="from_name" /></td>
   <td>받는이</td>
   <td><input type="text" name="to_name" value="<%=b_email%>"/></td>
</tr>
<tr>
   <td>글제목</td>
   <td colspan="3"><input type="text" name="b_title" /></td>
</tr>
<tr>
   <td colspan="4"><textarea name="b_content"></textarea></td>
</tr>
<tr>
   <td colspan="4">
      <input type="submit" value="이메일전송" />
      <input type="reset" value="다시작성" />
      <input type="button" value="닫기" />
   </td>
</tr>
</table>

</form>
</body>
</html>