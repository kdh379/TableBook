<%@page import="data.dao.ShopDao"%>
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
String shop_num = request.getParameter("shop_num");

ReviewDao rdao = new ReviewDao();
ReviewDto rdto = new ReviewDto();
rdto.setNum(num);
rdto.setContent(content);
rdto.setScore(score);

rdao.updateReview(rdto);

double avg = 0;
if(rdao.getTotalCount(shop_num)==0){
	avg=0;
}else{
	double sum = (double) rdao.getSumScore(shop_num);
	double tot = (double) rdao.getTotalCount(shop_num);
	avg = sum/tot;
}

ShopDao shdao = new ShopDao();
shdao.updateAvg(shop_num, avg);

int re_cnt = rdao.getTotalCount(shop_num);
shdao.updateRe_cnt(re_cnt, shop_num);


response.sendRedirect("../realindex.jsp?main=shop/shopform.jsp?currentPage="+currentPage+"&num="+shop_num);


%>
</body>
</html>