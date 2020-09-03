<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- c=CoreLibraries -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL TEST 01</title>
</head>
<body>
<%
	request.setAttribute("name", "Hello");
%>
<c:out value="${name }" /> <br/>
<c:out value="${param.id }" /> <br/>
</body>
</html>