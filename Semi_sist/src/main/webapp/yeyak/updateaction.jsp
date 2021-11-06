<%@page import="data.dto.ResDto"%>
<%@page import="data.dao.ResDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%
MultipartRequest multi = null;

try{
multi = new MultipartRequest(request ,"utf-8");    //try catch하기!

String num = multi.getParameter("num");
				
//기존의 포토명 가져오기
ResDao dao = new ResDao();
				
//multi로 모든 폼데이터 읽기
String currentPage = multi.getParameter("currentPage");


				
//dto에 저장
ResDto dto = new ResDto();

dto.setNum(num);
				
dao.updateYeyak(dto);
//방명록 목록으로 이동
response.sendRedirect("../realindex.jsp?main=yeyak/yeyaklist.jsp?currentPage="+currentPage);
}catch(Exception e){
	System.out.println("오류 메세지: "+e.getMessage());
}
%>
</body>
</html>