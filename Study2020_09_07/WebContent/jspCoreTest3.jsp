<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="id" value="hong" />
<c:set var="pwd" value="1234" />
<c:if test="${id=='hong' }">
	<c:out value="성공" />
</c:if>

<c:set var="man" value="t" />
<c:choose>
	<c:when test="${man=='t' }">
		<c:out value="남성" /><br/>
	</c:when>
	<c:when test="${man=='f' }">
		<c:out value="여성" /><br/>
	</c:when>
</c:choose>

<c:forEach var="i" begin="1" end="10" step="1">
	<c:out value="${i }" /><br/>
</c:forEach>

<c:forTokens var="text" items="서울,인천,대전,대구,부산,광주" delims="," varStatus="city">
	<c:out value="${text }" />
	<c:out value="${city.count }" /><br/>
</c:forTokens>

<c:import url="jspCoreTest1.jsp" var="data" />
${data }


</body>
</html>