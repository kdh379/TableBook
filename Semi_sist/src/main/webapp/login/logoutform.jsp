<%@page import="data.dao.LoginDao"%>
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
<title>로그아웃 폼</title>
</head>
<body>
<%
String myid = (String) session.getAttribute("myid");
LoginDao dao = new LoginDao();
String nick = dao.getNick(myid);

%>

<b style="color: tomato; text-align: center;"><%= nick%></b>님 환영합니다!&nbsp;&nbsp;&nbsp;
<button type="button" onclick="location.href='login/logoutaction.jsp'" 
class="btn btn-danger">로그아웃</button>
<button type="button" onclick="location.href='realindex.jsp?main=gaip/mypageform.jsp'" 
class="btn btn-info">내 정보</button>


<div style=" margin-top: 30px;">
  <img alt="" src="image2/icon01.png" width="200px" align="left" >

</div>
<br><br><br>



</body>
</html>