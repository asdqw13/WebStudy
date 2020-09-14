<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
<jsp:useBean id="mb" class="pro.MemberBeans"/>
<jsp:setProperty property="*" name="mb"/>
<%-- <%
	String mem_uid=request.getParameter("mem_uid"); // <%=mem_uid%> 사용
%> --%>
	<form action="MemberUpdateOK.jsp" method="get">
		<table border="1">
			<tr>
				<td colspan="2">
					<h1>회원 정보 수정</h1>
					<p>* 표시 항목은 필수 입력 항목입니다.</p>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mem_uid" value='<%=mb.getMem_uid()%>'>*</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="mem_pwd">*</td>
			</tr>
					<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="mem_pwd2">*</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="mem_name">*</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="mem_email">*</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="mem_addr"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="다시입력">
					<input type="button" value="수정안함">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>