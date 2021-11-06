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
<style type="text/css">
img {
	align-content: center;
	margin-left: 700px;
}
</style>
</head>
<%
/* //id읽기
String id = request.getParameter("id");

//dao선언
LoginDao dao = new LoginDao();

//dto얻기
LoginDto dto = dao.getById(id); */

String myid = (String) session.getAttribute("myid");
LoginDao dao = new LoginDao();
LoginDto dto = dao.getById(myid);
String nick = dao.getNick(myid);

%>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 마이페이지';
</script>
<br>
<br>
<b style="text-align: center;"><h2>프로필</h2></b>
<hr><br>
<% if(dto.getPhoto()!=null){%> 
<form action="realindex.jsp?main=gaip/updateform.jsp" method="post">
<input type="hidden" name="num" value="<%= dto.getNum()%>">
<img alt="" src="save/<%=dto.getPhoto()%>" class="photo" align="center">&nbsp;<%}%><%= nick%><b>(</b><%= myid%><b>)</b>&nbsp;
<button type="submit" class="btn btn-info">내 정보 수정</button>
</form>
<br>
<hr>

&nbsp;&nbsp;&nbsp;
<button type="button" style="margin-left: 700px;" onclick="location.href=#" 
class="btn btn-info">예약관리</button>
&nbsp;&nbsp;&nbsp;
<button type="button" style="margin-left: 100px;" onclick="location.href='realindex.jsp?main=review/reviewform.jsp'" 
class="btn btn-info">리뷰관리</button>
<br>
<hr>
</body>
</html>