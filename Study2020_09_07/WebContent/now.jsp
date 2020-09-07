<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>커스텀 태그 연습</h1>
1. 오늘의 날짜는<tf:now />입니다.<br/>
2. 헤드라인연습<br/>
<tf:header title="헤드라인연습1" />
<tf:header title="${'헤드라인연습2' }" level="2" />
<tf:header title='<%="헤드라인연습3"%>' level="3" />
<tf:header title="헤드라인연습4" level="4" />
<tf:header title="헤드라인연습5" level="5" />
<tf:header title="헤드라인연습6" level="6" />
3. select연습<br/>
<form action="result.jsp" method="get" >
<tf:select name="code" rgb="RGB모드" wb="흑백모드" rgba="RGBa모드" wba="흑백a모드" />
<tf:select name="hobby" game="게임" study="공부" tv="tv보기" play="혼자놀기" sleep="혼자쉬기" />
<button type="submit">전송</button>
</form>
4.multiple연습<br/>
<c:set var="num" value="1" />
<tf:multiple count="10">
	${num }<br/>
	<c:set var="num" value="${num+1 }" />
</tf:multiple>
5. sum연습<br/>
<tf:sum begin="1" end="10">
합계=${sum }
</tf:sum>
6. out연습
</body>
</html>