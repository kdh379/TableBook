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

</head>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 회원가입';
</script>
<%
request.setCharacterEncoding("utf-8");
//id를 읽는다
String id=request.getParameter("id");

//dao선언
LoginDao dao=new LoginDao();
//아이디에 대한 이름을 얻는다
String nick=dao.getNick(id);

%>

<div style="margin: 0 auto; width: 100%">
    <img alt="" src="image2/icon01.png">
      <b><%=nick%>님의 회원 가입을 축하합니다</b>
      <br><br>
    
    <button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginmain.jsp'">Login</button>  
    <button type="button" class="btn btn-info" onclick="location.href='index.jsp'">Home</button>  
   <!--  <button type="button" class="btn btn-info" onclick="location.href='realindex.jsp?main=gaip/gaiplist.jsp'">List</button> -->
</div>
</body>
</html>