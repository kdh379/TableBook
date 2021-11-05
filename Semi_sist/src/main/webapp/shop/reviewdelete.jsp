<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap"
rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%
String currentPage = request.getParameter("currentPage");
String num = request.getParameter("num");

//주의: db삭제 뿐만아니라 업로드된 파일도 삭제!!!!!!!!!!!!!?? 스마특트게시판은 photo경로를 어케 얻어야할지 모르겟음

ReviewDao rdao = new ReviewDao();
rdao.deleteReview(num);

response.sendRedirect("../realindex.jsp?main=shop/shopform.jsp?currentPage="+currentPage);

%>
</body>
</html>