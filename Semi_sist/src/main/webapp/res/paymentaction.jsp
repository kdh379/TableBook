<%@page import="data.dao.ResDao"%>
<%@page import="data.dto.ResDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src = "https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<%
String login_num; //로그인 번호
String shop_name = request.getParameter("shop_name"); //가게 상호명
String res_date = request.getParameter("res_date"); //예약날짜
String persons = request.getParameter("persons"); //인원수
String price = request.getParameter("price"); //결제금액

//세션으로 부터 ID 얻기
//ID를 이용해서 로그인 번호 불러오기

ResDto dto = new ResDto();

//dto.setLogin_num(login_num);
dto.setShop_name(shop_name);
dto.setRes_date(res_date);
dto.setPersons(persons);
dto.setPrice(price);

ResDao dao = new ResDao();
dao.insertRes(dto);

response.sendRedirect("completeform.jsp");
%>
</body>
</html>