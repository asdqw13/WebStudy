<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pwd = "123456";
	String sql = "insert into member(memberid, password, name, email) values(?, ?, ?, ?)";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	String memberid = request.getParameter("memberid");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	/* 	System.out.println(memberid); */
	try
	{
		Class.forName(driver); // 외부의 저장 된 class파일을 현재 페이지로 가져옴.
		conn = DriverManager.getConnection(url, user, pwd);
		pstmt = conn.prepareStatement(sql); // 준비 된 문장통.
		pstmt.setString(1, memberid); // 1번 물음표에 memberid 값을 대입
		pstmt.setString(2, password); // 2번 물음표에 password 값을 대입
		pstmt.setString(3, name); // 3번 물음표에 name 값을 대입
		pstmt.setString(4, email); // 4번 물음표에 email 값을 대입
		pstmt.executeUpdate(); // executeUpdate() --> insert into, update set, delete from
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