<%@ tag body-content="empty" pageEncoding="euc-kr" %>
<%@ attribute name="title" required="true" %>           
<%@ attribute name="level" type="java.lang.Integer" %>
<%
	String headStartTag = null;
	String headEndTag = null;
	if (level == null) {
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if (level == 1) {
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if (level == 2) {
		headStartTag = "<h2>";
		headEndTag = "</h2>";
	} else if (level == 3) {
		headStartTag = "<h3>";
		headEndTag = "</h3>";
	} else if (level == 4) {
		headStartTag = "<h4>";
		headEndTag = "</h4>";
	} else if (level == 5) {
		headStartTag = "<h5>";
		headEndTag = "</h5>";
	} else if (level == 6) {
		headStartTag = "<h6>";
		headEndTag = "</h6>";
	}
%>
<%= headStartTag %>
${title}
<%= headEndTag %>