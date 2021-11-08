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
request.setCharacterEncoding("utf-8");

//프로젝트 경로 구하기
String root=request.getContextPath();
String prePage = request.getParameter("prePage");
String search = request.getParameter("search");
System.out.println("메뉴: "+prePage);
System.out.println("검색: "+search);
if(search!=null) {
	prePage += "&search=" + search;
}

//세션으로부터 id를 얻는다
String loginok=(String)session.getAttribute("loginok");

%>

<style>

html, body {

	width: 100%;
	

}

</style>
<body>
<div id="wrap">
	<header>
		<div class="inner relative" style="margin: auto;">
			<img class="logo" src="assets/img/logo2.png" style="height: 120px;" onclick="location.href='index.jsp'">
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
			<%String getMain = "escape(encodeURIComponent('list/searchresult.jsp'))"; %>
			<form action="<%=root %>/realindex.jsp" method="post">
			<!-- encodeURIComponent('list/searchresult.jsp') -->
			
			   <div class="container">
			 	  	<input type="hidden" name="main">
					<input type="text" name="search" placeholder="검색어를 입력해주세요" id="gum"/>
					<button type="submit" id="searchbtn" onclick="inputData()">
						<i class="fa fa-search" id="searchicon"></i>
					</button>
					
				</div>
			</form>
					<%
                    if(loginok==null){%>
                    <ul id="main-menu" style="position: absolute;">
					<li><a href="index.jsp">홈</a></li>
                    <li class="nav-item"><a class="nav-link" href="realindex.jsp?main=login/loginmain.jsp?prePage=<%= prePage%>">로그인</a></li>
                    <li><a href="realindex.jsp?main=shop/questionform.jsp">입점문의</a></li>
					</ul>
                    <%} else{%>
                    <ul id="main-menu" style="position: absolute;">
					<li><a href="index.jsp">홈</a></li>
                    <li class="nav-item"><a class="nav-link" href="login/logoutaction.jsp?prePage=<%= prePage%>">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="realindex.jsp?main=gaip/mypageform.jsp">마이페이지</a></li>
                    <li><a href="realindex.jsp?main=shop/questionform.jsp">입점문의</a></li>
					</ul>
                    <% }
                    %> 
			</nav>
			</div>
			<div class="clear"></div>
	</header>	
</div>    

</body>

<script type="text/javascript">

function inputData() {
	
	var searchurl = encodeURI('list/searchresult.jsp');
	$("input[name=main]").attr("value", searchurl);

}

</script>

</html>