<%@page import="data.dao.ResDao"%>
<%@page import="data.dto.ResDto"%>
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
//세션으로부터 db에 저장할 로그인num 얻기
String login_num = (String) session.getAttribute("login_num");


MultipartRequest multi = null;

try{
multi = new MultipartRequest(request,"utf-8");    //try catch하기!

//multi로 모든 폼데이터 읽기
String content = multi.getParameter("content");

//dto에 저장
ResDto dto = new ResDto();
dto.setLogin_num(login_num);
//dto.setPaymentdate(paymentdate);
		
//dao선언
ResDao dao = new ResDao();

dao.insertRes(dto);
//예약정보 목록으로 이동
response.sendRedirect("../realindex.jsp?main=yeyak/yeyaklist.jsp");
}catch(Exception e){
	System.out.println("오류 메세지: "+e.getMessage());
}
%>
</body>
</html>