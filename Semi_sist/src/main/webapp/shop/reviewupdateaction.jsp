<%@page import="data.dto.ReviewDto"%>
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
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
String content = request.getParameter("content");
String score = request.getParameter("score");
String currentPage = request.getParameter("currentPage");

ReviewDao rdao = new ReviewDao();
ReviewDto rdto = new ReviewDto();
rdto.setNum(num);
rdto.setContent(content);
rdto.setScore(score);

rdao.updateReview(rdto);

response.sendRedirect("../realindex.jsp?main=shop/shopform.jsp?currentPage="+currentPage);


%>
</body>
</html>