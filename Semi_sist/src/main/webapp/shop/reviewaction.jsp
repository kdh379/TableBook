<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
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

String login_num = request.getParameter("login_num");
String shop_num = request.getParameter("shop_num");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String score = request.getParameter("score");

ReviewDto rdto = new ReviewDto();
rdto.setLogin_num(login_num);
rdto.setShop_num(shop_num);
rdto.setContent(content);
rdto.setWriter(writer);
rdto.setScore(score);

System.out.println(login_num);
System.out.println(shop_num);
System.out.println(content);
System.out.println(writer);
System.out.println(score);

ReviewDao rdao = new ReviewDao();
rdao.insertReview(rdto);

double avg = 0;
if(rdao.getTotalCount(shop_num)==0){
	avg=0;
}else{
	avg = rdao.getSumScore(shop_num)/rdao.getTotalCount(shop_num);
}


ShopDao shdao = new ShopDao();
shdao.updateAvg(shop_num, avg);

int re_cnt = rdao.getTotalCount(shop_num);
shdao.updateRe_cnt(re_cnt, shop_num);


response.sendRedirect("../index.jsp");
%>


</body>
</html>