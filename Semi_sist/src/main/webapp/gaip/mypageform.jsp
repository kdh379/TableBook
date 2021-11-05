<%@page import="data.dto.LoginDto"%>
<%@page import="data.dao.LoginDao"%>
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

<title>마이페이지</title>
</head>
<%
//id읽기
String id = request.getParameter("id");

//dao선언
LoginDao dao = new LoginDao();

//dto얻기
LoginDto dto = dao.getById(id);

%>
<body>
<b>프로필</b>
<br>
<hr>
<img alt="" src="photo/<%=dto.getPhoto()%>" class="photo" align="left"><%=dto.getNick() %>
<br>
<hr>
<button type="button" onclick="location.href='../realindex.jsp?main=login/updateform.jsp'" 
class="btn btn-info">내 정보 수정</button>

<br><br><br>
<button type="button" onclick="location.href=#" 
class="btn btn-info">예약관리</button>

<br><br><br>
<button type="button" onclick="location.href='../realindex.jsp?main=review/reviewform.jsp'" 
class="btn btn-info">리뷰관리</button>
</body>
</html>