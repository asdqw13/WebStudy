<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>파일업로드</h1>
<form action="uploadProc2.jsp" method="post" enctype="multipart/form-data" >
	<table border="1">
		<tr><td>파일선택</td><td><input type="file" name="fname" value="선택" ></td></tr>
		<tr><td>사용자</td><td><input type="text" name="username" ></td></tr>		
		<tr><td colspan="2"><input type="submit" value="파일업로드" ></td></tr>
	</table>
</form>
</body>
</html>