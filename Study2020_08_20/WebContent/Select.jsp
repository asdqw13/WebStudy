<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select</title>
</head>
<body>
	<h1>가입회원 명단</h1>
	<a href="InsertForm.jsp">가입 | </a>
	<a href="Select.jsp">목록보기 | </a>
	<a href="DeleteForm.jsp">선택삭제 | </a>
	<a href="DeleteAll.jsp">모두삭제</a>
	<br />
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<%
			String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String pwd = "123456";
		String sql = "select * from member";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		Class.forName(driver); // 외부의 저장 된 class파일을 현재 페이지로 가져옴.
		conn = DriverManager.getConnection(url, user, pwd);
		stmt = conn.createStatement(); // 빈 문장통.
		rs = stmt.executeQuery(sql); // executeQuery(sql) --> select from
		while (rs.next()) {
		%>
		<tr>
			<td><a href="UpdateForm.jsp"><%=rs.getString(1)%></a></td>
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