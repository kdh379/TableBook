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
.submit {
	margin-top: 30px;
	width: 80%;
}

.submit input {
	width: 10%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
	box-shadow: 1px 1px;
}
</style>
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
<br>
<br>
<b style="text-align: center;"><h2>회원가입이 완료되었습니다.</h2></b>
<hr><br>
<div style="margin: 0 auto; width: 100%;" align="center">
    <img alt="" src="image2/tastebook_logo.png" style="width: 10%"><br><br>
      <b style="text-align: center; font-size: 11pt;"><i class="fas fa-heart"></i>&nbsp;
      <%=nick%>님의 테이스트북 회원 가입을 축하합니다&nbsp;<i class="fas fa-heart"></i></b>
    
<!--    <button type="button" class="btn btn-info" onclick="location.href='realindex.jsp?main=login/loginmain.jsp'">Login</button>  
    <button type="button" class="btn btn-info" onclick="location.href='index.jsp'">Home</button>  
     <button type="button" class="btn btn-info" onclick="location.href='realindex.jsp?main=gaip/gaiplist.jsp'">List</button>
	<button type="button" style="width: 80px; height: 35px; background-color: rgb(254,225,14); color: rgb(108,117,126); 
	border: none; border-radius: 10px; box-shadow: 1px 1px; font-size: 10pt; margin-top: 10px;" onclick="location.href='realindex.jsp?main=login/loginmain.jsp'">Login</button>
	<button type="button" style="width: 80px; height: 35px; background-color: rgb(254,225,14); color: rgb(108,117,126); 
	border: none; border-radius: 10px; box-shadow: 1px 1px; font-size: 10pt; margin-top: 10px;" onclick="location.href='index.jsp'">Home</button>
 -->
    
    <div class="submit" align="center">
				<input type="submit" value="Login" onclick="location.href='realindex.jsp?main=login/loginmain.jsp'">&nbsp;&nbsp;
				<input type="submit" value="Home" onclick="location.href='index.jsp'">
			</div>
			<!-- <div class="submit" align="center">
				
			</div> -->
	<br><br>
</div>
</body>
</html>