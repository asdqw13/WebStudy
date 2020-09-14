<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	DataSource ds=null;
	ResultSet rs=null;
	String sql="delete from member";
		
	try
	{
		Context ctx=new InitialContext(); // 초기화(Server.xml)
		ds=(DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
		conn=ds.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		pstmt.close();
		conn.close();
	}
	/* response.sendRedirect("Result.jsp?id=999"); */
%>

<jsp:forward page="Result.jsp">
	<jsp:param value="999" name="id"/>
</jsp:forward>
</body>
</html>