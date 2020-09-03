<%@page import="pro.boardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="board" class="pro.boardBean" />
<jsp:setProperty property="*" name="board"/>
<%
/* 파일업로드 추가 ==== */
	String uploadPath="c:\\uptest"; //"c:\\uptest" 디렉토리 생성후
	int size=10*1024*1024;
	int filesize=0;
	MultipartRequest multi=new MultipartRequest(request, uploadPath,
		size, "UTF-8", new DefaultFileRenamePolicy());
		
		String filename=multi.getFilesystemName("b_fname");
		File file=multi.getFile("b_fname");        //File 객체
		
		if(file!=null) filesize=(int) file.length();    //파일의용량
		System.out.println(filesize);
		board.setB_name(multi.getParameter("b_name"));
		board.setB_email(multi.getParameter("b_email"));
		board.setB_title(multi.getParameter("b_title"));
		board.setB_content(multi.getParameter("b_content"));
		board.setB_pwd(multi.getParameter("b_pwd"));
		board.setB_ip(request.getRemoteAddr());  //클라이언트의 ip주소
		board.setB_date(new Timestamp(System.currentTimeMillis())); //현재시간
		board.setB_id(Integer.valueOf(multi.getParameter("b_id")));
		board.setB_ref(Integer.valueOf(multi.getParameter("b_ref")));
		board.setB_step(Integer.valueOf(multi.getParameter("b_step")));
		board.setB_level(Integer.valueOf(multi.getParameter("b_level")));
		board.setB_fname(filename);
		board.setB_fsize(filesize);
		boardDBBean db=boardDBBean.getInstance(); //모듈자체를 객체화
			  
		 int re=db.insertBoard(board);
		 if(re==1) response.sendRedirect("list.jsp");
		 else response.sendRedirect("write.jsp");
%>
</body>
</html>