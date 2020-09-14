<%@ tag body-content="scriptless" pageEncoding="euc-kr" %>
<%@ attribute name="length" type="java.lang.Integer" %>
<%@ attribute name="trail" %>
<%@ attribute name="trim" %>

<jsp:doBody var="content" scope="page" />
<%
	String content = (String)jspContext.getAttribute("content");
	if (trim != null && trim.equals("true")) {
		content = content.trim();
	}
	System.out.println("������:"+content);
	content = content.replaceAll(
		"<(/)?([a-zA-Z1-9]*)(\\s[a-zA-Z1-9]*=[^>]*)?>", ""); 
	System.out.println("������:"+content);
	
	if (length != null && length.intValue() > 0 &&
		content.length() > length.intValue()) {
		content = content.substring(0, length.intValue()); 
		if (trail != null) {
			content = content + trail;
		}
	}
	System.out.println("���ڸ�ŭ:"+content);
%>
<%= content %>