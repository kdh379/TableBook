<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<%
//프로젝트 경로 구하기
String root=request.getContextPath();
%>
<body>
<a href="<%=root%>/">메인</a>&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/index.jsp?main=member/memberform.jsp">회원</a>&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">방명록</a>&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">Q&A</a>&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">답변형게시판</a>&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">상품등록게시판</a>&nbsp;&nbsp;&nbsp;
</body>
</html> 
--%>


<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Responsive Drop Down Menu jQuery CSS3 Using Icon Symbol</title>
	<link rel="stylesheet" type="text/css" href="css/menu.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/function.js"></script>
</head>
<%
//프로젝트 경로 구하기
String root=request.getContextPath();
%>
<body>
<div id="wrap">
	<header>
		<div class="inner relative">
			<img class="logo" src="assets/img/logo2.png" style="height: 120px;" onclick="location.href='index.jsp'">
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
			   <div class="container">
				<input type="text" placeholder="검색어를 입력해주세요" style="position: absolute; outline:none; width: 950px; height: 45px; border: 2px solid #fff; border-radius: 45px; font-size: 15pt; padding-left: 30px; margin-top: -100px; margin-left:1200px;"/>
				<button type="submit" style="margin-top: -100px; margin-left:2160px; position: absolute; outline: none; border: none; background-color: rgb(254,225,14); width: 45px; height: 45px; border-radius: 45px;" onclick="location.href='list/searchresult.jsp';">
					<i class="fa fa-search" style="display: inline; font-size: 16pt; color: rgb(108,117,126);"></i>
				</button>
				<ul id="main-menu">
					<li><a href="index.jsp">홈</a></li>
					<li><a href="realindex.jsp?main=#/#.jsp">로그인</a></li>
					<li><a href="realindex.jsp?main=shop/questionform.jsp">입점문의</a></li>
				</ul>
				</div>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body></html>