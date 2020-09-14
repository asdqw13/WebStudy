<%@ page language= "java" contentType="text/html; charset=UTF-8"
pageEncoding= "UTF-8"%>
<%@ page import= "java.io.*"%>
<%
InputStream is = request.getInputStream();
BufferedReader br = new BufferedReader(new InputStreamReader(is));
out.println("<h3> 읽어온 정보 </h3>");
String str = null;
while((str = br.readLine()) != null){
out.println(str);
}
%>