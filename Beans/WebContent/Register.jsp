<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<form action="RegisterOK.jsp" method="get">
		<table border="1">
			<tr>
				<td colspan="2">
					<h1>ȸ�� ���� ��û</h1>
					<p>* ǥ�� �׸��� �ʼ� �Է� �׸��Դϴ�.</p>
				</td>
			</tr>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="mem_uid">*</td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="mem_pwd">*</td>
			</tr>
					<tr>
				<td>��й�ȣ Ȯ��</td>
				<td><input type="password" name="mem_pwd2">*</td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="mem_name">*</td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="email" name="mem_email">*</td>
			</tr>
			<tr>
				<td>�ּ�</td>
				<td><input type="text" name="mem_addr"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="���">
					<input type="reset" value="�ٽ��Է�">
					<input type="button" value="���Խ�û">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>