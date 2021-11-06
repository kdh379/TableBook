<%@page import="data.dao.ResDao"%>
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

//주의: db삭제 뿐만아니라 업로드된 파일도 삭제
String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");

ResDao dao = new ResDao();

//삭제
dao.deleteYeyak(num);
//경로이동
response.sendRedirect("../realindex.jsp?main=yeyak/yeyaklist.jsp?currentPage="+currentPage);



%>
</body>
</html>