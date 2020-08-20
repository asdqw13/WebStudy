<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
폼에 데이터를 입력한 후 '전송' 버튼을 클릭 하세요.
<form action="getparm.jsp" method="get">
이름 : &nbsp; &nbsp; &nbsp;
	<input type="text" name="irum" size="10"/><br/>
주소 : &nbsp; &nbsp; &nbsp;
	<input type="text" name="juso" size="30"/><br/>
성별 : &nbsp; &nbsp; &nbsp;
	<input type="radio" name="gender" value="남자"/>남자
	<input type="radio" name="gender" value="여자"/>여자
	<br/>
좋아하는 동물:&nbsp; &nbsp; &nbsp;
	<input type="checkbox" name="pet" value="강아지"/>강아지
	<input type="checkbox" name="pet" value="고양이"/>고양이
	<input type="checkbox" name="pet" value="돼지"/>돼지
	<br/>
	<input type="submit" value="전송"/>
</form>
</body>
</html>