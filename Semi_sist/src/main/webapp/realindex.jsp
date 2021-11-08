<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<title>TasteBook</title>
<!-- Favicon 즐겨찾기 아이콘(favorites icon)-->
<link rel="icon" type="image/x-icon" href="assets/logo1.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
       
</head>


<body>
<%
request.setCharacterEncoding("utf-8");
//프로젝트 경로 구하기
String root=request.getContextPath();

String mainPage="layout/main.jsp"; //기본페이지

//url을 통해서 main값을 읽어서 출력
if(request.getParameter("main")!=null){
	mainPage=request.getParameter("main");
}
%>

<%--로그인중일떄 메뉴명 로그인을 로그아웃으로 바뀌게 <div class="layout title">
	<jsp:include page="layout/title.jsp"></jsp:include>
</div> --%>

<div class="layout menu">
	<jsp:include page="layout/menu.jsp">
		<jsp:param value="<%=mainPage %>" name="prePage"/>
	</jsp:include>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage %>"></jsp:include>
</div>


	<!-- Footer-->
	<footer class="footer py-4" style="background-color: #212529; color: #fff; margin-top: 20px; padding-top: 20px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 text-lg-start">
					<dl>
						<dt style="font-size: 12pt; margin-bottom: 10pt; color: #ffc800">쌍용교육센터 5조 세미프로젝트</dt>
						<dd style="margin-left: 10px;">김도현</dd>
						<dd style="margin-left: 10px;">김보라</dd>
						<dd style="margin-left: 10px;">박여은</dd>
						<dd style="margin-left: 10px;">정지원(조장)</dd>
					</dl>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>