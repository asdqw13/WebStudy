<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pwd = "123456";
String sql = "delete from member where memberid=? and password=?";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
%>
<%
	String memberid = request.getParameter("memberid");
String password = request.getParameter("password");
try {
	Class.forName(driver); // 외부의 저장 된 class파일을 현재 페이지로 가져옴.
	conn = DriverManager.getConnection(url, user, pwd);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, memberid);
	pstmt.setString(2, password);
	pstmt.executeUpdate();
} catch (Exception e) {
	System.out.println(e);
} finally {
	pstmt.close();
	conn.close();
}
response.sendRedirect("Select.jsp");
%>