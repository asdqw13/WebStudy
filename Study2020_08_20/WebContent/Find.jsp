<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find</title>
</head>
<body>
<%
	String key = request.getParameter("key");
	String word = request.getParameter("word");
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pwd = "123456";
	/* select * from member where name = '홍길동' */
	/* select * from member where name like '%홍%' */
	String sql = "select * from member where " + key + " like '%" + word + "%'";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, pwd);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
	<h1>검색결과</h1>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<%
			while(rs.next())
			{
		%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
			</tr>
		<% 
			}
		%>
	</table>
</body>
</html>