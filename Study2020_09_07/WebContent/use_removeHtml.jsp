<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="date" value="<%=new Date() %>" />
<tf:removeHtml length="30" trail="...end" trim="true">
	<h1>1. 태그들을 제거하는 연습</h1>
	<font size="10">현재시간은${date }입니다.</font><br/>	
</tf:removeHtml>

<tf:removeHtml length="30" trim="true">
	<h1>2. 태그들을 제거하는 연습</h1>
	<font size="10">  현재시간은${date }입니다.  </font><br/>	
</tf:removeHtml>
</body>
</html>