<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
<%=rs.getString(1)%>
&nbsp; &nbsp;
<%=rs.getString(2)%>
&nbsp; &nbsp;
<%=rs.getString(3)%>
&nbsp; &nbsp;
<%=rs.getString(4)%>
<br />
<%
	}
%>
<%-- <%=rs.getString("memberid") %> &nbsp; &nbsp;
	<%=rs.getString("password") %> &nbsp; &nbsp;
	<%=rs.getString("name") %> &nbsp; &nbsp;
	<%=rs.getString("email") %> <br/> --%>