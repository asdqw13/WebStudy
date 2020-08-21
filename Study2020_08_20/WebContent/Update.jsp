<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pwd = "123456";
	String sql = "update member set password=?, name=?, email=? where memberid=?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String memberid = request.getParameter("memberid");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	System.out.println(memberid);

	try
	{
		Class.forName(driver);
		System.out.println("DB OK");
		conn = DriverManager.getConnection(url, user, pwd);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, memberid);
		pstmt.executeUpdate();
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
	finally
	{
		pstmt.close();
		conn.close();
	}
	response.sendRedirect("Select.jsp");
%>