<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 테이블 조회</title>
</head>
<body>
<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	DataSource ds=null;
	ResultSet rs=null;
	String sql="select * from member";
		
	try
	{
		Context ctx=new InitialContext(); // 초기화(Server.xml)
		ds=(DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
		conn=ds.getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		out.print("<h1>조회결과</h1>");
		
		while(rs.next())
		{
			out.print(rs.getString(1)+"&nbsp;&nbsp;");
			out.print(rs.getString(2)+"&nbsp;&nbsp;");
			out.print(rs.getString(3)+"&nbsp;&nbsp;");
			out.print(rs.getString(4)+"<br>");
		}
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
%>
</body>
</html>